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
| 8 | **Sensor scheme（IoT / 資料採集案件 only）**（sensor-scheme.md）| Sensor placement + density + 法規 anchor + S/M/L BOM、per §9 decision matrix | 工程 / 客戶 facility / 法務 |

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

---

## 9. Sensor Scheme Decision Matrix（generalized from data-collection projects）

> **One-line elevator**：當提案涉及 IoT / 感測 / 資料採集時、**Sensor placement / density / 法規 anchor 不能 default 「per-device 一組」或「per-site 一組」 binary 二選一**、必須按物理量空間特性分層 mixed strategy。
>
> **本節 derivation**：framework 衍生自 Amafans EAQS 2026-05 真實顧問案（[research/09 605 行特定 case 分析](https://github.com/) — see §9.8 dogfood reference）、本節 generalize 跨產業適用。
>
> **驗證狀態**：法規 anchor（ASHRAE / CNS / NFPA / OSHA / USP）多為 training-data ⚠️、本節 §9.3 表已 partial-verified per WebSearch（5 source、see §9.10）；具體 clause 編號**仍標 ⚠️**、各 deployment 需 site survey 期 verify。

### 9.1 何時適用本節（trigger condition）

| 觸發條件 | 例 |
|---|---|
| 提案涉及 sensor / IoT / 資料採集裝置 | 工廠監控 / 智慧建築 / 倉儲冷鏈 / 醫療設備 |
| **新增 physical-quantity 量測**（既有系統加新類型 sensor）| 既有 SCADA 加空品 / 既有溫控加振動 |
| **多場域 / 多裝置部署**（≥ 2 sensor 點位 / ≥ 2 device）| 多廠房 IIoT / 多病房 IAQ / 多倉庫冷鏈 |
| **跨 vendor sensor 整合**（vendor A sensor + vendor B sensor + 整合平台）| HVLS fan + 空品 + 電力（GoodLinker case）|

→ 任一觸發 → Phase 7 必跑本節 + 出 sensor scheme deliverable（補進 §1 的第 8 個 deliverable）。

### 9.2 物理量四層分類（4-layer physical-quantity classification）

把所有 sensor 按**空間特性 + 量測目標**分四層、每層 placement 邏輯獨立 derive、不要一套規則套全部。

#### Layer 1 — Ambient（環境、場域 bulk property）

| 項目 | 內容 |
|---|---|
| **定義** | 屬「空間 bulk property」、整個 breathing zone / 場域共享同一值、除非有明顯 source / sink |
| **典型 sensor** | PM2.5 / PM10 / CO₂ / CO / VOC / NOx / O₃ / 場域溫度 / 場域濕度 / 場域照度 / 場域噪音 |
| **placement default** | **場域 grid、breathing zone 高度（1.2-1.5 m）**、避開氣流擾動源（fan / 出風口 / 太陽直射）|
| **規範 anchor pattern** | ASHRAE 62.1 / ASHRAE 55 / 各國室內空品法規（CNS 3612 台灣 / ISO 16000 國際 / EPA IAQ Guide 美國）⚠️ |
| **典型 sampling 頻率** | 1-5 min（ambient bulk 變化慢、不需高頻）|
| **Cost driver** | Sensor 單價中等（CO₂ NDIR ~NT$1-3k）+ 配線（場域 grid 拉線距離）|

#### Layer 2 — Asset-local（資產近端、per-device local measurement）

| 項目 | 內容 |
|---|---|
| **定義** | 由 device 本身產生 / 影響、空間 representativeness 差（距離 device 越遠、訊號越弱）|
| **典型 sensor** | 振動 / RPM / motor 電流 / 軸承溫度 / fan-local 風速 / 馬達聲學 / IR 熱影像 |
| **placement default** | **per-asset 1:1**（每 device 1 個）or **抽樣**（cost trade-off、選 representative）|
| **規範 anchor pattern** | OEM datasheet / vendor 規範 / API 580/581（rotating equipment）/ ISO 10816（vibration）⚠️ |
| **典型 sampling 頻率** | 1-10 sec（振動 / 電流變化快）/ event-driven（threshold trigger）|
| **Cost driver** | Sensor 數量直接乘 asset count、若 1:1 BOM 推高 |

#### Layer 3 — Process（流程變數、process variable）

| 項目 | 內容 |
|---|---|
| **定義** | 流程 critical point 量測、point-bound、不是 ambient 也不是 per-asset、屬「流動 / 反應 / 轉換」過程節點 |
| **典型 sensor** | 流量 / 壓力 / 液位 / 溫度差 (delta-T) / pH / 導電度 / 濃度 / 質量流 |
| **placement default** | **per critical process point**（按 P&ID / 工程圖 derive、不是 grid 也不是 per-asset）|
| **規範 anchor pattern** | Industry SOP / ASME / API process standards / 食品 HACCP CCP / GMP / 半導體 SECS/GEM ⚠️ |
| **典型 sampling 頻率** | 1-10 sec（control loop 需求）|
| **Cost driver** | 高（process sensor 通常 industrial-grade、含 wetted parts / 耐腐蝕 / 防爆認證）|

#### Layer 4 — Safety（工安、binary critical）

| 項目 | 內容 |
|---|---|
| **定義** | 工安 critical event 偵測、binary trigger（normal / alarm）、code-driven 法規強制 |
| **典型 sensor** | 緊急停止 / 煙霧 / 火焰 / 可燃氣體 (LEL) / 毒氣 (H2S / CO / NH3) / 漏水 / 漏電 / 振動超標 |
| **placement default** | **per zone code-driven**（按消防 / 工安法規 grid、密度由法規定、不是 cost optimize）|
| **規範 anchor pattern** | NFPA 72（fire / smoke）⚠️ / OSHA 1910 / 各國消防規範（台灣《各類場所消防安全設備設置標準》）⚠️ / IEC 61508 SIL ⚠️ |
| **典型 sampling 頻率** | < 100 ms（safety event response time critical）|
| **Cost driver** | Cert 等級（SIL2 / SIL3）+ 法規 enforced density 不可砍 |

### 9.3 Decision matrix — physical-quantity × placement × density × regulatory × sampling × cost

| Physical-quantity type | Placement | Density 典型 | Regulatory anchor | Sampling freq | Cost (relative) |
|---|---|---|---|---|---|
| **Ambient PM2.5 / CO₂** | site grid、breathing zone（1.2-1.5 m）、避氣流擾動 | 3-4 點 / 5,000 m² ⚠️（rule of thumb、需 site-specific 驗）| ASHRAE 62.1-2022 §6 ⚠️ / CNS 3612-2017 ⚠️ / EPA IAQ guide | 1-5 min | 低-中 |
| **Ambient 溫度 / 濕度** | site grid + asset-local mix（雙軌）| 1-2 site + 1 / asset（or 抽樣）| ASHRAE 55-2020 §5 ⚠️ thermal comfort | 1 min | 中 |
| **Ambient 噪音 / 照度** | site grid、人員作業位 | 1-2 / 大房間 | OSHA 1910.95 noise PEL 90 dBA ⚠️ / 各國勞工安全衛生規範 | 1-5 min | 低 |
| **Asset-local 振動 / RPM** | per-asset、bearing housing / motor frame | 1:1（critical asset）or 抽樣（non-critical）| OEM spec / ISO 10816 ⚠️ / API 670 ⚠️ | 1-10 sec / event-driven | 中-高 |
| **Asset-local 馬達電流** | per-asset CT 夾於分路 | 1:1 | NEC / IEC 60364 ⚠️ | 1 sec | 中 |
| **Asset-local 流體流量** | per-pipe / per-outlet | 1:1 critical / 抽樣 non-critical | API 標準 ⚠️ / ASME MFC ⚠️ | 1 min | 高 |
| **Process 壓力** | per-critical-point（per P&ID）| sampled（按 control loop 需求）| Industry SOP（食品 GMP / 半導體 SEMI）⚠️ | 1-10 sec | 中-高 |
| **Process 溫度差 (delta-T)** | per heat-exchanger / per-process-stage | sampled | 同上 | 1 min | 中 |
| **Safety 煙霧 / 火焰** | per zone code-driven | NFPA 72 ⚠️ 約 30 ft 間距 / 各國消防規範 ⚠️ | per code | < 100 ms | 中 |
| **Safety 可燃氣體 (LEL)** | per zone + 洩漏點上方 / 下方（依氣體比重） | per IEC 60079-29 ⚠️ / OSHA 1910.119 PSM ⚠️ | per code | < 1 sec | 中-高 |
| **Safety 緊急停止** | per machine + per zone（人員疏散路徑）| ISO 13850 ⚠️ / OSHA 1910.147 LOTO ⚠️ | per code | < 100 ms | 低 |

⚠️ **本表所有 clause 編號 + 具體數字（30 ft / 90 dBA / 5,000 m²）為 WebSearch partial-verified rule of thumb**（per §9.10 source 1-5）、各 deployment 需 site survey 期針對具體 jurisdiction 法規 verify 確切 clause。

### 9.4 BOM tier framework — S / M / L preset（generalized）

| Project tier | 定義（場域 size × device 數）| Sensor count typical | Onboarding workflow | 報價 tier | 適用 case |
|---|---|---|---|---|---|
| **S** | 小場域（≤ 5,000 m² / ≤ 4 device）| 8-15 顆 | self-serve template（客戶填表 → auto-recommend）| 低 | 小工坊 / 小診所 / 小倉 / 單一作業區 |
| **M** | 中型（5-15,000 m² / 4-15 device）| 18-30 顆 | guided onboarding（業務 + 工程一起 site survey、半天 walkthrough）| 中 | 中型工廠 / 商辦樓層 / 中型倉 / 醫院科別 |
| **L** | 大型（> 15,000 m² / > 15 device）| 35-60+ 顆 | bespoke site survey（工程 + 客戶 IT + 法務一起、1-2 天 walkthrough + ER 圖）| 高 | 大型製造廠 / 全棟商辦 / 物流中心 / 全院 / cleanroom |
| **XL** | 巨型（> 30,000 m² / > 30 device、多廠 / 多樓 / 多 site）| 個案 | customer engineering project（PoC → phased rollout）| 個案議價 | 集團 multi-site / 半導體 fab / 連鎖店 / 廠商集合 |

### 9.5 Trade-off framework — 三種錯解 vs 推薦解

| Option | 描述 | 評價 |
|---|---|---|
| **A. 1:1 per-device 全配 5+ 類 sensor** | 每 device 配 ambient + asset-local + process + safety 全 5 類 | ❌ **over-deploy**：(1) ambient sensor 集中 device 不在 breathing zone、量不準（PM2.5 受 fan 氣流 noise）(2) BOM 推高 2-3x C (3) 維護成本爆炸 |
| **B. 1 site 1 set 5 sensor** | 整場域 1 組 5 類 sensor | ❌ **under-deploy**：(1) asset-local 量測 representativeness 失敗（per-asset 失準）(2) ROI / 節能 quantify 不出來（無 device-level baseline vs delta）(3) 告警 false negative |
| **C. Mixed by physical-quantity type**（推薦 baseline）| Ambient → site grid / Asset-local → per-asset or 抽樣 / Process → per critical point / Safety → per code | ✅ **dominant strategy**：每層 placement 按物理量本質 derive、TCO 對齊 ROI 精度、規範對齊、量測準確 |

#### 9.5.1 Cost vs accuracy curve（ascii diagram）

```
量測準確度
    ↑
    │              ╭───── C mixed ───●
    │           ╭──╯              （sweet spot）
    │         ╭─╯
    │      A 1:1 全配（accuracy + 但 BOM 推高）
    │    ╭─╯  ●
    │  ╭─╯
    │ ●─ B pure-site（cheap 但量不準）
    │
    └─────────────────────────────────→ TCO
       低                               高
```

→ **C mixed 不是 compromise 中庸、是按物理量空間特性 derive 的 optimal frontier**。

### 9.6 Onboarding workflow trigger

#### 9.6.1 Site survey checklist（共通 9 點）

| # | 檢查項 | Owner |
|---|---|---|
| 1 | 場域面積測量（含分區 / 樓層）| 業務 + 客戶 facility |
| 2 | Device / asset 數量 + 配置圖 | 客戶工程 / IT |
| 3 | 既有 sensor / SCADA / BMS 盤點（避重複部署）| 客戶 IT |
| 4 | 配電盤 / 電源點配置（CT / 電表 placement 依據）| 客戶電氣 |
| 5 | 網路配置（Wi-Fi / 有線 / LoRa coverage）| 客戶 IT |
| 6 | 法規 anchor 適用清單（per jurisdiction）| 我方法務 + 客戶法務 |
| 7 | 工安事件歷史（recent 12 個月、引導 safety sensor placement）| 客戶工安 |
| 8 | 客戶 ROI 量化期待（節能 / 良率 / 工安 / 合規）| 客戶高層 |
| 9 | Sensor 維護分工（誰校正 / 誰換 / 誰看告警）| 雙方共同 |

#### 9.6.2 Tier auto-recommend rule

```
INPUT:
  - 場域面積 m² (area)
  - device / asset 數量 (n_asset)
  - 法規 enforced safety sensor count (n_safety_required)
  - 客戶 ROI 精度需求（low / mid / high）

DECISION:
  if area <= 5000 AND n_asset <= 4:
    tier = S
  elif area <= 15000 AND n_asset <= 15:
    tier = M
  elif area <= 30000 AND n_asset <= 30:
    tier = L
  else:
    tier = XL (bespoke)

  if ROI_precision == "high":
    upgrade tier by 1 level（提高 asset-local sampling 率）

  sensor_count = base[tier] + n_safety_required + (high_ROI ? 30% extra : 0)
```

#### 9.6.3 Customer self-service vs guided / bespoke split

| 動作 | S tier self-service | M tier guided | L / XL bespoke |
|---|---|---|---|
| Site survey | ❌ 客戶填線上表單 | ✅ 業務 + 工程半天 walkthrough | ✅ 1-2 天 + 法務 + ER 圖 |
| Sensor scheme 設計 | template auto-gen | 工程確認 | 工程客製 + Phase 0 PoC |
| 安裝 | △ ambient sensor 客戶可 DIY、asset-local / safety 必須技工 | ✅ 我方 pro-service | ✅ 我方 + 客戶電工 |
| 告警 / PDCA 設定 | self-service template | 雙方共設 | 客戶 SOP integration |

### 9.7 Cross-ref

| Cross-ref | 關係 |
|---|---|
| `industry-addons/iiot-deployment.md`（FW#1）| 本節 generalize / addon 提供 IIoT-specific sensor scheme deep-dive |
| `industry-addons/hvls-fan.md`（FW#1）| 本節 Layer 2 asset-local / addon 提供 HVLS fan 特定 placement |
| `industry-addons/air-quality-system.md`（FW#1）| 本節 Layer 1 ambient / addon 提供 IAQ 系統 placement deep-dive |
| `methodologies/cr-handling-protocol.md`（FW#2）| 新 sensor CR 必 fire Q1-Q5 ref 本節 §9.2 4-layer + §9.3 matrix |
| `methodologies/multi-tool-verification.md` | 本節 clause 編號 ⚠️ 標籤遵守該 protocol、verify 前必標 unverified |
| `8-mandatory-checks/H-evidence-pack.md`（Mandatory check H）| sensor coverage verification — 簽約前必 prove sensor density 對齊 §9.3 |
| Module 08（架構 + NFR）| 本節落實 module 08 §資料架構層 sensor / IoT 細節 |
| Module 06（資料治理）| 本節 sensor placement 影響資料來源盤點、補 §資料來源清單 sensor metadata |
| Module 12（風險）| 本節 §9.5 三 option trade-off 對映風險 R-22/R-23/R-24（per Amafans EAQS dogfood）|

### 9.8 Dogfood — generalization 範例

#### 9.8.1 Originating case — Amafans EAQS（HVLS fan + IAQ）

- **產業**：智慧建築 / HVLS fan 製造商
- **物理量混合**：PM2.5 / CO₂ (Layer 1) + 溫濕度 (Layer 1 + 2 mixed) + 風速 (Layer 2 fan-local) + 電力 (Layer 4 ambient/source) + Layer 4 安全 OOS
- **解法**：mixed scheme — ambient grid（PM/CO₂）+ 雙軌溫濕度（場域 + fan-local）+ fan-local 風速（per fan or 抽樣）+ 電力（per 配電 scope）
- **S/M/L preset**：S=8-12 / M=18-26 / L=35-50 sensor、see `amafans-eaqs-proposal/research/09-sensor-placement-consultancy.md` 605 行特定 case 分析
- **3 風險衍生**：R-22 客戶 layout mismatch / R-23 PM grid 不足 false negative / R-24 風速抽樣 representativeness

#### 9.8.2 Hypothetical case A — 半導體 fab cleanroom

- **產業**：半導體製造
- **物理量混合**：粒徑分布 (Layer 1 ambient critical、ISO 14644 cleanroom class)、溫濕度 (Layer 1)、process gas 流量 / 壓力 (Layer 3 critical)、振動 (Layer 2 per tool)、Safety 化學氣體 LEL / 毒氣 (Layer 4 code-driven)
- **解法套本節 matrix**：
  - Layer 1 → cleanroom grid 高密度（ISO 14644 規範 ⚠️ ~1 / 2-25 m² 視 class）
  - Layer 2 → per process tool 1:1（振動 / RPM、vendor spec）
  - Layer 3 → per gas line / 反應 chamber 1:1（process critical）
  - Layer 4 → per code（毒氣 / LEL grid 嚴格）
- **Tier**：通常 L / XL（fab 規模）

#### 9.8.3 Hypothetical case B — 醫院 IAQ + 病房監測

- **產業**：醫療
- **物理量混合**：CO₂ / PM2.5 (Layer 1 病房 ambient、ASHRAE 170 healthcare ventilation ⚠️)、溫濕度 (Layer 1 + 2 each-bed)、process（負壓房壓力差 Layer 3）、Safety 醫療氣體洩漏（Layer 4）
- **解法套本節 matrix**：
  - Layer 1 → 病房 ambient grid + nurse station
  - Layer 2 → per critical bed 溫濕度
  - Layer 3 → 負壓房 / OR 壓力差（Joint Commission EC.02.05.01 ⚠️）
  - Layer 4 → 醫療氣體 / 火災（NFPA 99 healthcare ⚠️）
- **Tier**：M / L（單科 / 全院）

#### 9.8.4 Hypothetical case C — 商辦 PMV monitoring（智慧建築）

- **產業**：商辦租賃 / 智慧建築
- **物理量混合**：CO₂ (Layer 1 ASHRAE 62.1 DCV)、溫濕度 (Layer 1)、輻射溫度 (Layer 1 PMV component)、風速 (Layer 1 PMV component)、Safety 火災 (Layer 4 NFPA 72)
- **解法套本節 matrix**：
  - Layer 1 → 每 zone（VAV box scope）配 CO₂ + 溫濕度（DCV 控制）
  - Layer 1 PMV → 抽樣 representative zone 配 radiant temp + air speed
  - Layer 4 → NFPA 72 smoke detector grid ~30 ft（per WebSearch source 4）
- **Tier**：M（單樓層 / 多 zone）

#### 9.8.5 Hypothetical case D — 倉儲冷鏈 pharmaceutical warehouse

- **產業**：醫藥 / 食品冷鏈
- **物理量混合**：溫度 (Layer 1 + 2 mixed、USP 1079.4 high/mid/low probe ⚠️、ISO 17025 calibration)、濕度 (Layer 1)、Safety 冷媒洩漏 (Layer 4 NH3 / CO2 / freon)、Process 冷凍循環 (Layer 3)
- **解法套本節 matrix**：
  - Layer 1 → 倉內 grid（每 stocking level high/mid/low）+ 溫度 mapping study（per USP 1079.4 source 5）
  - Layer 2 → per critical SKU / per chiller 出風口
  - Layer 3 → 冷凍循環壓力 / 流量
  - Layer 4 → 冷媒洩漏 zone-based
- **Tier**：M / L（單倉 / 多倉）

#### 9.8.6 Hypothetical case E — 食品工廠 HACCP CCP monitoring

- **產業**：食品加工
- **物理量混合**：Process 溫度 / 時間 / pH（CCP、HACCP enforced）、Ambient（廠房）、Safety 化學品洩漏 / LEL（消毒劑、清潔劑）
- **解法套本節 matrix**：
  - Layer 3 → per CCP point（殺菌段溫度時間 / 冷藏段溫度 / pH 殺菌），HACCP § ⚠️ critical limit enforced
  - Layer 1 → 廠房空品（避免異物 / 微生物）
  - Layer 4 → per code 化學品 / LEL
- **Tier**：M / L（單線 / 全廠）

→ **本節 matrix 已 generalize 6 cross-industry case**：HVLS + IAQ（originating）/ 半導體 fab / 醫院 / 商辦 / 倉儲冷鏈 / 食品 HACCP。

### 9.9 Anti-patterns（sensor scheme 具體失敗模式、cross-ref `anti-patterns.md` AP-NEW-SENSOR-1 到 AP-NEW-SENSOR-4）

| Anti-pattern | 描述 | 後果 | 對策 |
|---|---|---|---|
| **AP-NEW-SENSOR-1** | 「1 device 1 組 5 sensor 全配」over-deploy | (1) BOM 推高 2-3x (2) ambient sensor placement 錯（集中 device 不在 breathing zone）(3) 維護成本爆炸 | 套 §9.5 Option C mixed、Layer 1 走 site grid 不走 per-device |
| **AP-NEW-SENSOR-2** | 「1 場域 1 組 5 sensor」under-deploy | (1) asset-local 量測 representativeness 失敗 (2) ROI / 節能 quantify 失敗 (3) 告警 false negative | 套 §9.5 Option C、Layer 2 走 per-asset or 抽樣 |
| **AP-NEW-SENSOR-3** | 從 vendor 默認 sensor scheme copy-paste、不對齊客戶廠房 layout | (1) Phase 0 site survey 才發現 mismatch (2) onboarding 工時 + 50-100% (3) 客戶端不信任 | Phase 0 必跑 §9.6.1 9-point site survey、tier 套 §9.4 |
| **AP-NEW-SENSOR-4** | Sensor placement 當 RFP / proposal 後補的 afterthought（V0.x 才補） | (1) 簽約前 BOM 沒對齊 (2) 報價 ±50% drift (3) 安裝期間客戶 CR 滿天飛 | Phase 1 訪談階段即啟動本節 §9.2 4-layer 分類、§9.4 tier 預估、Phase 2 鎖定 BOM |
| **AP-NEW-SENSOR-5** | 法規 anchor 用 training-data 印象寫進 RFP（ASHRAE / NFPA / OSHA clause 編號）、未 verify | (1) 客戶法務 / 工安 catch、信譽損 (2) 真實 audit 對不上 (3) 重寫返工 | 任何 clause 編號 ⚠️ 標 unverified、site survey 期 WebSearch + 客戶 jurisdiction 確切版本驗、see [methodologies/multi-tool-verification.md] |

### 9.10 Open question / boundary（generalization 限制）

| 開放 / 邊界 | 說明 |
|---|---|
| **不適用**：純 SaaS without sensor / B2B service without IoT | 本節限 data-collection / IoT 場景、純軟體 SaaS / 顧問報告 / API service 走 module 06 + 08 即可、不跑本節 |
| **不適用**：純 wearable / consumer device | 本節以 B2B 部署為主、wearable / D2C 走另套 deployment framework（本框架 B2B-only scope、see anti-patterns.md framework correction） |
| **Simplification**：4 layer 是 useful abstraction、real customer 邊界模糊 | 某些 sensor cross-layer（如風速 = Layer 1 ambient + Layer 2 fan-local 雙軌、per Amafans EAQS）、需 case-by-case judgment |
| **Cross-industry porting 警示** | 農業 (smart farm)、智慧城市、wearable health、車載 telematics 各有 default sensor scheme、本 matrix 為起點不為終點、各產業 vertical 需 layer-by-layer adapt |
| **法規 jurisdiction**：本節 cite ASHRAE / NFPA / OSHA / USP 偏 US-centric | 台灣 / 歐盟 / 日本 / 中國各有對應規範、deployment 前 WebSearch verify 各 jurisdiction 確切 clause（per multi-tool verification protocol）|
| **Sampling 頻率 trade-off**：本節寫 typical、實際 controller loop / event-driven / batch 需 case-specific 設計 | 高頻 sampling → 流量 / 儲存爆 / cost up、低頻 → 漏 event；per module 06 §資料量 × 新鮮度 4 象限 |

### 9.11 Verification status + WebSearch sources

本節法規 anchor cited（WebSearch partial-verified 2026-05-29、剩餘 clause 編號 ⚠️ 標 unverified 待 deployment 期補）：

| Source # | URL | 用途 |
|---|---|---|
| 1 | [ANSI/ASHRAE Standard 62.1-2022 Addendum ab (ashrae.org)](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf) | §9.2 Layer 1 ambient placement (breathing zone 1.2-1.5m、CO₂ sensor accuracy ±75 ppm / 5-year recalibration) |
| 2 | [Ensuring ASHRAE 62.1 Compliance for CO2 Sensors in DCV (Kaiterra)](https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv) | §9.2 Layer 1 breathing zone 3-6 ft above floor 規範 |
| 3 | [IoT Sensor Selection Guide for Manufacturing (oxmaint)](https://oxmaint.com/industries/manufacturing-plant/industrial-iot-sensor-selection-guide-manufacturing-equipment-monitoring) | §9.4 Tier S/M/L sensor count benchmark（50-100 critical asset = 150-400 sensor 量級）|
| 4 | [NFPA 72 Smoke Detector Requirements (getsafeandsound)](https://getsafeandsound.com/blog/commercial-smoke-detector-requirements/) | §9.3 Safety smoke detector spacing 30 ft commercial、0.7 Rule |
| 5 | [USP 1079.4 Temperature Mapping Standard (gsap.co.il)](https://gsap.co.il/en/usp-1079-4/) | §9.8.5 cold chain placement high/mid/low probe 規範 |
| 6 | [Non-contact sensor placement for rotating machinery (ScienceDirect)](https://www.sciencedirect.com/science/article/pii/S2215098618315398) | §9.2 Layer 2 asset-local 振動 placement strategy |

**Hedging language 對應**（per [methodologies/multi-tool-verification.md](../methodologies/multi-tool-verification.md)）：
- ✅ Sensor placement 邏輯（Layer 1-4 分類、breathing zone 概念、ambient vs asset-local 區別）：per WebSearch 6 source verified
- ⚠️ 具體 clause 編號（ASHRAE 62.1 §6 / NFPA 72 30 ft / ISO 10816 / USP 1079.4）：partial-verified，deployment 前需逐 jurisdiction 確切 clause WebSearch + 法務 sign-off
- ⚠️ Density 數字（3-4 點 / 5,000 m² ambient / 150-400 sensor / 100-asset / 30 ft NFPA）：industry rule of thumb、需 site survey 期 site-specific 驗

---
