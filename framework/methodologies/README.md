# 跨領域方法論（21 個）

ProposalOS 借用的**業界成熟方法論** + **ProposalOS 原創方法論**。

業界成熟方法論不是我們自己發明的，而是顧問業 / 軟體業 / 服務設計業已驗證的標準。
ProposalOS 原創方法論（5 個）per Amafans EAQS 2026-05 retrospective accumulated lesson 產生、填補業界 framework 對「顧問式提案 module-fill 前 interrogation / session 內 framework 自我演化」的 gap。

## 為什麼要分這層

13 模組 / 9 強制檢查項是 **WHAT**（要寫什麼）。
方法論是 **HOW**（用什麼業界 / ProposalOS 標準的方式想 / 寫）。

把方法論獨立出來、不要混進 13 模組，因為：

- 不是每案都用、依情境選
- 方法論本身有完整體系、不應只挑片段
- 客戶法務 / IT 看到引用標準框架會更信任

## 方法論清單（21 個、依類別、verified per `ls methodologies/*.md` 2026-05-29）

### A. ProposalOS 原創（5 個、per session retro 累積）

| 方法論 | 用在哪 | 必看 |
|---|---|---|
| [Phase 0 Discovery](phase-0-discovery.md) | 模組 01-13 填寫**前**的顧問式案件審訊（avoid「先填 template 再驗 case」反向工作）| 🔴 任何案件 Phase 0 必跑 |
| [CR-Handling Protocol](cr-handling-protocol.md) | 新 sensor / 新 measurement / 新 data stream CR 自動觸發 5 大 implication 問 | 🔴 IoT 案 + 任何含 sensor / device CR 必看 |
| [Session Retrospective](session-retrospective.md) | 每 session 結尾累積 user-push gap、systematic feed 回 framework upgrade | 🔴 結案 / 重大 milestone 必跑 |
| [Spine Mode for Large Proposal](spine-mode-for-large-proposal.md) | 大型 proposal（> 200 頁）的 spine / index 結構模式 | 🟡 大案 / 多 module 必看 |
| [Multi-Tool Verification](multi-tool-verification.md) | High-stakes claim 用 ≥ 2 工具交叉驗、avoid single-tool over-confidence | 🔴 寫具體數字 / 識別符 / 業界主張前必過 |

### B. 提案方法論本身（3 個）

| 方法論 | 用在哪 | 必看 |
|---|---|---|
| [Shipley / APMP](shipley-apmp.md) | 大型 / 政府 / 標案提案 | 🔴 enterprise 案必看 |
| [Pyramid Principle / SCQA](pyramid-principle.md) | 執行摘要、結論寫作 | 🔴 任何案必看 |
| [Cynefin Framework](cynefin.md) | 決定用什麼提案方法 | 🟡 元方法、想清楚再做 |

### C. 需求 / 戰略分析（5 個）

| 方法論 | 用在哪 |
|---|---|
| [Kano Model](kano-model.md) | 需求分類（取代 P0/P1/P2）|
| [Jobs to be Done](jtbd.md) | 訪談深度挖掘 |
| [PESTEL + SWOT](pestel-swot.md) | 產業分析、競品分析 |
| [Wardley Mapping](wardley-mapping.md) | 戰略定位 |
| [BMC + VPC](bmc-vpc.md) | 客戶生意盤點 |

### D. 服務 / 體驗設計（1 個）

| 方法論 | 用在哪 |
|---|---|
| [Service Design](service-design.md) | 服務型客戶整體設計 |

### E. 系統 / 架構（3 個）

| 方法論 | 用在哪 |
|---|---|
| [C4 Model](c4-model.md) | 軟體架構圖（補強 TOGAF 4 層）|
| [Software Architecture Patterns](software-architecture-patterns.md) | 12-Factor App + DDD + Event Storming |
| [DORA + SRE](dora-sre.md) | 軟體型維運段補強 |

### F. 資安 / AI / 治理（3 個）

| 方法論 | 用在哪 |
|---|---|
| [Cybersecurity Frameworks](cybersecurity-frameworks.md) | MITRE ATT&CK + Zero Trust + CIS + BSIMM |
| [MLOps + AI Governance](mlops-and-ai-governance.md) | 提案含 AI 必看 |
| [AI Codegen Anti-Debt](ai-codegen-anti-debt.md) | AI 輔助 codegen / agent-coded proposal 累積 tech debt 防制 |

### G. 商務 / 採購（1 個）

| 方法論 | 用在哪 |
|---|---|
| [RFP / RFI / RFQ](rfp-rfi-rfq.md) | 不同詢問形式、不同策略 |

### 統計

| 類別 | 數量 |
|---|---|
| A ProposalOS 原創 | 5 |
| B 提案方法論本身 | 3 |
| C 需求 / 戰略分析 | 5 |
| D 服務 / 體驗設計 | 1 |
| E 系統 / 架構 | 3 |
| F 資安 / AI / 治理 | 3 |
| G 商務 / 採購 | 1 |
| **Total** | **21** |

> ✅ Verified per `ls framework/methodologies/*.md` 2026-05-29 (排除 README.md) = 21 個 methodology file。原 18 + 本次 Amafans EAQS retro 後新加 3（phase-0-discovery / cr-handling-protocol / session-retrospective）= 21。A 類「ProposalOS 原創」共 5 個但其中 spine-mode + multi-tool-verification 為更早 retro 已加。

## 怎麼用

### 寫提案時

對照 13 × 9 主框架時，看哪幾個方法論有相關，**拉進來補強而不是取代**。

範例：

| 模組 | 主框架已有 | 可拉方法論補強 |
|---|---|---|
| Phase 0 前置 | — | **Phase 0 Discovery（原創、必跑）** |
| 01 產業市場 | 規模、趨勢、玩家 | PESTEL、Wardley、market-research skill |
| 02 競品替代 | 三類選項 | SWOT、Wardley |
| 03 問題目標 | KPI 對應 | Kano、JTBD、BMC |
| 04 流程藍圖 | Service Blueprint | Service Design 完整 5 階段 |
| 08 架構 NFR | TOGAF 4 層 | C4 Model（更聚焦軟體）|
| 11 驗收維運 | SLA、RTO/RPO | DORA + SRE |
| 12 風險反方 | red-team | Multi-Tool Verification（claim 驗證）|
| 13 §9 Sensor Scheme | 模組內含 | **CR-Handling Protocol（原創、新 sensor CR 必過）** |
| 結案 | — | **Session Retrospective（原創、累 anti-pattern）** |

### 決策什麼方法論該用

```
案件類型？
   ↓
Phase 0 必跑 → 先 interrogate case 本質
   ↓
小案 / 確定流程    → Simple（Cynefin）→ SOP，不用拉方法論
中案 / 已知複雜    → Complicated → IIBA + TOGAF + 模組
複雜創新 / 新領域  → Complex → 加 JTBD、Service Design
   ↓
還要加？
   ↓
政府 / 大標 → 加 Shipley / APMP
含 AI → 加 MLOps 治理 + AI Codegen Anti-Debt
含 SaaS / 軟體 → 加 C4 + 12-Factor + DDD + DORA
含資安重點 → 加 MITRE / Zero Trust
含 IoT / sensor → 加 CR-Handling Protocol + 模組 13 §9
大型 proposal (> 200 頁) → 加 Spine Mode
寫具體數字 / 識別符 / 業界主張 → 加 Multi-Tool Verification
結案 → 必加 Session Retrospective
```

## 注意

❌ **不要每案都搬出 23 個方法論**、客戶會覺得在掉書袋
✅ **依情境選 2-3 個關鍵方法論**、用在對的地方
✅ **客戶法務 / IT 看到引用熟悉框架反而加分**（IIBA、TOGAF、NIST、ITIL、Shipley、Kano、DORA 都是業界標準）
✅ **ProposalOS 原創 5 個是「框架自我演化機制」、不是對客戶秀的 buzzword**、internal team 用
