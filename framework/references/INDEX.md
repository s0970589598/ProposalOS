# References Library — Master Cross-Reference INDEX

> 從「需求 → reference」單點進入。新案 / 新 module / 新 addon、先查本 INDEX、找到對應 reference cluster、再去查具體 4 個 reference file。
>
> **Layer**：本 INDEX = 觸發路由、`regulatory-standards.md` / `academic-papers.md` / `industry-analyst-reports.md` / `vendor-product-docs.md` / `case-studies-references.md` = 具體 citation entries。

---

## §1. By Module Trigger（modules/01-13 對應）

### Module 01 — Industry & Market（產業與市場）

**用到的 reference cluster**：
- TAM/SAM/SOM 數字 → `industry-analyst-reports.md` §6（HVLS / 產業 market report、❌ paywall 注意）
- ESG / 排碳 / 補助 → `regulatory-standards.md` §4（經濟部 0.474 kgCO₂e/kWh、114 年補助）
- EaaS / SaaS 趨勢 → `industry-analyst-reports.md` §9（Carlsquare / Facilities Management Advisor）

### Module 02 — Competitors & Alternatives（競品與替代方案）

**用到的 reference cluster**：
- Vendor product page → `vendor-product-docs.md` §1（HVLS 廠商）+ §5（Daikin / Atlas Copco / Trane 跨類別）
- Industry analyst ranking → `industry-analyst-reports.md` §5（ABI / Mordor / Precision）

### Module 03 — Problem & Business Goals（問題定義）

**用到的 reference cluster**：
- 學術 anchor 對應「降溫」「節能」claim → `academic-papers.md` §2（CBE Berkeley / Luo et al. / Singapore ZEB Plus）
- 客戶 case → `case-studies-references.md` §1（IKEA / Coca-Cola / Newmarket）

### Module 04 — Service Blueprint（藍圖）

無特定 reference cluster（內部 process design）

### Module 05 — Stakeholders & RACI

- Stakeholder interview template → `vendor-product-docs.md` §8（NN/g / UXPin / Info-Tech）

### Module 06 — Data Integration & Governance

**用到的 reference cluster**：
- Modbus / RS485 / MQTT / Sparkplug → `vendor-product-docs.md` §6
- IoT Gateway → `vendor-product-docs.md` §3（HiveMQ / Robustel）
- Sensor BOM → `vendor-product-docs.md` §2

### Module 07 — Compliance, Security, AI Risk

**用到的 reference cluster**（**核心**）：
- ISO 27001 / IEC 62443 → `regulatory-standards.md` §1（ISO/IEC）
- NIST SP 800-213A → `regulatory-standards.md` §2
- ASHRAE 62.1 → `regulatory-standards.md` §3
- 個資法 / GDPR / APPI / SG-PDPA → `regulatory-standards.md` §4-5
- AWS / Azure compliance → `vendor-product-docs.md` §3
- Anthropic / Claude API → `vendor-product-docs.md` §4
- OWASP / RFC → `regulatory-standards.md` §7

### Module 08 — Architecture & NFR

- AWS / Azure / GCP SLA → `vendor-product-docs.md` §3
- HiveMQ / Robustel edge architecture → `vendor-product-docs.md` §3, §6

### Module 09 — Solution Options & Phased Rollout

- Discovery / scoping framework → `vendor-product-docs.md` §8
- Phase 0 → `academic-papers.md` §3（Klein pre-mortem）

### Module 10 — Procurement & Pricing

- 經濟部 / 政府補助 → `regulatory-standards.md` §4

### Module 11 — Acceptance, Benefits, Operations

- NPS / B2B SaaS benchmark → `industry-analyst-reports.md` §11
- ITIL / SLA → `regulatory-standards.md` §9 + `vendor-product-docs.md` §3

### Module 12 — Risk Registry & Red Team

- Loopio / AVID ML red team → `vendor-product-docs.md` §10
- Klein pre-mortem → `academic-papers.md` §3

### Module 13 — MVP / System Design

- IoT Gateway design → `vendor-product-docs.md` §3, §6
- Sensor placement → `academic-papers.md` §1（arXiv 2504.08237）

---

## §2. By Industry Addon Trigger（industry-addons/ 對應）

### `air-quality-system.md`

- ASHRAE 62.1 / 55 → `regulatory-standards.md` §3
- ISO 16000 → `regulatory-standards.md` §1
- CNS 3612 / OSHA / ACGIH → `regulatory-standards.md` §4, §6
- IEQ placement paper → `academic-papers.md` §1（arXiv 2504.08237）
- Senseair / Kaiterra / Honeywell sensor → `vendor-product-docs.md` §2

### `hvls-fan.md`

- CBE Berkeley → `academic-papers.md` §2
- HVLS vendor → `vendor-product-docs.md` §1
- HVLS deployment cases → `case-studies-references.md` §1
- HVLS market sizing → `industry-analyst-reports.md` §6

### `iiot-deployment.md`

- IEC 62443 → `regulatory-standards.md` §1
- NIST SP 800-213A / Cyber Resilient Building → `regulatory-standards.md` §2
- HiveMQ / FlowFuse Sparkplug / Robustel → `vendor-product-docs.md` §3, §6
- AWS / Azure IoT Core → `vendor-product-docs.md` §3

### `healthcare.md`

- ASHRAE 170 → `regulatory-standards.md` §3
- USP 1079.4 → `regulatory-standards.md` §8
- HIPAA / FDA 21 CFR Part 11 → `regulatory-standards.md` §10

### `energy-esg.md`

- 經濟部能源署排碳係數 → `regulatory-standards.md` §4
- 能源管理法 → `regulatory-standards.md` §4
- ASHRAE 90.1 → `regulatory-standards.md` §3
- TGPF 溫室氣體 → `industry-analyst-reports.md` §7
- 大同大學 EMS case → `case-studies-references.md` §3

### `manufacturing.md`

- IEC 62443 → `regulatory-standards.md` §1
- TSMC SEMI E187 public → `case-studies-references.md` §4
- 工研院 IIoT → `industry-analyst-reports.md` §7

### `b2b2b-channel-partnership.md`

- Channel partner agreement template → `vendor-product-docs.md` §7
- QBR template → `vendor-product-docs.md` §9

### `saas-software.md`

- B2B SaaS benchmark → `industry-analyst-reports.md` §11

### 其他 addon（食品物流 / 政府教育 / 零售 / 建設）

- 對應 reference 待補（未來案件帶出新需求時 append）

---

## §3. By Methodology Trigger（methodologies/ 對應）

### `phase-0-discovery.md`

- Klein pre-mortem / Gamestorming → `academic-papers.md` §3 + `vendor-product-docs.md` §10
- Loopio red team → `vendor-product-docs.md` §10
- Atlassian scoping → `vendor-product-docs.md` §8
- McKinsey 7-step → `industry-analyst-reports.md` §4

### `multi-tool-verification.md`

- 本 library 全部都是此 methodology 的應用實踐
- 對應 ~/.claude/CLAUDE.md 全文 verification protocol

### `session-retrospective.md`

- Self-Evolving Agents（arXiv 2508.07407）→ `academic-papers.md` §1
- PagerDuty blameless → `academic-papers.md` §5
- Echometer / TeamRetro → `vendor-product-docs.md` §9

### `cr-handling-protocol.md`

- Joe the IT Guy 5 questions → `vendor-product-docs.md` §10
- Wibas CMMI → `vendor-product-docs.md` §10

### `cybersecurity-frameworks.md`

- 全部 → `regulatory-standards.md` §1-2, §7

### `mlops-and-ai-governance.md`

- AI tech debt → `vendor-product-docs.md` §11
- Anthropic / Claude → `vendor-product-docs.md` §4

### `ai-codegen-anti-debt.md`

- AI tech debt blog → `vendor-product-docs.md` §11
- CSA Research Note → `academic-papers.md` §6

### `c4-model.md` / `cynefin.md` / `kano-model.md` / `pyramid-principle.md` / `wardley-mapping.md` / `jtbd.md` / `bmc-vpc.md` / `dora-sre.md` / `service-design.md` / `software-architecture-patterns.md` / `pestel-swot.md` / `shipley-apmp.md` / `rfp-rfi-rfq.md` / `spine-mode-for-large-proposal.md`

- 全部對應 `academic-papers.md` §3 框架書 + 各 method 自己 reference

---

## §4. By 8-Mandatory-Check Trigger

### `A-rtm.md`（需求追蹤矩陣）

- 無特定 reference cluster

### `B-communication-plan.md`

- Stakeholder interview → `vendor-product-docs.md` §8

### `C-decision-log.md`

- 無特定 reference

### `D-secure-sdlc.md`（**核心**）

- OWASP Top 10 / ASVS → `regulatory-standards.md` §7
- RFC 9116 / 9325 → `regulatory-standards.md` §7
- NIST SP 800-53 → `regulatory-standards.md` §2
- GDPR Art. 28 / DPA → `regulatory-standards.md` §5
- Anthropic Commercial Terms → `vendor-product-docs.md` §4

### `E-sbom-license-supply-chain.md`

- 待補（未來案件帶出）

### `F-rto-rpo-rollback.md`

- AWS DR whitepaper → `vendor-product-docs.md` §3

### `G-exit-plan.md`

- 無特定 reference

### `H-evidence-pack.md`

- 證據集 → 引本 library 全部

### `I-deployment-model.md`

- Robustel edge → `vendor-product-docs.md` §3
- AWS / Azure regional → `vendor-product-docs.md` §3

---

## §5. By Case Type（哪類案件查哪些 reference）

### 聯名 RFP / 聯名 partnership 案

- `vendor-product-docs.md` §7（partnership template）
- `vendor-product-docs.md` §9（QBR / pitch deck）
- `regulatory-standards.md` §1 + §5（合規共擔）

### IIoT / OT / 工業 sensor 案

- `regulatory-standards.md` §1（IEC 62443）+ §2（NIST 800-213A）
- `vendor-product-docs.md` §2（sensor）+ §3（PaaS）+ §6（protocol）
- `academic-papers.md` §1（arXiv IEQ placement）
- `case-studies-references.md` §1（HVLS 部署 case）

### 空品 / IAQ / HVLS 系統案（amafans-eaqs 標竿）

- 全部 7 個 file 都用
- 重點：`regulatory-standards.md` §3 ASHRAE / §4 CNS / `academic-papers.md` §2 CBE Berkeley / `vendor-product-docs.md` §1 HVLS 廠 / `case-studies-references.md` §1 case

### 跨境部署（台 / 日 / 東南亞 / 歐美）

- `regulatory-standards.md` §5 跨境法（GDPR / APPI / SG-PDPA / 個資法）
- `vendor-product-docs.md` §3（AWS region 選擇）

### AI 月報 / LLM 整合案

- `regulatory-standards.md` §1 ISO 27001（AI usage governance）
- `vendor-product-docs.md` §4 Anthropic / Bedrock
- `academic-papers.md` §6 AI / LLM governance
- `vendor-product-docs.md` §11 AI tech debt

### Energy / ESG / 碳盤查案

- `regulatory-standards.md` §4 經濟部排碳係數 / 能源管理法
- `industry-analyst-reports.md` §7 TGPF / 工研院
- `case-studies-references.md` §3 EMS case

---

## §6. By Hedging Status — Quick filter

### ✅ Verified（可直接 cite primary、無需 disclaimer）

- 經濟部能源署 0.474 kgCO₂e/kWh
- ISO 27001 / IEC 62443 / NIST SP 800-213A / ASHRAE 62.1（amafans verified）
- 個資法 / GDPR / APPI / SG-PDPA（amafans verified）
- AWS / Azure / GCP product docs（vendor primary）
- HVLS vendor product pages（vendor primary）
- arXiv 2504.08237 / 2508.07407（primary URL）
- CBE Berkeley Fans Guidebook
- 大同大學 EMS（PROD 內部 verified）

### ⚠️ Training-data（cite 前最好 re-verify、ship 加 disclaimer）

- 多數 ISO 子標準 / NIST 子標準（cite 過但未直接 WebFetch 內文）
- 業界框架經典書（Klein / Cynefin / Kano / Pyramid / Wardley / JTBD）
- 多數 SaaS benchmark / 政府補助案（年份可能過期）

### ❌ Paywall / Secondary cite only（不可作 primary fact source）

- Gartner / IDC / Forrester（除非 user 有 subscription）
- Mordor / Precision / Business Research Insights HVLS market（公開 abstract、full paywall）
- Deloitte 57% manufacturing cloud（透過 pmwares blog）
- BCG presentation style（third-party blog reverse-engineered）
- Big Ass Fans Lexington pilot 數字（vendor-projected）

---

## §7. Quick lookup — 「最常被引用 Top 10」

| Rank | Reference | Cited in |
|---|---|---|
| 1 | CBE Berkeley Fans Guidebook | hvls-fan addon + research/03 + deliverable/03 + research/09 |
| 2 | NIST SP 800-213A | research/07 + deliverable/07 + iiot-deployment + D-secure-sdlc |
| 3 | ISO/IEC 27001:2022 | research/07 + deliverable/07 + iiot + D-secure-sdlc + Module 07 |
| 4 | IEC 62443 series | research/07 + deliverable/07 + iiot + manufacturing |
| 5 | 經濟部能源署 0.474 kgCO₂e/kWh | CR-002 + deliverable/01 + energy-esg |
| 6 | 個資法 / PDPA | research/07 + deliverable/07 |
| 7 | EU GDPR | research/07 + deliverable/07 + D-secure-sdlc |
| 8 | AWS compliance / SLA | research/07 + research/08 + iiot-deployment |
| 9 | arXiv 2504.08237 IEQ Placement | air-quality-system addon + research/09 |
| 10 | Big Ass Fans / MacroAir / Magnohub | research/02 + research/02b + deliverable/02 |

---

## §8. 使用流程 quick guide

```
新案 / 新 doc 寫到要 cite 外部 source 時：

1. 先看本 INDEX 哪個 cluster 對應自己的 module / addon / topic
2. 跳到對應 reference file（regulatory / academic / analyst / vendor / case）
3. 找到具體 entry、看 hedging level、複製 URL + metadata
4. 若 library 沒收 → WebSearch + WebFetch primary → 加 entry 回 library + commit
5. cite 時對齊 hedging level（library ⚠️ → deliverable 也 ⚠️、不可升 ✅）
```

---

## §9. Library 健康度 KPI

| KPI | 2026-06-01 | Goal Q3 2026 |
|---|---|---|
| 總 unique citation | ~200 | 300+ |
| ✅ Verified ratio | ~50% | 70%+ |
| ⚠️ Training-data ratio | ~35% | <20% |
| ❌ Paywall/Secondary ratio | ~15% | 與 paywall 自然占比一致 |
| Cross-ref 完整度（modules / addons / methodologies linked）| 50% | 100% |
| 跨案重用次數 / 案 | 未測 | 5+ avg per case |

**累積 mechanism**：每新案結尾 session-retrospective 跑時、檢查本案有沒有新引 reference、append 進 library、commit。
