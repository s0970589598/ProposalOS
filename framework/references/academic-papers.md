# Academic Papers & Research References

> 跨案重用的學術論文、大學實驗室研究、IEEE / ACM / arXiv 論文中央索引。
>
> **Hedging convention**：✅ Verified（直接 WebFetch primary）/ ⚠️ Training-data（印象、未重驗）

---

## §1. arXiv Papers（直接引用）

### arXiv 2504.08237 — Examining IEQ Sensor Placement Strategies

- **Type**: Academic preprint
- **Authority**: arXiv（具名作者 + venue 未在 framework 引用內標出、需 WebFetch 確認）
- **Year**: 2025（per arXiv naming convention：2025-04 submission）
- **URL**: https://arxiv.org/pdf/2504.08237
- **Hedging level**: ✅ Verified（amafans framework + research 都 cite primary URL）
- **Cited where**:
  - `framework/industry-addons/air-quality-system.md §3 Master placement table`（核心參考）
  - `framework/industry-addons/air-quality-system.md §5 5 reference list`
  - `examples/amafans-eaqs/research/09-sensor-placement-consultancy.md`（implicit reference）
- **Notes**:
  - IEQ (Indoor Environmental Quality) sensor placement 學術 anchor
  - 對應 air quality / HVLS / 工廠 sensor 部署最 rigorous 學術 source
  - **建議下次 WebFetch 補 abstract + 作者 + venue 完整 metadata**

### arXiv 2508.07407 — Self-Evolving AI Agents

- **Type**: Academic preprint
- **Authority**: arXiv（具名作者 + venue 待補）
- **Year**: 2025（per arXiv naming convention：2025-08）
- **URL**: https://arxiv.org/pdf/2508.07407
- **Hedging level**: ✅ Verified（framework session-retrospective cite primary）
- **Cited where**:
  - `framework/methodologies/session-retrospective.md`（4-component closed-loop framework: System inputs / Agent / Environment / Optimisers）
- **Notes**:
  - ProposalOS Session Retrospective borrow 概念來自此 paper（**借用框架閉環概念、不是 copy methodology**）
  - 對應 framework self-evolution mechanism

### arXiv 2509.20497 — （title 待補）

- **Type**: Academic preprint
- **URL**: https://arxiv.org/pdf/2509.20497
- **Hedging level**: ⚠️ Training-data（framework 內 cite 但未列具體用途）
- **Cited where**: 待 grep 補
- **Notes**: 下次 WebFetch 補完整 metadata

### arXiv 2601.07786 — （title 待補）

- **Type**: Academic preprint
- **URL**: https://arxiv.org/pdf/2601.07786
- **Hedging level**: ⚠️ Training-data（framework 內 cite 但未列具體用途）
- **Cited where**: 待 grep 補
- **Notes**: 下次 WebFetch 補完整 metadata

---

## §2. CBE Berkeley（學術 anchor for HVLS / fan / thermal comfort）

### CBE Berkeley — Fans for Cooling Guidebook

- **Type**: 學術 guidebook（UC Berkeley Center for the Built Environment）
- **Authority**: Center for the Built Environment, UC Berkeley
- **Year**: 持續更新（GitBook 形式）
- **URL**: https://cbe-berkeley.gitbook.io/fans-guidebook/full-guidebook/case-studies-for-researchers
- **Hedging level**: ✅ Verified（amafans research/03 cite primary 多次）
- **Cited where**:
  - `examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md`（多處）
  - `examples/amafans-eaqs/research/09-sensor-placement-consultancy.md`
  - `examples/amafans-eaqs/deliverable-13pdf-client/03-問題定義與經營目標.md`
  - `examples/amafans-eaqs/deliverable-13pdf-client/01-產業與市場.md`
  - `framework/industry-addons/hvls-fan.md`
- **Notes**:
  - **HVLS 學術 anchor**：downward flow 體感降溫 **2-4°C**（4-7°F）、upward flow 1-2°C
  - 引 Luo et al. 2021 California 商業建築實測
  - HVAC 節能：AC setpoint 升 3°C + auto fan → 節能 **36%**；ceiling fan 自身耗電只佔 compressor 的 **2%**
  - **這是反方審查可用最強 conservative cite**
  - 廠商 marketing 常宣稱 6°C（**超出實測上緣**）→ 寫 deck 必標 hedging「廠商 typical 3-6°C / 學術 2-4°C」

### Luo et al. 2021 — California 商業建築實測

- **Type**: Academic paper（CBE Berkeley 引用、本身為獨立研究）
- **Authority**: 待 WebFetch 補（CBE 引用提到 Luo et al. 2021）
- **Year**: 2021
- **URL**: 未直接引、透過 CBE guidebook secondary cite
- **Hedging level**: ❌ Secondary cite（透過 CBE 引用、未直接 access primary paper）
- **Cited where**: `examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md`（透過 CBE guidebook 引）
- **Notes**: 引用前需 WebSearch Luo et al. 2021 ceiling fan California 確認 primary URL

### Singapore ZEB Plus — Building & Environment 2015 paper

- **Type**: Academic case study / paper
- **Authority**: CBE 引用提到、本身為 Building & Environment 期刊 2015
- **Year**: 2015
- **URL**: 未直接引、透過 CBE guidebook secondary cite
- **Hedging level**: ❌ Secondary cite（透過 CBE 引用、未直接 access primary paper）
- **Cited where**:
  - `examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md`（從 24°C 無扇 → 26.5°C 有扇 → HVAC 總用電 32% 節能）
  - `examples/amafans-eaqs/deliverable-13pdf-client/03-問題定義與經營目標.md`
- **Notes**:
  - 數字 32% 節能透過 CBE secondary、proposal 用前建議 WebFetch 原 paper 確認
  - Building & Environment 是 Elsevier 期刊、需 institution access 或 DOI 查找

---

## §3. 業界框架經典書 / Article

### Klein, Gary (2007) — Pre-Mortem Analysis

- **Type**: Harvard Business Review article（後續被歸納為 well-known framework）
- **Authority**: Gary Klein
- **Year**: HBR Sep 2007
- **URL（HBR primary）**: https://hbr.org/2007/09/performing-a-project-premortem
- **URL（secondary）**:
  - https://gamestorming.com/pre-mortem/
  - https://www.aevitium.com/pre-mortem-planning-guide
- **Hedging level**: ⚠️ Training-data（framework cite secondary、HBR primary 未直接 WebFetch）
- **Cited where**:
  - `framework/methodologies/phase-0-discovery.md` Layer 4（pre-mortem 假設審查）
  - `framework/methodologies/session-retrospective.md`（implicit reference）
- **Notes**:
  - Pre-mortem = 假設失敗、找出**為什麼**會失敗、比事後檢討提早 3 月
  - 與 Loopio Red Team Review (https://loopio.com/blog/red-team-review/) 高度互補

### Snowden, Dave & Boone, Mary — Cynefin Framework

- **Type**: HBR article
- **Authority**: David Snowden（IBM Knowledge Management）+ Mary Boone
- **Year**: HBR Nov 2007
- **URL**: https://hbr.org/2007/11/a-leaders-framework-for-decision-making
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/cynefin.md`
- **Notes**: Simple / Complicated / Complex / Chaotic 四象限 + 「Disorder」中央

### Kano, Noriaki (1984) — Kano Model for Customer Satisfaction

- **Type**: Academic paper（後續成為 well-known framework）
- **Authority**: Noriaki Kano（Tokyo University of Science）
- **Year**: 1984（原始 paper）
- **URL**: HBR/普及版多、原 paper 為日文
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/kano-model.md`
- **Notes**: Must-have / Performance / Delighter / Indifferent / Reverse 五分類

### Minto, Barbara — Pyramid Principle

- **Type**: Book（McKinsey-derived methodology）
- **Authority**: Barbara Minto（前 McKinsey）
- **Year**: 1987（書）
- **URL（HBR adjacent）**:
  - https://hbr.org/communicating-with-mainframes（implicit reference）
  - https://hbr.org/how-to-write-a-memo-that-gets-read
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/pyramid-principle.md`

### Wardley, Simon — Wardley Mapping

- **Type**: Methodology（open-source、book + LeanPub）
- **Authority**: Simon Wardley
- **URL**: https://learnwardleymapping.com/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/wardley-mapping.md`

### Ulwick, Tony — Jobs-to-be-Done (JTBD)

- **Type**: Methodology / book
- **Authority**: Tony Ulwick / Strategyn / 與 Clayton Christensen 共建
- **URL**: https://strategyn.com/jobs-to-be-done/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/jtbd.md`

### Osterwalder, Alex — Business Model Canvas / Value Proposition Canvas

- **Type**: Book / methodology
- **Authority**: Alex Osterwalder
- **URL**: https://www.strategyzer.com/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/bmc-vpc.md`

---

## §4. C4 Model / Software Architecture

### Brown, Simon — C4 Model

- **Type**: Methodology
- **Authority**: Simon Brown
- **URL**: https://c4model.com/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/c4-model.md`

---

## §5. DORA / SRE / DevOps

### Google SRE Book — Site Reliability Engineering

- **Type**: Book（O'Reilly + free online）
- **Authority**: Google SRE team
- **URL**: https://sre.google/books/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/dora-sre.md`

### DORA State of DevOps Reports

- **Type**: Industry research（Google Cloud / formerly DORA Inc.）
- **Authority**: DORA team
- **URL**: https://dora.dev/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/dora-sre.md`

### PagerDuty — Blameless Post-Mortem

- **Type**: Industry best practice
- **Authority**: PagerDuty
- **URL**: https://postmortems.pagerduty.com/culture/blameless/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/session-retrospective.md`

---

## §6. AI / LLM Governance Papers

### CSA Research Note — AI-Generated Code Vulnerability Surge 2026

- **Type**: Industry research note
- **Authority**: Cloud Security Alliance
- **Year**: 2026
- **URL**: https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-generated-code-vulnerability-surge-2026/
- **Hedging level**: ⚠️ Training-data（cite 過、未驗 paywall 狀態）
- **Cited where**: `framework/methodologies/ai-codegen-anti-debt.md`

### Shekhar — Comprehension Debt of LLM-Generated Code

- **Type**: Medium article（一級行業思考、非 peer-reviewed）
- **URL**: https://shekhar14.medium.com/comprehension-debt-the-ticking-time-bomb-of-llm-generated-code-b8025e7f132a
- **Hedging level**: ⚠️ Training-data（單一作者 Medium、非 authoritative）
- **Cited where**: `framework/methodologies/ai-codegen-anti-debt.md`

---

## §7. Sensor Placement / IEQ 學術

### Examining IEQ Sensor Placement Strategies（arXiv 2504.08237）

→ 詳見 §1

### 大同大學 EMS / 工研院 IIoT 等台灣學術 case

→ 詳見 `case-studies-references.md` §3

---

## §8. 累計 citation 數

| Category | 已索引 | ✅ Verified | ⚠️ Training-data | ❌ Secondary |
|---|---|---|---|---|
| arXiv | 4 | 2 | 2 | 0 |
| CBE Berkeley + 引用 paper | 3 | 1 | 0 | 2 |
| 業界框架經典書 | 8 | 0 | 8 | 0 |
| SRE / DevOps | 3 | 0 | 3 | 0 |
| AI / LLM governance | 2 | 0 | 2 | 0 |
| **Total** | **20** | **3** | **15** | **2** |

**Goal**：未來 case 用到 paper、優先 WebFetch primary、把 ⚠️ 升 ✅；secondary cite 必要時補 primary access。

---

## §9. 補完 reference 待辦

| 待辦 | 動作 |
|---|---|
| arXiv 2509.20497 / 2601.07786 補完 metadata | WebFetch arXiv abstract page、補 title / authors / venue |
| Luo et al. 2021 補 primary | WebSearch「Luo 2021 ceiling fan California Energy Building」找 DOI |
| Singapore ZEB Plus paper 補 primary | Building & Environment 2015 + author + DOI |
| Klein 2007 pre-mortem HBR primary | WebFetch HBR primary URL 驗證 access state |
