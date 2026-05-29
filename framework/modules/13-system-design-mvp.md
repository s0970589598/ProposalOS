# 模組 13｜系統設計細節 + MVP 交付包

> 提案進入後期、用「規格」生 7 個 deliverable、讓 AI / 工程師 / 客戶接得起來。
> 跟模組 08（功能 NFR 架構）的差別：08 是**架構藍圖**、本模組是**規格細節 + 可執行交付**。
> 對應 ProposalOS skill **Phase 7：System Design + MVP Handoff**。

## 1. 7 個 deliverable

| # | Deliverable | 用途 | 給誰看 |
|---|---|---|---|
| 1 | **資料流圖**（data-flow.md）| 端到端資料怎麼跑 | 工程師 / 法務（個資流向）/ 客戶 IT |
| 2 | **資料結構**（data-schema.md）| Entity / Relation / 表 schema | 後端 / DBA / 整合工程師 |
| 3 | **資料欄位**（data-fields.md）| 每個 entity / 每個 UI screen 的欄位 + 型別 + 來源 | 前端 / 後端 / QA |
| 4 | **技術選用**（tech-stack.md）| 選哪個 framework / DB / infra / 3rd party + 為什麼 | 工程 leader / CTO / 客戶 IT |
| 5 | **HTML mockup**（mockup/*.html）| 純視覺 demo、給客戶看「長這樣」 | 客戶 / 老闆 / 銷售 |
| 6 | **互動 prototype**（prototype/）| 可點擊狀態變化、wireframe level | 客戶 / UAT 早期 review |
| 7 | **AI codegen 規格包**（ai-handoff/spec.md）| 給 v0.dev / bolt.new / cursor / 工程師接手生真 MVP | AI codegen 工具 / 工程師 |

## 2. 何時做（in proposal flow）

```
Phase 1：產業 / 競品 / 訪談
Phase 2：As-Is / To-Be / 角色 / 資料
Phase 3：合規 / 架構 / 方案
Phase 4：報價 / 驗收 / 風險
Phase 5：強制檢查
Phase 6：反方審查
Phase 7：系統設計 + MVP 交付 ← 本模組
```

⚠️ **跑 Phase 7 前先過 Phase 5 強制檢查、規格才穩**。否則寫 7 deliverable 還會大改。

## 3. 「照規格」原則 ⭐

7 個 deliverable **必須源自既有 proposal 文件**、不能憑空編：

| Deliverable 來源 |
|---|
| RFP（功能範圍 / 介面）|
| outline.md（deck narrative）|
| DESIGN.md（brand / theme）|
| proposal.md（完整提案、若有）|
| rtm.md（需求追溯）|
| change-requests/（CR-001/002...）|
| meeting-minutes/（重大決議）|

→ 寫 Phase 7 前 **先讀完上述所有檔**、抽取 spec、再生 deliverable。

→ 規格沒講的部分**標 ⚠️ 推測 / 待確認**、不要當事實寫。

## 4. 7 deliverable 詳解

### 4.1 資料流圖（data-flow.md）

**內容**：
- 端到端 flow：sensor → device → gateway → 雲端 → DB → API → UI
- 含**外部系統**（台電 / 銀行 / 認證機構 / 3rd party API）
- 每個 hop 標：頻率 / 協議 / payload size / 加密
- 個資 / 敏感資料**特別標**（給法務看）

**Template skeleton**：
```markdown
# 資料流 — 端到端

## L1：System Context 流向
（mermaid / ASCII）

## L2：每個 hop 詳解
| Hop | from | to | 協議 | 頻率 | payload | 加密 |
|---|---|---|---|---|---|---|

## L3：敏感資料流向（給法務 / 個資法 audit）
（含 PII / 客戶營業秘密 / 跨境傳輸）

## L4：失效情境 + 降級行為
（離線 / 部分系統當）
```

### 4.2 資料結構（data-schema.md）

**內容**：
- ER 圖（entity + relation）
- 每個 entity 的 attribute（field / 型別 / nullable / index / FK）
- Multi-tenant 邊界
- 時序資料 vs 關聯資料分流（DDB vs RDS / Postgres）

**Template skeleton**：
```markdown
# 資料結構

## L1：ER 圖
（mermaid erDiagram）

## L2：核心 entity
### Entity: XXX
- table: xxx
- store: MySQL / DynamoDB / S3
- TTL: ...
- 欄位：(per data-fields.md)

## L3：tenant 隔離策略
（per-tenant DB / shared DB column tenant_id / schema-level）

## L4：時序 vs 關聯資料分流
```

### 4.3 資料欄位（data-fields.md）

**內容**：
- per Entity：欄位 / 型別 / 約束 / 範例 / 來源（哪個 sensor / 哪個 user input）
- per UI Screen：顯示哪些欄位 + format + 來源
- ⚠️ enum 列舉值要列完

**Template skeleton**：
```markdown
# 資料欄位

## A. 後端欄位（per entity）
### Entity: XXX
| 欄位 | 型別 | 約束 | 來源 | 範例 |

## B. 前端欄位（per UI screen）
### Page: 總覽
| 欄位 | 顯示 format | 對應 entity | 更新頻率 |
```

### 4.4 技術選用（tech-stack.md）

**內容**：
- 每層選什麼 + **為什麼**（含選用 / 不選的理由）
- 對應客戶既有 stack 整合（如客戶已有 SAP / 既有 ERP）
- 開源 vs 商業 vs 雲服務 trade-off

**Template skeleton**：
```markdown
# 技術選用

## 選用總覽
| 層 | 選用 | alternatives | 理由 |

## 詳細
### Frontend
### Backend
### Database
### Time-series / IoT
### Auth
### Deploy / Infra
### Observability
### 3rd party

## 客戶既有 stack 整合
（API / data sync / SSO）

## 不選的方案 + 為什麼
（避免後人問「為什麼不用 X」）
```

### 4.5 HTML mockup（mockup/*.html）

**原則**：
- 純視覺、無 backend、用假資料
- 可 deploy Netlify / 加進 deck-hub
- **用 pitch-deck-builder 同色系**（跟 deck 視覺一致）
- 每個 page 一個 HTML（或 single-file SPA with anchor nav）
- ⚠️ **不騙能用**、要 footer 標「Mockup · 非真實系統」

**內容**：
- 對應 RFP §6.1 列的每個 page
- 用 mock data fixture
- 可點 link / nav / button（純視覺、沒真實 effect）

### 4.6 互動 prototype（prototype/）

**原則**：
- 增加 state interaction：dropdown 改值會聯動 / toggle 切換 / chart hover
- **不寫真 backend**、用 in-memory state + mock JSON
- 可以是 single-file HTML + Alpine.js / 純 JS、或 Vite + Vue / React 小 scaffold
- 範圍：**A mockup 的進階版**、不是 production app

**何時跳過 Option B**：
- 客戶只需看截圖 / demo deck — 只做 A
- 沒人想 maintain prototype repo — 跳 B、直接 A + C

### 4.7 AI codegen 規格包（ai-handoff/spec.md）

**原則**：
- **規格化 spec**、讓任何 AI codegen 工具（v0.dev / bolt.new / cursor / Claude Code）能讀懂
- 不綁定特定工具
- 含：UI flow / component map / data model / API contract / 樣式 token

**Template skeleton**：
```markdown
# AI Codegen Handoff Spec

## 系統一覽
（一段話描述整個系統做什麼）

## UI flow
（每個 page / route / state transition）

## Component map
（per page 用哪些 component）

## Data model
（簡化的 entity / relation、給 AI 生 schema 用）

## API contract（OpenAPI 摘要）
（每個 endpoint：method / path / req / resp）

## 樣式 token
（color / font / spacing、跟 deck DESIGN.md 對齊）

## Mock data
（每個 entity 給 3-5 筆假資料）

## Out of scope
（明確列「**這版不做**」、避免 AI 自己加）

## 給 AI 工具的提示語範本
> 用 [Vue 3 + Vite / Next.js 14 / SvelteKit]、依以下 spec 生 MVP...
```

## 5. 跟其他 module 的關係

| Module | 關係 |
|---|---|
| 04 As-Is / To-Be / Service Blueprint | 提供 user journey 給 mockup 用 |
| 05 Stakeholders + RACI | tech-stack 選用要對齊角色（誰維護）|
| 06 Data Integration Governance | data-schema 要 align governance 規則 |
| 07 Compliance / Security / AI | data-flow 標敏感 / tech-stack 標認證 |
| 08 Architecture + NFR | 本模組是 08 的細節展開 |
| 09 Solution Options | tech-stack 選用 align 客戶選的 option |
| 11 Acceptance | UI mockup 對應驗收項 |
| 12 Risk | mockup 不真實能用、寫明限制 |

## 6. 跨產業可重用 pattern

| 產業 | Phase 7 重點 |
|---|---|
| IIoT / 製造 | data flow（多 sensor / gateway / cloud）+ tech stack（MQTT / time-series DB）|
| SaaS | data schema multi-tenant + tech stack（auth / billing / API）|
| 醫療 | data flow 個資強標 + tech stack 法規認證 |
| 金融 | data schema audit trail + tech stack（compliance / log immutability）|
| 政府 / 教育 | tech stack 既有系統整合（SSO / OAuth / 政府雲）|
| 零售 / 電商 | data flow 含 payment / 物流 + UI mockup 含購物車 |

## 7. ⚠️ 紀律 / 禁忌

| ❌ 禁 | 為什麼 |
|---|---|
| ❌ 7 deliverable 寫得比 spec 還激進（加新功能 / 改範圍）| 變成 scope creep、不照規格 |
| ❌ Mockup 寫成「能用」誤導客戶 | 客戶簽完才發現要重做、信任崩 |
| ❌ Tech stack 選不熟的 framework 炫技 | 維護悲劇 |
| ❌ AI handoff spec 太抽象 | 工程師接不下去 |
| ❌ 跳過 Phase 5 強制檢查就跑 Phase 7 | 規格不穩、7 deliverable 寫了還大改 |
| ❌ 不標 ⚠️ 推測 / 待確認 | 客戶當事實簽、出事責任不清 |

## ✅ 紀律

| ✅ 做 | 為什麼 |
|---|---|
| ✅ 讀完所有 source（RFP / outline / DESIGN / proposal / RTM / CR / 會議記錄）再寫 | 「照規格」基礎 |
| ✅ 每個推測 / 待確認**明標**+ 對應 pending tracker | 客戶 / 工程師看得到風險 |
| ✅ Mockup footer 強標「非真實系統」 | 避免誤導 |
| ✅ Tech stack 對齊客戶既有 / GoodLinker 既有 stack | 整合 cost 低 |
| ✅ AI handoff spec 含 mock data + out of scope | AI 接手不會走偏 |

## 8. 跟 pitch-deck-builder skill 的關係

- pitch-deck-builder：產**對客戶 / 老闆 / 投資人**的 deck
- 本模組（Phase 7）：產**對工程師 / AI codegen / 客戶 IT**的 MVP package
- 兩者可同 project 並存、視覺風格對齊（同 DESIGN.md palette）
- Mockup HTML 可加進 deck-hub landing 作為「demo 卡」
