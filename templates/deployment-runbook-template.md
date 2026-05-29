# Deployment Runbook Template — {案件名稱}

> **用途**：上線部署 + 回滾 step-by-step 操作手冊。
> **對應**：[模組 11 §4.3 release 排程](../framework/modules/11-acceptance-benefits-operations.md) + [smoke-test-plan-template.md](smoke-test-plan-template.md)
> **執行時機**：每次 release / Phase 1 末 / Phase 3 Go-Live / 緊急 patch

---

## 用途

填這個 template 產對應案件的 deployment runbook。
**3 主要場景**：
1. 常規 release（每月排程）
2. 緊急 patch（hotfix）
3. Rollback（出問題時）

---

## 1. Release 類型 + 通知

| Release type | 頻率 | 維護視窗 | 通知對象 + 提前 | 需要 sign-off |
|---|---|---|---|---|
| **主 release**（新功能 / 大改）| 每月 1 次 | 週六 02:00-04:00 ({時區}) | Amafans + 客戶 / 7 天前 email + 平台 banner | 雙方 PM |
| **bug fix release** | 每 2 週 | 同上 | 同上 / 3 天前 | 我方 PM |
| **緊急 patch**（安全 / 重大 bug）| ad hoc | ASAP | 立即 / 雙方 PM + 客戶 ops | 我方 CTO + 雙方 PM |
| **Gateway 韌體 OTA** | 每季 1 次 | 業務時間外 | 雙方 / 7 天前 | 雙方 PM |
| **DR drill**（failover 演練）| 半年 1 次 | 計畫維護視窗 | 雙方 / 14 天前 | 雙方 PM + CTO |

---

## 2. Pre-deployment Checklist（部署前必過）

### 2.1 Code / Build

- [ ] PR merged 到 main branch、commit SHA：`{git_sha}`
- [ ] CI pipeline pass（unit test + lint + SAST）
- [ ] Release notes 已寫
- [ ] Changelog 已 update
- [ ] Migration script 已 review + reviewer signed

### 2.2 環境準備

- [ ] **環境變數已對齊**（per `.env.{env}.example` vs actual）
- [ ] **Secrets 已 set**（AWS Secrets Manager / Vault）
- [ ] **DB backup 已做**（before-migration snapshot）
- [ ] **Monitoring channel 已備**（Sentry / CloudWatch / Slack #incident）
- [ ] **Rollback 預備**：previous version Docker image tag / git SHA 已記
- [ ] **Maintenance banner 已掛**（如需顯示 user）

### 2.3 通知

- [ ] **Pre-deploy email** 已寄出（per §1 提前期）
- [ ] **平台 banner** 已掛（如需）
- [ ] **雙方 standby**：我方 DevOps + engineer / 客戶端 ops 對接

---

## 3. Deployment Steps（常規 release）

### Step 1：宣告 maintenance（可選）

```bash
# 開啟 maintenance mode、阻擋新 user request
{命令、per 案件 tech stack}
# 或者 zero-downtime deploy 可跳過
```

### Step 2：DB migration（如有）

```bash
# 跑 migration、含 dry-run + verify
{命令}
# 確認：
# - migration log 無 error
# - migration 前後資料 count diff = expected
# - 主要 table sample row 完整
```

⚠️ **Migration must be backward-compatible** during deploy window（avoid downtime）。
若不可能 backward-compatible → 安排 maintenance window + 提前通知。

### Step 3：部署新版本

```bash
# 視 tech stack：
# - Lambda: aws lambda update-function-code
# - ECS: aws ecs update-service
# - K8s: kubectl set image / rollout
# - Vercel / Netlify: git push 自動 trigger
{命令}

# 健康檢查
curl -fsS {平台主 URL}/health
```

### Step 4：跑 smoke test

per [smoke-test-plan-template.md](smoke-test-plan-template.md)、5-10 個 case、30 min 內。

```bash
# 自動化版（推薦）：
{命令、e.g. npm run smoke / playwright test smoke/}

# 或手動跑、填 result template
```

**Gate**：smoke 全 pass 才繼續、任一 P1 fail → 跳 §5 rollback。

### Step 5：開放 traffic

```bash
# Blue/green deploy: switch traffic
{命令}

# Canary deploy: 增加 traffic %
{命令、e.g. 10% → 50% → 100%}

# 觀察 5-15 min、monitor 指標
```

### Step 6：Monitor watch（15-30 min）

| 指標 | 目標 | 工具 |
|---|---|---|
| Error rate | < 1% | CloudWatch / Sentry |
| P95 latency | < {N}ms | CloudWatch / Datadog |
| 5XX 數量 | 0 | API Gateway log |
| Critical alert | 0 P1 | PagerDuty / Slack |

任何指標異常 → 評估 hotfix 或 rollback。

### Step 7：完成

- [ ] 關 maintenance banner
- [ ] 寄 post-deploy email（含 release notes + smoke result + 觀察結果）
- [ ] 寫 deploy log（per §7）
- [ ] 雙方 PM sign-off「release complete」

---

## 4. Hotfix（緊急 patch）流程

縮減版常規 release：

1. **嚴重度評估**：是 P0（資料外洩 / 全平台倒）還是 P1（主功能異常但可控）？
2. **雙方 PM + CTO sign-off**（緊急情況可口頭）
3. **快速通道**：跳過 §1 「7 天前通知」、直接 fix
4. **走 §3 step 2-6**、但更密集 monitor（每 5 min 一次、共 30 min）
5. **Post-mortem 必做**（hotfix 後 24 hr 內、per 模組 11 §4.1 problem management）

---

## 5. Rollback 流程

⚠️ Rollback 是**雙方 PM + 我方 CTO 共同決議**、不是 DevOps 單方決定。

### 5.1 Rollback Trigger（任一即觸發）

- Smoke test 任一 P1 case fail
- Production 5XX rate > 5% 持續 5 min
- Critical alert（資料外洩 / tenant 越權 / DB corruption）
- 客戶側 incident 報案 P1 / 多客戶受影響

### 5.2 Rollback Steps

```bash
# Step 1: 停 traffic（如 blue/green）
{命令}

# Step 2: 回到 previous version
# Lambda: aws lambda update-function-code --s3-key {previous_sha}.zip
# ECS: 更新 task definition 回 previous version
# K8s: kubectl rollout undo
{命令}

# Step 3: DB rollback（如必要、看 migration 是否 reversible）
{命令、per migration down() / 或 restore snapshot}

# Step 4: 健康檢查 + smoke
curl -fsS {平台主 URL}/health
{smoke 命令}

# Step 5: 重開 traffic
{命令}
```

### 5.3 Rollback 後

- [ ] 通知客戶「rollback 完成、original version 恢復」
- [ ] 雙方 PM 寫 incident report（24 hr 內）
- [ ] Post-mortem（48 hr 內）
- [ ] 雙方同意「下次 release 怎麼避免」+ 改進 plan
- [ ] **更新 release notes / SLA report**（如違約 → 啟動 §4.2 P1-P4 SLA 違約懲罰流程）

⚠️ **Rollback ≠ 失敗、是負責任的 trade-off**：rollback 比硬撐讓 production 爛 30 min 好得多。

---

## 6. Migration 安全規則

| 操作 | 安全做法 | 危險做法（禁）|
|---|---|---|
| **加 column** | nullable + default | NOT NULL 不給 default → 阻塞 |
| **刪 column** | 1) 先 deprecate 不讀 / 2) 下次 release 真刪 | 一次刪 → 老 code 還用會炸 |
| **rename column** | 1) 加新 col / 2) backfill / 3) 改 code 用新 col / 4) 下次 release 刪舊 | sed 改 schema → 同步問題 |
| **改 type** | 1) 加新 col + 新 type / 2) backfill cast / 3) 改 code / 4) drop old | ALTER COLUMN TYPE → 大表 lock |
| **加 index** | 用 CONCURRENTLY（PostgreSQL）| 同步 ALTER INDEX → 鎖 table |
| **刪 table** | 1) 先停 read+write / 2) 等 N 週 / 3) drop | 立刻 DROP → 老 code 還用會炸 |

每個 migration **必有 down() / 回滾路徑**（per 全域 CLAUDE.md「DB migration MUST 有 down() 可回滾」）。

---

## 7. Deployment Log Template

每次 deploy 填一行（建議 release-log.md / Notion / Linear）：

```yaml
release_id: v{N.M.X}
deploy_type: 主 release / hotfix / DR drill
date: YYYY-MM-DD HH:MM
deploy_by: {DevOps name}
git_sha: {hash}
migration: {none / file list}
smoke_result: {N/N pass}
monitor_post_deploy: {15 min ok / 異常記錄}
incidents_during: {none / brief description}
rollback?: {no / yes、reason}
post_mortem_link: {URL if any}
sign_off: {雙方 PM names}
```

---

## 8. 與其他驗收層級的關係

```
release 流程串（per 模組 11）：

L1 unit test → L2 整合測試 → **本 runbook 5-7 steps** → smoke test → L3 UAT / L4 Pilot / L5 正式
                                  │
                                  ▼
                              （production deploy 階段）
                              （含 monitor 15-30 min）
                              （含 rollback 可能）
```

**Runbook ≠ UAT**：runbook 是「我方 ops 怎麼上線」、UAT 是「客戶怎麼驗收」。

---

**起草**：{我方 DevOps lead}
**版本**：v0.1（簽約 + 規格定版後實際 sign-off）
**雙方 sign-off**：{我方 PM} × {客戶 PM}（聯名案）

---

## Template 用法 Tips

1. **預先預演**：每月 release 不該是「現場才想 steps」、應 dry-run 過 staging
2. **rollback 預備是必要、不是 nice-to-have**：DB migration 沒 down() = 設計缺陷、不是「等需要時再寫」
3. **migration 規則嚴格**：違反「加 column 不給 default」這類規則 = production 直接 down
4. **monitor 15-30 min 不要省**：5 min 後 traffic 才起、bug 才浮、撐 30 min 比較安全
5. **Rollback ≠ 認輸**：雙方 PM 應該預先簽過「rollback 不算違約 / 是降低 client risk 的負責動作」共識
6. **Post-mortem 寫了真讀 / 真改**：寫完 post-mortem 沒做 action item = 浪費紙
