# Smoke Test Plan Template — {案件名稱}

> **層級**：L2 整合測試（per [模組 11 §1.2](../framework/modules/11-acceptance-benefits-operations.md)）
> **執行**：每次 release / Phase 1 末 / Phase 3 Go-Live / 平台緊急 patch 後
> **目標時長**：**30 min 內**跑完（不過就 fail-fast / rollback、不耗在 deep test）

---

## 用途

填這個 template 產對應案件的 smoke test plan。
**何時跑**：
- 每次平台 release（per 模組 11 §4.3）
- Phase 1 末整合測試啟動
- Phase 3 Pilot 啟動前
- 緊急 patch 後（per 模組 11 §4.3 ad hoc）
- DR drill 後 failover 驗

**不是用來取代 UAT**：smoke test = **快速 sanity check**「平台沒掛」、UAT = end-user 場景驗收。

---

## 1. 範圍

### 在範圍（5-10 個 critical path）

只測「平台不能掛」的關鍵路徑、別的留給 UAT / 整合測試 / unit test：

| Smoke ID | 場景 | 對應 critical service |
|---|---|---|
| SMOKE-01 | 用戶登入（first auth） | Auth / Cognito / OIDC |
| SMOKE-02 | 主 page 載入 + 主要 API call | API Gateway + Backend |
| SMOKE-03 | DB read（含 tenant filter） | DB + middleware |
| SMOKE-04 | 寫入操作（含 audit log） | DB write + audit |
| SMOKE-05 | 主要外部整合（{e.g. IoT MQTT / 第三方 API}） | External integration |
| SMOKE-06 | 報表 / 月報生成（如有 cron job）| Cron / Lambda |
| SMOKE-07 | Email / 通知（如有）| SES / SMTP / SNS |
| SMOKE-08 | 跨 region failover（DR drill 才測）| DR + multi-region |

### 不在範圍

| 不在 smoke 因為 | 移到哪測 |
|---|---|
| End-user 操作場景 / UI 細節 | L3 UAT |
| 功能完整測 / edge case | L1 unit / L2 整合測試 |
| 效能 / 負載測試 | 獨立 load test |
| 安全 / 越權測 | 獨立 SAST / pen test |

---

## 2. Entry Criteria

跑 smoke 前必滿足：

- [ ] **Release 已部署到 target environment**（staging / production / DR site）
- [ ] **基本 health endpoint 200 OK**（`/health` / `/ping` / 等）
- [ ] **CI/CD pipeline pass**（build + unit test green）
- [ ] **DB migration 已跑完**（如有）+ migration log 無 error
- [ ] **環境變數 / Secrets 已設**（per 案件 secrets-management.md）
- [ ] **Monitoring 已 ready**（CloudWatch / Sentry / 等接收 smoke 期間錯誤）

---

## 3. Exit Criteria

通過 smoke = **5-10 個 case 全部 PASS** + **30 min 內跑完** + **無 P1 / P2 alert**。

| 通過後 | 動作 |
|---|---|
| 5-10 case 全 PASS | → release 算 stable、繼續正常流程 |
| 任一 P1 fail | → **立即 rollback**（per [deployment-runbook-template.md](deployment-runbook-template.md) rollback 流程）|
| P2 fail | → 視業務影響、雙方 PM 決定 rollback 或 hotfix |
| P3 fail | → backlog 排修、不阻 release |

---

## 4. 角色 + 環境

| 角色 | 跑哪些 case |
|---|---|
| **DevOps / SRE**（主責）| 全部 5-10 case + monitor watch |
| **後端 engineer**（standby）| 出現 P1 / P2 fail 時 root cause |
| **客戶 / 對方代表**（如為聯名 / staging UAT 期）| 觀察 + sign-off「smoke 通過」 |

**環境**：
- Release type → environment：
  - 主 release → production
  - Hotfix → 先 staging → production
  - DR drill → DR site

---

## 5. Smoke Case 詳細

### SMOKE-01：用戶登入（first auth）

| 欄 | 內容 |
|---|---|
| **嚴重度** | P1（fail 必 rollback）|
| **預估時間** | 3 min |
| **自動化？** | ✅ 可（e.g. Playwright headless / curl + JWT decode）|

**Steps**：
1. {進入登入 page、輸入 test 帳號 / dummy credentials}
2. 提交、確認回 IdToken / Session
3. 用 token 打 1 個受保護 API（e.g. `/api/me`）
4. 確認回 user info

**Expected**：
- ✅ Login response 200 + 含 token
- ✅ Protected API 200 + 含 user info
- ✅ JWT 過期時間 = expected window

**Fail trigger**：
- ❌ 任一 step timeout > 5s
- ❌ Auth provider 5XX

---

### SMOKE-02：主 page 載入 + 主要 API call

| 欄 | 內容 |
|---|---|
| **嚴重度** | P1 |
| **預估時間** | 3 min |
| **自動化？** | ✅ 可（curl + status code check）|

**Steps**：
1. GET `{平台主 URL}` → 確認 200 + HTML size > 0
2. 進入登入後 dashboard / 主 page
3. 觀察 network panel、主 API call（at least 3 個）全 200
4. 看 console 無 JS error

**Expected**：page render < 3s、API 全 200

**Fail trigger**：5XX API / page 載入 > 10s / console JS error

---

### SMOKE-03：DB read（含 tenant filter）

| 欄 | 內容 |
|---|---|
| **嚴重度** | P1 |
| **預估時間** | 5 min |
| **自動化？** | ✅ 可（API + assertion）|

**Steps**：
1. 用 user A token 打資料 list API（e.g. `/api/{tenant}/orders`）
2. 確認回的資料**全部** belong to user A 的 tenant
3. 用 user B（不同 tenant）token、打同 API
4. 確認**完全不重疊**

**Expected**：tenant filter middleware 有效、無越權

**Fail trigger**：跨 tenant 看到別人資料 → **P0 critical**、立即 rollback + 安全 incident 通報

---

### SMOKE-04：寫入操作（含 audit log）

| 欄 | 內容 |
|---|---|
| **嚴重度** | P1 |
| **預估時間** | 3 min |

**Steps**：
1. POST 一筆新資料（e.g. create dummy order / 標 alert as ack）
2. 確認 response 200 + 含新 ID
3. GET 該 ID、確認 data persisted
4. 查 audit_logs table、確認該 write 有 log entry（user_id / action / target / ts）

**Expected**：write 寫入 + audit log 寫入

**Fail trigger**：write success 但 audit log 缺 → 法規 / compliance fail、P1 rollback

---

### SMOKE-05~10：{對應案件 critical service}

per 案件具體 critical service 填寫（MQTT 上雲 / Anthropic API / cron / SES / DR）

---

## 6. Smoke Result template

每次跑完填一行：

| Release | 跑 by | 跑於 | 結果 | 失敗 case | 備註 |
|---|---|---|---|---|---|
| v1.2.3 | DevOps Alice | 2026-11-15 14:00 | ✅ 9/9 | — | — |
| v1.2.4 | DevOps Bob | 2026-11-22 14:00 | ❌ 8/9 | SMOKE-04（audit log 寫不到）| rollback v1.2.3 |
| ... | | | | | |

---

## 7. 自動化建議

5-10 個 case 大部分**應自動化**（人跑會慢且漏）：

| 工具 | 適用 case |
|---|---|
| **Playwright headless** | SMOKE-01 / 02（UI 級）|
| **curl + jq + bash** | SMOKE-02 / 03 / 04 / 05（API 級）|
| **GitHub Actions** | 每次 deploy 後 trigger smoke + 結果 post to Slack |
| **AWS CodePipeline + CodeBuild** | AWS 環境的 CI/CD-driven smoke |
| **CloudWatch Synthetics** | Production 持續性 smoke（每 5 min 一次）|

最佳實作：**deploy → automated smoke → 全 pass 才開放 traffic**（per blue/green / canary deploy pattern）。

---

## 8. 與其他驗收層級的關係

```
release 流程：

CI (L1 unit) ─→ 部署 staging ─→ L2 整合測試（48 hr 穩定） ─→ 預備 release
                                                                  │
                                                                  ▼
deploy production ─→ **smoke test（本 template、30 min）** ─→ open traffic
                                                                  │
                                                                  ▼
                                                          L3 UAT / L4 Pilot / L5 正式
                                                          （per uat-script-template.md）
```

Smoke 是**release-時刻**的 fail-fast 機制、不是 UAT 替代品。

---

**起草**：{我方 DevOps lead}
**版本**：v0.1（簽約 + 規格定版後實際 sign-off）
**雙方 sign-off**：{我方 PM} × {客戶 PM}（聯名案）

---

## Template 用法 Tips

1. **case 數 5-10 最佳**：少於 5 漏覆蓋、超過 10 跑不完 30 min
2. **嚴重度只用 P1 / P2**：smoke 場景是 critical path、不該有 P3 / P4
3. **自動化優先**：手跑容易漏，每次 release 都要跑、人工不可持續
4. **fail → rollback、不是 fix forward**：smoke fail 意味 release 不穩、立即 rollback、別在 production 修
5. **跨 tenant 越權測**（SMOKE-03）必有：是聯名 / 多客戶 SaaS 案的安全紅線
6. **audit log smoke**（SMOKE-04）必有：寫操作 + audit log 一起測、合規最低保障
