# UAT 測試腳本 Template — {案件名稱}

> **層級**：L3 UAT（per [模組 11 §1.2](../framework/12-modules/11-acceptance-benefits-operations.md)）
> **執行期**：{Phase 2 末 / 簽約後幾月}
> **主責**：{客戶 / 我方 / 雙方} 測試人員 + 我方配合
> **狀態**：v0.1 預備版（簽約 + 規格未定項對齊後實際定版）

---

## 用途

填這個 template 產對應案件的 UAT 腳本。
**先填**：簽約後 / 規格定版後，**不要**在規格未定階段強寫死細節（會白做）。

**規格未定 case 處理法**：對應 step 標 ⚠️ + 簽約後對齊 deadline + Owner，don't 強寫死。

---

## 1. 範圍 + 不在範圍

### 在範圍

從 [rtm-template.md](rtm-template.md) 抽出**對應 end-user 操作場景的需求**：

| R-ID | UI Page / 場景 | UAT Case 數 |
|---|---|---|
| R-XX | {Page 1 名稱} | UAT-01 |
| R-XX | {Page 2 名稱} | UAT-02 |
| ... | ... | ... |

### 不在範圍（移到其他驗收層級）

| 不在 UAT 因為 | R-ID |
|---|---|
| 屬整合測試（L2）、非 end-user 場景 | R-XX, R-XX |
| 屬平台 / 安全測（自動化、非 user）| R-XX |
| 屬商業 SLA 計時、非 user 跑場景 | R-XX |

---

## 2. Entry Criteria（開跑 UAT 前必滿足）

雙方 PM 共同 sign-off 才能進 UAT：

- [ ] **L1 開發內測**：我方 QA 全 pass、unit test coverage ≥ {N}%
- [ ] **L2 整合測試**：{N} hr 穩定測試 pass
- [ ] **環境就緒**：UAT 環境（staging）部署完成、dummy data 已灌入
- [ ] **規格已定**：{pending spec items 列出} **已雙方確認**
- [ ] **文件就緒**：使用者手冊 v0.5、客服 FAQ v0.5、UAT case 雙方對齊
- [ ] **人員就緒**：{客戶 / 我方} UAT 參與者 ≥ N 人、each 跑 ≥ N hr 訓練
- [ ] **缺陷管理就緒**：[uat-defect-template.md](uat-defect-template.md) + Jira / Linear project 開好
- [ ] **不在範圍 Out-of-scope 已確認**：上述「不在 UAT」項在 L2 / 其他驗收已 pass

---

## 3. Exit Criteria（UAT 完成判定）

- [ ] **{N} 個 UAT case 全 Pass**（或標 deferred + 雙方同意延後）
- [ ] **Defect 處理**：P1/P2 defect 全部 fixed + re-test pass、P3/P4 雙方同意進 backlog
- [ ] **效能驗證**：API P95 < {N}ms / UI 載入 < {N}s（per NFR）
- [ ] **多語系驗證**（如適用）：{N} 語覆蓋率 ≥ 95% 字串
- [ ] **使用者反饋**：UAT 參與者 ≥ 80% 給 4/5 以上滿意度
- [ ] **雙方簽收書**：[uat-signoff-template.md](uat-signoff-template.md) 簽署

---

## 4. 角色 + 環境

### 4.1 UAT 角色

從 [模組 05](../framework/12-modules/05-stakeholders-raci.md) 抽 end-user 角色：

| 角色 | 對應實際 user | 跑 UAT case |
|---|---|---|
| **{角色 1}** | {實際職位} | UAT-XX, XX |
| **{角色 2}** | {實際職位} | UAT-XX, XX |
| **{角色 3}** | {實際職位} | UAT-XX, XX |

### 4.2 UAT 環境

- **URL**：`https://staging-{案件}.{我方 domain}`
- **帳號**：UAT 期我方提供 {N} 個 dummy 帳號（含 N 種權限）
- **Dummy data**：
  - {N} 個 dummy 公司 / tenant
  - 各含 {N} 個{設備類型}
  - {N} 個月歷史資料
  - 1 份模擬 {報表 / output}

---

## 5. UAT Case 詳細

### UAT-01：{場景名稱}（R-XX）

| 欄 | 內容 |
|---|---|
| **對應 RTM** | R-XX |
| **對應 AC** | A.XX |
| **UI Page** | {Page 名稱} |
| **角色** | {角色名} |
| **預估時間** | {N} min |

**Pre-condition**：
- {前置條件 1}
- {前置條件 2}

**Steps**：
1. {動作 1}
2. {動作 2}
3. {動作 3}
4. ⚠️ {規格未定 step、簽約後對齊}
5. ...

**Expected**：{預期結果}

**Actual / Pass-Fail / Defect ID / Comments**：｜｜｜｜

---

### UAT-02：{...}

（同上格式重複）

---

## 6. 缺陷管理

UAT 期間發現問題 → [uat-defect-template.md](uat-defect-template.md) 開 ticket。

| Defect Severity | 處理 SLA | UAT Exit 影響 |
|---|---|---|
| **P1 嚴重**（功能完全失效 / 資料錯）| 24 hr 修 + re-test | 阻 UAT exit、必修 |
| **P2 高**（主功能異常但有變通）| 3 工作天修 | 影響 UAT exit、原則必修、雙方可協議延後 |
| **P3 中**（次要功能 / UI 小瑕）| 1 週修 | 不阻 exit、進 backlog 後階段修 |
| **P4 低**（建議 / nice-to-have）| backlog 排 | 不阻 exit |

---

## 7. UAT 進度 dashboard（雙方共享）

| 項目 | 目標 | 實際 |
|---|---|---|
| UAT case 完成度 | N / N | 0 / N |
| Pass rate | ≥ 95% | — |
| P1 defect | 0 open | — |
| P2 defect | < N open | — |
| 滿意度 | ≥ 4/5 平均 | — |
| 效能（API P95 / UI load）| < {N}ms / < {N}s | — |

每週雙方 sync 一次。

---

## 8. ⚠️ 規格未定 → UAT case 補完清單

對應 [pending-items-tracker]（per 案件 repo）：

| UAT Case | 規格未定 | Deadline | Owner |
|---|---|---|---|
| UAT-XX | {規格描述} | {Phase X / 日期} | {誰} |
| ... | ... | ... | ... |

---

**起草**：{我方 PM}
**版本**：v0.1（簽約 + 規格定版後實際 sign-off）
**雙方 sign-off**：{我方 PM} × {客戶 PM}

---

## Template 用法 Tips

1. **N（case 數）視 RTM end-user R 條數定**：典型 8-15 case，太少漏覆蓋、太多 UAT 跑不完（4 週上限）
2. **每 case 預估時間 15-30 min**：UAT 跑期 4 週、扣 sync / training / re-test 後實際每週 ~15-20 hr 人力
3. **不在範圍要明標**：客戶 reviewer 會質疑「為什麼不測 X」、寫清楚 = L2 / 平台 / 商業 SLA 等其他驗收層級涵蓋
4. **規格未定 step 必標 ⚠️**：強寫死 = 簽約後客戶不認 / 規格定版後要全改、不如先 stub
5. **角色 × case mapping 確保覆蓋**：每個角色至少 ≥ 3 case，避免某角色 UAT 沒參與
6. **B2B2B 案要區分前後台 UAT**：客戶端介面（E1/E2）+ 供應商後台（E3）兩套 case、不混

## 參考真實案例

ProposalOS 框架的第一個 UAT 預備版實作：

- **案件**：B2B2B AIoT 聯名 SaaS 服務（產業：工業風扇 + 空品 + 電力）
- **規模**：14 UAT case（end-user 10 + 後台 4）、Phase 2 末 4 週執行
- **特色**：5 條規格未定明標 ⚠️、簽約後對齊 deadline 對應 pending-items-tracker
- **詳見**：私有案件 repo（不公開、避免客戶資訊外洩）— 內部開發者見 GoodLinker / amafans-eaqs-proposal `acceptance/uat-script.md`

該案件 backflow 了本 template 的 7 個通用 pattern：
1. UAT case 格式（pre-condition / steps / expected / actual / defect ID）
2. Entry / Exit criteria checklist
3. 5 級驗收層級（L1-L6）對應 Phase
4. UAT defect P1-P4 SLA
5. 規格未定 UAT case 處理法（⚠️ 標 + 簽約後對齊）
6. 簽收書 N case checkbox + 4 簽署位
7. B2B2B 後台 + 前台 dual UAT scope
