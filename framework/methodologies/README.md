# 跨領域方法論

ProposalOS 借用的**業界成熟方法論**。
這些不是我們自己發明的，而是顧問業 / 軟體業 / 服務設計業已驗證的標準。

## 為什麼要分這層

13 模組 / 8 強制檢查項是 **WHAT**（要寫什麼）。
方法論是 **HOW**（用什麼業界標準的方式想 / 寫）。

把方法論獨立出來、不要混進 13 模組，因為：

- 不是每案都用、依情境選
- 方法論本身有完整體系、不應只挑片段
- 客戶法務 / IT 看到引用標準框架會更信任

## 方法論清單

### 提案方法論本身

| 方法論 | 用在哪 | 必看 |
|---|---|---|
| [Shipley / APMP](shipley-apmp.md) | 大型 / 政府 / 標案提案 | 🔴 enterprise 案必看 |
| [Pyramid Principle / SCQA](pyramid-principle.md) | 執行摘要、結論寫作 | 🔴 任何案必看 |
| [Cynefin Framework](cynefin.md) | 決定用什麼提案方法 | 🟡 元方法、想清楚再做 |

### 需求 / 戰略分析

| 方法論 | 用在哪 |
|---|---|
| [Kano Model](kano-model.md) | 需求分類（取代 P0/P1/P2）|
| [Jobs to be Done](jtbd.md) | 訪談深度挖掘 |
| [PESTEL + SWOT](pestel-swot.md) | 產業分析、競品分析 |
| [Wardley Mapping](wardley-mapping.md) | 戰略定位 |
| [BMC + VPC](bmc-vpc.md) | 客戶生意盤點 |

### 服務 / 體驗設計

| 方法論 | 用在哪 |
|---|---|
| [Service Design](service-design.md) | 服務型客戶整體設計 |

### 系統 / 架構

| 方法論 | 用在哪 |
|---|---|
| [C4 Model](c4-model.md) | 軟體架構圖（補強 TOGAF 4 層）|
| [Software Architecture Patterns](software-architecture-patterns.md) | 12-Factor App + DDD + Event Storming |
| [DORA + SRE](dora-sre.md) | 軟體型維運段補強 |

### 資安 / AI / 治理

| 方法論 | 用在哪 |
|---|---|
| [Cybersecurity Frameworks](cybersecurity-frameworks.md) | MITRE ATT&CK + Zero Trust + CIS + BSIMM |
| [MLOps + AI Governance](mlops-and-ai-governance.md) | 提案含 AI 必看 |

### 商務 / 採購

| 方法論 | 用在哪 |
|---|---|
| [RFP / RFI / RFQ](rfp-rfi-rfq.md) | 不同詢問形式、不同策略 |

## 怎麼用

### 寫提案時

對照 12 × 8 主框架時，看哪幾個方法論有相關，**拉進來補強而不是取代**。

範例：

| 模組 | 主框架已有 | 可拉方法論補強 |
|---|---|---|
| 01 產業市場 | 規模、趨勢、玩家 | PESTEL、Wardley、market-research skill |
| 02 競品替代 | 三類選項 | SWOT、Wardley |
| 03 問題目標 | KPI 對應 | Kano、JTBD、BMC |
| 04 流程藍圖 | Service Blueprint | Service Design 完整 5 階段 |
| 08 架構 NFR | TOGAF 4 層 | C4 Model（更聚焦軟體）|
| 11 驗收維運 | SLA、RTO/RPO | DORA + SRE |

### 決策什麼方法論該用

```
案件類型？
   ↓
小案 / 確定流程    → Simple（Cynefin）→ SOP，不用拉方法論
中案 / 已知複雜    → Complicated → IIBA + TOGAF + 模組
複雜創新 / 新領域  → Complex → 加 JTBD、Service Design
   ↓
還要加？
   ↓
政府 / 大標 → 加 Shipley / APMP
含 AI → 加 MLOps 治理
含 SaaS / 軟體 → 加 C4 + 12-Factor + DDD + DORA
含資安重點 → 加 MITRE / Zero Trust
```

## 注意

❌ **不要每案都搬出 15 個方法論**、客戶會覺得在掉書袋
✅ **依情境選 2-3 個關鍵方法論**、用在對的地方
✅ **客戶法務 / IT 看到引用熟悉框架反而加分**（IIBA、TOGAF、NIST、ITIL、Shipley、Kano、DORA 都是業界標準）
