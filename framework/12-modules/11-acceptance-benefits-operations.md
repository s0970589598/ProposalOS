# 模組 11｜驗收、效益追蹤、變革管理與維運

🔴 必做

## 目的

很多系統提案**簽前寫得很好，簽後沒人接**。
這個模組要回答：怎麼算完成、效益怎麼追、人怎麼接、出事誰處理。

## 四個子題

### 1. 驗收標準（Acceptance Criteria）

每條驗收標準必須：
- **可測量**（不是「好用」、「順暢」）
- **可重現**（任何人照做都會得到同樣結果）
- **有時限**（多久內、多少次內）
- **對應需求**（指回模組 08 的 FR / NFR）

### 驗收清單模板

| ID | 對應需求 | 驗收項目 | 測試方式 | 通過條件 | 負責人 |
|---|---|---|---|---|---|
| AC-001 | FR-001 | 訂單通知 | 建立 100 筆訂單測延遲 | P95 < 1s | IT |
| AC-002 | NFR-001 | 系統可用率 | 一週內監控 | ≥ 99.5% | 我方 |
| AC-003 | FR-005 | 異常告警 | 觸發 10 次異常 | 全部送達且 5 分鐘內 | 廠務 |

### 驗收層級

| 層級 | 內容 |
|---|---|
| 開發內部測試 | 我方自測 |
| UAT（使用者驗收測試） | 客戶端使用者驗 |
| Pilot 試行 | 小規模真實使用 1-4 週 |
| 正式驗收 | 達標、簽署驗收書 |
| Post-Go-Live | 上線後 N 天 KPI 達標 |

### 2. 效益追蹤（Benefits Realization）

簽約前承諾的效益，簽約後**要有人去追**。

| 效益項目 | 對應 KPI | 基線（簽前）| 目標 | 量測方式 | 量測週期 | 負責人 |
|---|---|---|---|---|---|---|
| 巡檢人時降低 | 每月人時 | 80h | 20h | 工時系統 | 月 | 廠務主管 |
| 異常反應時間 | 平均回應 | 3h | 15min | 系統紀錄 | 週 | IT |
| 稼動率 | OEE | 65% | 75% | MES | 月 | 廠長 |

⚠️ 沒有基線數字 → 上線後算不出效益。**簽約前必量基線**。

### 3. 變革管理（Change Management）

用 ADKAR 五步驟：

| 步驟 | 內容 | 工具 |
|---|---|---|
| Awareness | 為什麼要變 | 全員說明會、Email |
| Desire | 想要變 | 主管表態、激勵、不變的後果 |
| Knowledge | 知道怎麼變 | 教育訓練、手冊、影片 |
| Ability | 能夠做到 | Sandbox、教練陪跑、Office Hour |
| Reinforcement | 持續維持 | KPI 連動、表揚、回饋迴路 |

### 必排活動

- 主管啟動會議（簽約後立刻）
- 中階主管訓練（影響第一線）
- 第一線操作訓練（含實機演練）
- Pilot 觀察 + 調整
- 上線日 War Room
- 上線後 30 / 60 / 90 天回顧

### 4. 維運服務（Operations / Support）

用 ITIL 4 思維：

| 服務項目 | 內容 |
|---|---|
| Service Desk | 統一窗口（單一窗口）、SLA |
| Incident Management | 事件分級、回應時間、解決時間 |
| Problem Management | 根因分析、永久解 |
| Change Management | 變更分級、CAB、回滾 |
| Service Request | 帳號異動、權限、報表客製 |
| Asset Management | 系統、授權、硬體清單 |
| Supplier Management | 第三方廠商管理 |
| Release / Deployment | 版本發布、部署策略 |
| Monitoring | 監控覆蓋、告警規則 |

### SLA 範例

| 等級 | 回應時間 | 解決時間 | 適用 |
|---|---|---|---|
| P1 嚴重 | 15 min | 4 hr | 系統停擺、資料遺失 |
| P2 高 | 1 hr | 1 工作天 | 主功能異常但有變通 |
| P3 中 | 4 hr | 3 工作天 | 次要功能異常 |
| P4 低 | 1 工作天 | 兩週 | 改善需求、報表客製 |

## 常見地雷

- ❌ 驗收寫「客戶滿意」→ 等於沒寫
- ❌ 沒量基線 → 效益沒法算
- ❌ 沒寫變革管理 → 上線後沒人用
- ❌ SLA 沒寫例外 → 不可抗力、第三方故障要免責
- ❌ 維運費用單獨算 → 沒含在報價會被砍

## 輸出物（規格層 — 寫進提案）

1. **驗收 Checklist**（含測試方式、通過條件）
2. **效益追蹤計畫**（基線、目標、量測、負責人）
3. **變革管理計畫**（ADKAR 五步驟活動）
4. **維運服務目錄 + SLA**
5. **上線後 30/60/90 天回顧計畫**

## 執行層展開（簽約後 / Phase 2-3 真的跑驗收用）

⚠️ **執行層 ≠ 規格層**：

| 層 | 目的 | 何時產 | 範例 |
|---|---|---|---|
| **規格層**（本模組 §1-5）| 寫進提案、合約簽署用、雙方對齊 AC + SLA + 變革 | 提案 / 投標期 | 5 級驗收層級、效益指標公式、ITIL service catalogue、P1-P4 SLA |
| **執行層**（templates/uat-*）| 簽約後 / Phase 2-3 實際照著跑的 artifact | 規格定版後 | UAT N case + entry/exit、defect ticketing、簽收書 |

執行層 template（filled per 案件）：

| Template | 用途 | 何時用 |
|---|---|---|
| [uat-script-template.md](../../templates/uat-script-template.md) | UAT 測試腳本（per RTM end-user R）| Phase 2 末 UAT 期 |
| [uat-defect-template.md](../../templates/uat-defect-template.md) | UAT 期間 bug 回報 / 處理 ticket 格式 | 同上 |
| [uat-signoff-template.md](../../templates/uat-signoff-template.md) | 雙方 UAT 完成簽收書 | Phase 2 末驗收 |

**何時建立執行層 artifact**：

| 案件 status | 是否寫執行層？| 為何 |
|---|---|---|
| 投標 / 提案中 | ❌ 不寫 | 規格未定、寫死簽約後客戶不認 / 規格定版後全改 |
| 簽約後 + 規格定版 | ✅ 寫**完整版** | Phase 2 跑 UAT 用 |
| **規格定版前、但已預判可寫 baseline** | ⚠️ 寫**預備版**（v0.1）| 規格未定 step 用 ⚠️ 標 + 簽約後對齊 deadline、其餘照寫 |

預備版好處：規格層 ready 跟簽約後就能跑、不浪費 Phase 0-1 對齊時間。

**執行層 vs 規格層 cross-ref 關係**：

```
模組 11（規格層 / 寫進提案）
    │
    │ 簽約後展開成
    ▼
acceptance/（執行層 / 跑驗收用、per 案件）
    ├── uat-script.md      ← §1.2 L3 UAT 展開
    ├── smoke-test-plan.md ← §1.2 L2 整合測試展開（TBD template）
    ├── deployment-runbook.md ← §4.3 release 排程展開（TBD template）
    ├── uat-defect-template.md ← §4.1 incident management 簡化版
    └── uat-signoff.md      ← §1.3 雙方代表簽收書具現
```

## 推薦方法論

| 方法論 | 用處 |
|---|---|
| [DORA Metrics + SRE](../methodologies/dora-sre.md) | 軟體型維運的業界標準：4 DORA metrics、SLO/SLI/SLA、Error Budget、Toil、Blameless Postmortem |

## 與其他模組的關係

- ← 模組 03：經營目標 → 效益追蹤 KPI
- ← 模組 05：使用者、決策鏈 → 變革對象
- ← 模組 08：FR / NFR → 驗收標準
- → 強制檢查項 F：RTO / RPO、版本回滾
- → 強制檢查項 G：退出機制

## 反方審查問題

- 你的驗收項目客戶會簽嗎？太嚴他不簽，太鬆我們白做
- 基線數字誰量？什麼時候量？
- 上線後 3 個月還沒用起來怎麼辦？
- SLA 違約金怎麼算？我們承擔得了嗎？
- 客戶內部接手的人定了嗎？訓練算進範圍嗎？
