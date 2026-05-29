# framework/ — 框架核心

⚠️ **Scope**：ProposalOS 是 **B2B-focused framework**（含 B2B2B / B2B2C 通路混合）、**不適用 B2C** 廣義消費品行銷（D2C / paid acquisition / brand / growth hacking）。「Proposal OS」名稱本身 = B2B 提案 OS。

| 適用 | 不適用 |
|---|---|
| B2B 企業 / 政府 / NGO 提案 | B2C 消費品行銷 / D2C |
| 客戶提案 RFP → Proposal | mass-market advertising |
| 聯名合作 Joint Spec | growth hacking / SEO |
| 投資 pitch / 顧問 / 系統提案 | brand / community |
| 5-stage 接案流程 | trial → purchase 短週期 |

ProposalOS 的本體。四層架構：

```
framework/
├── modules/                 ← 13 必選骨幹（每案都要過一次）— WHAT
├── 8-mandatory-checks/      ← 強制檢查項（容易被埋的細節）— WHAT
│                              （目前 9 項：A–H + I deployment model）
├── industry-addons/         ← 13 產業 / 場景加掛（依案件選用）
├── methodologies/           ← 21 跨領域方法論（業界 + ProposalOS 原創）— HOW
└── MATRIX.md                ← 13 × 9 對應矩陣
```

**WHAT vs HOW**：13 模組 / 9 檢查項 / Add-ons = **要寫什麼**；methodologies = **用什麼方法寫**。

## 使用順序

1. **Phase 0 先跑 [`methodologies/phase-0-discovery.md`](methodologies/phase-0-discovery.md)** — 在開填 module 前先 interrogate case 本質、避免「先填 template 再驗 case」反向工作
2. 讀 `modules/` 確認 13 個面向有沒有大方向漏項（含模組 13 §9 Sensor Scheme Decision Matrix — IoT / 資料採集案件必看）
3. 用 `8-mandatory-checks/` 過 checklist（A–H 通用 + I deployment model），找出落地會爆炸的地方
4. 依產業挑選 `industry-addons/`（13 個、含 4 新加：iiot-deployment / hvls-fan / air-quality-system / b2b2b-channel-partnership）補強
5. 依 case 樣態拉 `methodologies/`（21 個、含 ProposalOS 原創 5 個：phase-0-discovery / cr-handling-protocol / session-retrospective / spine-mode-for-large-proposal / multi-tool-verification）補強
6. 結案後跑 [`methodologies/session-retrospective.md`](methodologies/session-retrospective.md) 累積 anti-patterns 回 framework

## 怎麼判斷某個檢查項要不要做

| 標記 | 意思 |
|---|---|
| 🔴 必做 | 任何案件都不能跳過 |
| 🟡 視規模 | 小案可簡化、大案必做 |
| 🟢 看產業 | 依 industry-addons 觸發 |

每個模組與檢查項檔案內都會標出。

## 近期重大升級（2026-05-29 Amafans EAQS retro 後 ship）

| 升級 | 內容 | 對應檔 |
|---|---|---|
| **3 新 methodology** | Phase 0 Discovery / CR-Handling Protocol / Session Retrospective | `methodologies/phase-0-discovery.md` / `methodologies/cr-handling-protocol.md` / `methodologies/session-retrospective.md` |
| **4 新 industry-addon** | IIoT Deployment / HVLS Fan / Air Quality System / B2B2B Channel Partnership | `industry-addons/iiot-deployment.md` 等 |
| **模組 13 §9 Sensor Scheme Decision Matrix** | 4-layer physical-quantity 分類 + S/M/L BOM tier + 10 row decision matrix | `modules/13-system-design-mvp.md` §9 |
| **10 new anti-pattern** | AP-NEW-SENSOR-1~5 / AP-NEW-SESSION-RETRO-1~5 / AP-P0-1~10 / AP-CR-1~5 | `anti-patterns.md` |
| **新 mandatory check I** | Deployment Model Decision（cloud / edge / hybrid / on-prem Day-1 必決） | `8-mandatory-checks/I-deployment-model.md` |

完整 retro narrative → `methodologies/session-retrospective.md` §2.2 Amafans EAQS dogfood
