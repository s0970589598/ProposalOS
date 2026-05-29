# 快速決策樹 — 我這案該用哪些工具？

ProposalOS 有 13 模組 + 8 強制檢查項 + 15 方法論 + 7 add-on + 8 template = **太多選項**。
這份決策樹用 5-7 個問題、5 分鐘**告訴你該用哪些**。

---

## Step 1：5 個關鍵問題

依序回答（如不確定、跳到後面看判斷）：

### Q1：案件金額？

```
< NT$ 50 萬     → Tier S（Small）
50-500 萬        → Tier M（Medium）
500 萬+ / 政府   → Tier L（Large）
```

### Q2：案件情境（[Cynefin](framework/methodologies/cynefin.md)）？

```
規格已定、客戶要的清楚      → Simple
有複雜度但專家可解          → Complicated
創新 / 沒人做過 / 不確定     → Complex
危機 / 客戶救火             → Chaotic
```

### Q3：客戶屬性？

```
□ 政府 / 國營 / 公部門
□ 跨國集團 / 上市櫃
□ 金融 / 醫療（嚴格監理）
□ 製造 / 食品 / 物流
□ 零售 / 餐飲 / 電商
□ 教育 / 公益
□ 一般中小企業
```

### Q4：詢問形式（[RFP/RFI/RFQ](framework/methodologies/rfp-rfi-rfq.md)）？

```
RFI（早期探勘） → 1-2 頁公司簡介、別寫提案
RFP（正式提案）  → 跑完整流程
RFQ（純報價）    → 對規格報價、別寫顧問論述
我方主動接觸    → 不在 RFP 流程內、自由發揮
```

### Q5：含這些嗎？

```
□ AI / ML / LLM 功能
□ 純軟體 / SaaS
□ 含資安要求高（HIPAA / PCI / SOC 2 / 機密）
□ 含 IoT / 硬體
□ ESG / 永續報告
□ 跨國 / 跨境資料
```

---

## Step 2：依答案查表

### 預設一定要用的

不管什麼案件、這些都跑：

| 必用 | 來自 |
|---|---|
| 13 模組（深淺依規模）| [framework/modules/](framework/modules/) |
| 8 強制檢查項 | [framework/8-mandatory-checks/](framework/8-mandatory-checks/) |
| [產銷人發財](framework/modules/03-problem-business-goals.md) | 訪談覆蓋自查 |
| [Pyramid Principle / SCQA](framework/methodologies/pyramid-principle.md) | 執行摘要寫作 |
| [Kano Model](framework/methodologies/kano-model.md) | 需求分類（取代 P0/P1/P2）|

### 依 Tier（Q1）加

| Tier | 提案模板 | 加方法論 |
|---|---|---|
| **Tier S（< 50 萬）** | [proposal-template-short.md](templates/proposal-template-short.md) | 上面預設即可 |
| **Tier M（50-500 萬）** | [proposal-template-standard.md](templates/proposal-template-standard.md) | + [JTBD](framework/methodologies/jtbd.md)、[SWOT](framework/methodologies/pestel-swot.md) |
| **Tier L（500 萬+）** | [proposal-template-enterprise.md](templates/proposal-template-enterprise.md) | + 完整 [Shipley/APMP](framework/methodologies/shipley-apmp.md) + [Capture Plan](templates/capture-plan-template.md) |

### 依 Cynefin 情境（Q2）加

| 情境 | 加 |
|---|---|
| Simple | 不加方法論、用 Short template |
| **Complicated（預設）** | 完整 ProposalOS 13 模組 |
| **Complex** | + [PoC/Pilot Pricing](templates/poc-pilot-pricing-template.md) + [JTBD](framework/methodologies/jtbd.md) + [Service Design](framework/methodologies/service-design.md) |
| Chaotic | 別寫完整提案、用 LOI 先行 |

### 依客戶屬性（Q3）加 add-on

| 客戶 | 加 add-on |
|---|---|
| 政府 / 公部門 | [government-education.md](framework/industry-addons/government-education.md) + [Compliance Matrix](templates/compliance-matrix-template.md) + Shipley 全套 |
| 跨國集團 / 上市櫃 | + 跨境資料主權、+ ESG（如出口歐盟）|
| 金融 | [finance.md](framework/industry-addons/finance.md) + 完整 [Cybersecurity Frameworks](framework/methodologies/cybersecurity-frameworks.md) |
| 醫療 | [healthcare.md](framework/industry-addons/healthcare.md) |
| 製造 | [manufacturing.md](framework/industry-addons/manufacturing.md) |
| 食品 / 冷鏈 | [food-logistics.md](framework/industry-addons/food-logistics.md) |
| 零售 / 電商 | [retail-ecommerce.md](framework/industry-addons/retail-ecommerce.md) |

### 依詢問形式（Q4）加

| 形式 | 動作 |
|---|---|
| RFI | 1-2 頁簡介、無提案 |
| RFP（小）| Tier 對應 template |
| RFP（政府 / 大）| + [Compliance Matrix](templates/compliance-matrix-template.md) + Shipley 全套 |
| RFQ | 純報價單、無 ProposalOS 13 模組 |

### 依 Q5 加方法論 / add-on

| 含 | 加 |
|---|---|
| AI / ML / LLM | [MLOps + AI Governance](framework/methodologies/mlops-and-ai-governance.md) + 加深模組 07 AI 風險段 |
| 純軟體 / SaaS | [C4 Model](framework/methodologies/c4-model.md) + [Software Architecture Patterns](framework/methodologies/software-architecture-patterns.md) + [DORA + SRE](framework/methodologies/dora-sre.md) |
| 資安要求高 | [Cybersecurity Frameworks](framework/methodologies/cybersecurity-frameworks.md) 完整 + [BSIMM](framework/methodologies/cybersecurity-frameworks.md) |
| IoT / 硬體 | [manufacturing.md](framework/industry-addons/manufacturing.md) Purdue Model + 邊緣告警設計 |
| ESG / 永續 | [energy-esg.md](framework/industry-addons/energy-esg.md) |
| 跨國資料 | [跨國資料主權交叉索引](framework/industry-addons/README.md) |

---

## Step 3：實際案例配對

### 範例 A：明陽食品冷鏈監控（v1.0 範例）

| Q | A |
|---|---|
| Q1 金額 | 380 萬 → **Tier M** |
| Q2 情境 | 規格已知、有專家可問 → **Complicated** |
| Q3 客戶 | 食品 / 中型企業 |
| Q4 詢問 | 客戶主動找我方 → 不在 RFP 流程 |
| Q5 含 | IoT |

**配方**：
- 13 模組 + 8 檢查項（必）
- 產銷人發財、Pyramid、Kano（必）
- proposal-template-standard.md
- JTBD + SWOT（Tier M 加）
- food-logistics.md（食品 add-on）
- manufacturing.md（IoT 部分借用）

→ 對應 [examples/mingyang-cold-chain/](examples/mingyang-cold-chain/)。

### 範例 B：醫院 AI 影像輔助診斷（虛構）

| Q | A |
|---|---|
| Q1 金額 | 1500 萬 → **Tier L** |
| Q2 情境 | AI 臨床決策、業界都還在實驗 → **Complex** |
| Q3 客戶 | 醫療 / 上市櫃醫院 |
| Q4 詢問 | RFP |
| Q5 含 | AI + 高資安 + 跨國集團（如為國際集團）|

**配方**：
- 13 模組 + 8 檢查項（必）
- 產銷人發財、Pyramid、Kano（必）
- proposal-template-enterprise.md
- 完整 Shipley + Capture Plan + Compliance Matrix
- **PoC/Pilot Pricing**（Complex 情境）
- JTBD + Service Design
- healthcare.md add-on（含 SaMD、HIPAA、IEC 62304）
- MLOps + AI Governance 完整
- Cybersecurity Frameworks 完整
- 跨境資料主權檢查（如國際集團）

→ **這個案件很多方法論都要用**、但**不是「全部 15 個」**。

### 範例 C：政府公部門 IT 標案 800 萬

| Q | A |
|---|---|
| Q1 金額 | 800 萬 → **Tier L** |
| Q2 情境 | 規格嚴格、已定 → **Complicated** |
| Q3 客戶 | 政府 |
| Q4 詢問 | RFP（公開招標）|
| Q5 含 | 資安（資通安全責任等級 B 級）|

**配方**：
- 13 模組 + 8 檢查項（必）
- 產銷人發財、Pyramid、Kano（必）
- proposal-template-enterprise.md
- **Shipley 全套**（含 Win Themes、Ghosting、Pink/Red/Gold Team）
- **Compliance Matrix**（政府必有）
- government-education.md add-on
- Cybersecurity Frameworks（依資安責任等級）
- PESTEL + SWOT 對手分析

→ 不需要 MLOps、Service Design、JTBD（規格已定）。

### 範例 D：客戶要 30 萬建一個內部 dashboard

| Q | A |
|---|---|
| Q1 金額 | 30 萬 → **Tier S** |
| Q2 情境 | 規格清楚 → **Simple** |
| Q3 客戶 | 一般中小企業 |
| Q4 詢問 | 客戶主動找 |
| Q5 含 | — |

**配方**：
- proposal-template-short.md（精簡）
- 13 模組（簡寫）+ 8 檢查項（部分簡化）
- **不需要**：Shipley、Compliance Matrix、PoC Pricing、Service Design、大部分方法論

→ Short template 就夠、別 over-engineering。

---

## Step 4：自我打分

跑完案件後對照 [CHEAT-SHEET.md](CHEAT-SHEET.md) 的「自我打分表」。

---

## 反 over-engineering 提醒

ProposalOS 14 個方法論不是**全部都用**。決策樹的目的是**篩選**。

- ❌ 不要因為「有這方法論、不用浪費」就硬塞
- ✅ 客戶情境用得到才放
- ❌ 不要用方法論名詞炫技
- ✅ 客戶法務 / IT 看到熟悉框架反而加分（但要真的對應）

## 一行決策

如果決策樹太重、用這條：

> **客戶屬性 + 案件規模 = 1 個 template + 1-2 個 add-on + 2-3 個方法論。多了 over-engineering、少了缺。**

---

## 相關文件

- [README.md](README.md) — 總覽
- [CHEAT-SHEET.md](CHEAT-SHEET.md) — 一頁濃縮
- [framework/MATRIX.md](framework/MATRIX.md) — 12 × 8 對應
- [framework/industry-addons/MODULE-INDEX.md](framework/industry-addons/MODULE-INDEX.md) — 模組看 add-on
- [framework/methodologies/README.md](framework/methodologies/README.md) — 方法論清單
- [playbook/proposal-flow.md](playbook/proposal-flow.md) — 18 階段流程
