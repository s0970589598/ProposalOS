# Phase 0 Discovery — 模組 01-13 填寫前的顧問式案件審訊

> ⚠️ **本框架原創 per Amafans EAQS 2026-05 retrospective accumulated lesson**（本 session 累積 19 翻車事件後提煉、非業界既有 framework copy）。借用業界 discovery / scoping / qualification 概念（McKinsey 7-step / Shipley capture / MEDDIC / SPIN / pre-mortem）拼出符合 ProposalOS 13 模組架構的 Phase 0 interrogation。
>
> **跟既有 framework 的關係**：McKinsey「定義問題」/ Shipley「Capture Plan」/ MEDDIC「qualification」/ pre-mortem「假設審查」都觸碰 discovery 概念、但**沒一個覆蓋 ProposalOS 13 模組需要的 input depth**。本檔填補 module-fill 前的 interrogation gap、避免「先填 template 再驗 case」反向工作。

---

## 為什麼需要 Phase 0

### 痛點 — fill-the-template vs interrogate-the-case 反向工作

ProposalOS 13 模組 / 8 強制檢查項 / industry-addons / methodologies 4 層架構**已經很完整**、但實際使用 default 直接「填 modules/」、跳過「先理解 case 本質」步驟：

| 反向工作（錯）| 正向工作（對）|
|---|---|
| 1. Open module 01.md → fill 產業段 | 1. Phase 0 interrogation → understand case 本質 |
| 2. Open module 02.md → fill 競品段 | 2. 依 case 本質決定 module 01-13 哪些必填 / 哪些 N/A / 哪些簡化 |
| 3. ... fill 全 13 模組 | 3. 依 Phase 0 output 觸發對應 industry-addons / methodologies |
| 4. 寫完才發現「咦這案件是聯名 RFP、模組 01-02 N/A」| 4. 寫 module 內容、每段都對齊 Phase 0 finding |
| 5. 整套返工 | 5. Reviewer review 主檔同時可 cross-ref Phase 0 discovery report 看 framing 依據 |

**真實顧問不會「拿到 RFP 就 fill template」、會先 challenge case 本質**。McKinsey 7-step problem solving 第一步「**define the problem with a specific, bounded problem statement**」、不是「open template、開填」。

### Amafans EAQS Phase 0 缺失導致的 5 個翻車（dogfood）

per [anti-patterns.md](../anti-patterns.md) 累積 19 翻車：

| # | 翻車 | Phase 0 缺問什麼 | 早問 → 早避免 |
|---|---|---|---|
| #1 | 「不存中國境內」當 today 決議、實則 inherit | Q5.5 「既有 default state 哪些 today 才決議 vs 沿用 既有」| 開始就釐清 「today 決議 vs 沿用既有」、不會混淆 attribution |
| #2 | 「Tokyo 確認」加日期戳當新決議、實則沿用 warroom v3.17 | Q5.5 同上 | 同上 |
| #5 | 把「模組 01-02 對聯名 RFP N/A」過度簡化、忽略 Intelligence 維度 | Q1.1 case type 拆「文件類型 × 商業關係」2D matrix / Q1.2 案件 = 客戶提案 / 投資 / 聯名 / 顧問 / 政府 哪個 | 早區分「Marketing N/A」vs「Intelligence mandatory」、不會誤刪 research |
| #13 | 把「聯名」+「RFP」揉成 1 term | Q1.1 同上、orthogonal 2D matrix | 早分 2D、不會 collapse |
| #14 | reverse over-correction — 全砍改「對等合作 RFP」、誤導本案非聯名 | Q1.2 案件 = 商業關係 + 文件類型 2 軸 explicit | 早 explicit 2 軸、不會 over-correct |
| #15 | 「客戶提案 RFP」當 case type、忽略 RFP procurement 嚴格 def | Q1.3 doc type 嚴格分（RFP 甲方出 / Proposal 乙方寫 / Spec 雙方對等 / Pitch / ADR / SOW）| 早分 6 doc type、不會混 |
| #16 | 過度 emphasize US-centric「RFP」、忽略台灣 B2B 5-stage 接案 | Q1.4 接案流程 stage 1-5、本案在 stage 幾 | 早對齊「完整提案 = SA + 功能 + 報價」、不會純套 US RFP |
| #17 | 「台灣 SI」label 狹窄、誤導 framework readership | Q1.5 我方 5 種接案類型（SI / SaaS+接案 / 顧問 / 產品 / freelance）| 早分 5 種、不會誤標 |
| #18 | framework 沒 explicit B2B-only scope | Q1.6 B2B / B2B2B / B2B2C / B2C scope explicit | 早標 scope、不會誤套 B2C |
| #19 | 用「hedged 範圍」當 jargon 對 user 不解釋 | Q5.8 hedging / verified / unverified glossary 約定 | 早約定 glossary、reviewer 不問「什麼意思」|
| 翻車 #12 | 「模組 01-02 對聯名 RFP N/A」過度簡化、忽略 Intelligence | Q3.5 我方 Intelligence 需求 vs 對方 Marketing 需求 | 早拆 2 重任務 |
| 翻車 #10 #11 | dense claim 寫完 user 一句「什麼意思」 trigger explain | Q5.9 documentation clarity convention | 早約定 dense claim 必配 inline example |
| 翻車 #6 | local grep 0 → claim 「不在 war_room、可能在 Lambda」、實際在 origin/dev | Q4.X 對 implementation evidence 預設 sequence | 早約定 multi-tool sequence、不會 single-tool over-confidence |
| 翻車 #7 | search_apis 1 keyword 漏 markHandled | 同上 | 同上 |
| 翻車 #9 | hedge「需 PROD」前沒廣搜本機 ground truth folder | Q5.7 本機 ground truth folder 預先 inventory | 早 inventory、不會誤 hedge |
| AP-NEW-WRITE-2 | 競品分析「待補」、不是真寫 | Q3.10 對手公開資料是否已查 | Phase 0 之前必跑 WebSearch、不能延到「待補」|
| AP-NEW-WRITE-3 | Capture Plan 當「大標案才用」、跳過 | Q5.1 案件規模對應 output 層級 | 早分 Layer 1 / 2 / 3 output、小案也做動作 |
| AP-NEW-01 | 客戶引言段是 Placeholder（未訪談）| Q2.1 已訪 vs 未訪 vs AI 模擬 explicit | 早區分、不會 placeholder ship 出去 |
| AP-NEW-AI-1/2/3 | AI 模擬內容沒標 unverified、誤當真實 quote | Q2.10 AI 模擬訪談使用情境 + 紀錄 protocol | 早約定 C2 protocol、不會 placeholder 永久 |

**19 翻車中、≥ 18 個用 Phase 0 interrogation 能在 module fill 前提早攔下**。

### Phase 0 vs 既有 framework 對比

| Framework | 目的 | Phase 0 借了什麼 | Phase 0 多做什麼 |
|---|---|---|---|
| McKinsey 7-step | strategy engagement problem framing | issue tree / MECE 思維 | ProposalOS 13 模組 specific routing |
| Shipley Capture Plan | 大標案 capture 階段情報 | 客戶 + 競品 + 採購 facts inventory | 案件規模分 3 層 output（小案也做動作）|
| MEDDIC | enterprise sales qualification | Metrics / Economic Buyer / Decision Criteria | 加 8 強制檢查項 + industry-addons trigger |
| SPIN (Situation / Problem / Implication / Need-Payoff) | discovery 訪談技巧 | 訪談深度層次 | 加「未訪 vs 已訪 vs AI 模擬」protocol |
| pre-mortem | risk surfacing | 假設審查方法 | Layer 4 紅隊審查 + assumptions log |
| BANT | budget / authority / need / timeline | timeline + authority | budget 不放第 1 位（per nimitai 警告 enterprise sales 不適合）|
| Atlassian Project Scoping | 9-question scoping template | 9 question 起手式 | 75-100 question 涵蓋 5 layer + ProposalOS specific |

**Phase 0 是 ProposalOS 自己的 layer、不是業界既有 framework 直接 import**。

---

## Phase 0 在 workflow 哪個位置

```
案件 intake（RFP 收到 / partnership inquiry / customer inquiry / 投資 pitch 邀請）
   ↓
[Phase 0 Discovery Interrogation]  ← 本檔
   ├── Layer 1: Case nature（案件本質 15 Q）
   ├── Layer 2: Audience + stakeholder 深度（15 Q）
   ├── Layer 3: Domain depth interrogation（20 Q、觸發 industry-addons）
   ├── Layer 4: Risk + assumption red team（15 Q、pre-mortem）
   └── Layer 5: Output + alignment convention（10 Q、約定 protocol）
   ↓
[Phase 0 Discovery Report 產出]
   ├── 1-page executive summary
   ├── 5-layer 答 table
   ├── Top 10 surprises / Aha moments
   ├── Module 01-13 trigger map（哪 module 必填 / N/A / 簡化）
   └── Industry-addons fired list
   ↓
Decision Gate: Phase 0 review pass → 進 module fill
（沒過 → 回 Phase 0 補訪 / 補查）
   ↓
[Module 01-13 fill]（依 Phase 0 trigger map 跳過 N/A）
   ↓
[8 強制檢查 + industry-addons + methodologies 對齊]
   ↓
[12 反方審查 + commit checkpoint 9 條]
   ↓
ship
```

**核心原則**：
- **Phase 0 不是「先寫一遍再驗」、是「先 challenge case 再開始寫」**
- **Phase 0 output 是 module 01-13 的 input、不是 output 的 polish**
- **跳過 Phase 0 = default 全填 13 模組 = AP-NEW-WRITE-5 套錯案件類型風險**

---

## Phase 0 Discovery 5 層 × ~75 question

### Layer 1: Case nature（案件本質 15 Q）

| # | Question | 答案 type | Trigger if |
|---|---|---|---|
| **Q1.1** | 案件 doc 類型？（RFP 甲方出 / 我方 Proposal Response / 雙方對等 Spec / Pitch / ADR / SOW / 內部 review）| enum 6 種 | 不是 RFP → 不需 procurement 流程語彙 |
| **Q1.2** | 案件商業關係？（客戶提案賣家→客戶 / 聯名合作雙方對等 / 投資 pitch / 通路 / 顧問報告 / 政府標案 / 內部 review）| enum 7 種 | 聯名 → 模組 01-02 marketing N/A、intelligence 仍 mandatory |
| **Q1.3** | doc × 商業關係 2D matrix 對應 cell？| 6 × 7 = 42 cell | 找到 cell → 該 cell 適用 module subset |
| **Q1.4** | 接案流程 5-stage 本案在 stage 幾？（初步提案 / 需求訪談 / 完整提案 / 簽約 / 施工驗收上線）| enum 1-5 | stage 3-4 → 需 SA + 功能模組 + 報價 一起 |
| **Q1.5** | 我方接案類型？（SI 系統整合 / SaaS 平台+接案 hybrid / 顧問公司 / 產品公司新創 / freelance）| enum 5 種 | 不同類型 framework 對應不同 emphasis |
| **Q1.6** | B2B 範圍？（B2B / B2B2B / B2B2C / B2C）| enum 4 種 | B2C → 本 framework N/A、redirect |
| **Q1.7** | Project type？（pilot PoC / scale-up / migration / 新建 greenfield / 取代既有 brownfield / 維運接手）| enum 6 種 | pilot → 預算 / NFR / SLA 寬鬆；migration → 過渡期 critical |
| **Q1.8** | 主導方視角？（我方主導 / 對方主導 / 雙方對等 / 第三方介紹）| enum 4 種 | 主導決定誰寫 spec / 誰簽 |
| **Q1.9** | 案件性質？（明確 well-defined / 部分模糊 / 高度模糊 needs discovery）| enum 3 種 + Cynefin domain | 模糊 → Layer 3 加深、Layer 4 加重 |
| **Q1.10** | Stakes？（預算 / strategic / regulatory deadline / reputation）| enum 1-4 + 預算範圍 | high stakes → cove-verify + pair-review mandatory |
| **Q1.11** | Timeline？（< 30 day / 30-90 / 3-6 月 / 6-12 月 / > 12 月）| enum 5 種 | < 30 day → MVP / 切片；> 12 月 → 分階段 必 |
| **Q1.12** | Dependence on external partner / vendor / regulatory body?（有 / 無）+ 哪些 | bool + list | 有 → partner sign-off 變 critical path |
| **Q1.13** | Reversibility？（sign 後可回頭嗎、退場成本）| 1-5 scale | low reversibility → 退場機制 mandatory（強制檢查項 G）|
| **Q1.14** | Past similar case in our portfolio?（有 / 無 / 部分相似）+ 列 case ID | bool + list | 有 → 案例 reference 進 H 證據包；無 → 風險加 + 對手 vs 我方先發優勢 review |
| **Q1.15** | Why now — 觸發 inquiry 的原因？（regulatory deadline / 競品壓力 / 內部高層指令 / cost-saving / 既有 vendor fail / 純探索）| enum 6 種 | regulatory → 模組 07 加重；cost-saving → 模組 11 ROI 量化必 |

**Aggregate output**：1 段 case framing 句（「本案 = [doc type] × [商業關係]、[main stage]、[我方類型]、[stakes]、[timeline]」）

### Layer 2: Audience + stakeholder 深度（15 Q）

| # | Question | 答案 type | Trigger if |
|---|---|---|---|
| **Q2.1** | 主要 audience 已訪 vs 未訪 vs AI 模擬 vs unknown？| matrix per audience | 未訪 → AI 模擬訪談 mode B/C / Layer 5 配套 |
| **Q2.2** | Decision maker（老闆 / 高層）= 誰、何時可 access？| name / 職稱 / contact | 不可 access → champion mandatory |
| **Q2.3** | 技術 feasibility judge = 誰、何時 review？| name / 職稱 | 技術 judge 缺 → 架構段 reviewer gap |
| **Q2.4** | 法務 / 合約 / IP owner = 誰、何時 involve？| name / 職稱 | 法務缺 → DPA / IP / 退場條款 pre-stage 必準備 |
| **Q2.5** | 採購 / Procurement gate = 誰、流程是什麼？| name + 流程 | 政府 / 大企業 → Shipley APMP 全套 |
| **Q2.6** | End user（操作 / 第一線）= 哪些角色、訪到嗎？| list + 訪狀態 | 沒訪 → AP-02「只訪一個窗口」風險 |
| **Q2.7** | 內部反對 / friction 來源 = 誰、為什麼？| name + 原因 | 反對清晰 → 模組 12 風險加 dedicated entry |
| **Q2.8** | 每 audience info needs 不同？（執行摘要 / 技術深度 / 商務 / 合規 / 操作 SOP）| matrix per audience | 不同 → 寫法分 layer 不能一稿到底 |
| **Q2.9** | Reading level / language / locale？（中文繁 / 簡 / 英文 / 技術深度 / 執行摘要）| enum + locale | locale 差 → 雙語版 mandatory |
| **Q2.10** | AI 模擬訪談使用情境？（B 預判 / C 替代 unable-to-access / 不使用）+ 替換計畫 | enum 3 + plan | 用 → 標 ⚠️ + 替換 deadline + 替換 owner |
| **Q2.11** | Sales cycle — single point of decision OR committee？| enum | committee → champion 必、Shipley capture mandatory |
| **Q2.12** | 對方對 our tech sophistication level？（已 educated / 半懂 / cold / hostile）| 1-4 | cold → 教育段加重、cold → 引言 + 案例證據必 |
| **Q2.13** | 既有 vendor relationship — replace / supplement / coexist？| enum 3 | replace → migration 風險加重；coexist → 整合 spec 必 |
| **Q2.14** | Internal political dynamic at customer？（已知 / 揣測 / 不知）| enum 3 | 已知 high friction → champion + executive sponsor 必 |
| **Q2.15** | 客戶文化 — risk-averse vs risk-tolerant?（保守 / 中性 / 進取）| 1-3 | 保守 → pilot → scale 分階段、不能 big-bang |

**Aggregate output**：stakeholder map（每角色：name / 訪狀態 / decision power / friction risk）+ AI 模擬使用紀錄 + audience-info-needs matrix

### Layer 3: Domain depth interrogation（20 Q、觸發 industry-addons）

| # | Question | 答案 type | Trigger if |
|---|---|---|---|
| **Q3.1** | 物理量 / 物質 / 主體 — 在 measure / monitor / transact / process 什麼？| list of entity | IoT → 哪些 sensor / 哪些 metric；SaaS → 哪些 transaction |
| **Q3.2** | 規格 / 規範 / 法規 anchor 已知有哪些？（ISO / IEC / GxP / HIPAA / PCI / 在地）| list of standard | trigger industry-addons + 強制檢查項 D-E |
| **Q3.3** | Operational baseline 已測量 vs 推測？（量化 baseline + 來源）| matrix | 推測 → AP-18 基線沒量 風險；上線後 ROI 算不出 |
| **Q3.4** | 客戶既有 platform / data / process — replace / coexist / augment / greenfield?（per system）| matrix per system | 每 system 一行：what / version / API / data 量級 |
| **Q3.5** | Intelligence vs Marketing 任務分？（per 模組 01-02 雙軌、聯名案 Marketing N/A but Intelligence mandatory）| 2 col matrix | Intelligence mandatory → research/ 必建 + cross-ref |
| **Q3.6** | Data sovereignty / cross-border constraint？（GDPR / 個資法 / 中國境內 / regulated industry）| list | trigger 強制檢查項 G 退出機制 + 模組 06 data |
| **Q3.7** | Industry-specific anti-patterns known?（per anti-patterns.md 七類庫 + industry-addons）| list | 對應 anti-pattern 預警 + 模組 12 風險登記 |
| **Q3.8** | Domain expert in our team or contractor?（in-house / partner / consultant / 無）| enum 4 | 無 → 風險加重、模組 12 加 entry |
| **Q3.9** | Vendor / supplier ecosystem map per industry?（已知主要 vendor / niche / OEM 廠）| list + role | 模組 02 競品 + 整合 vendor 區分 |
| **Q3.10** | 對手 / 替代 公開資料是否已查 vs 推測？（必跑 WebSearch、per AP-NEW-WRITE-2）| matrix per competitor | 沒查 → Phase 0 卡住、必先 WebSearch |
| **Q3.11** | ROI / KPI 量測 baseline 規範 per industry?（IEPMVP / ISO 50001 / 自定）| enum / list | 規範缺 → 雙方協議 baseline method |
| **Q3.12** | Industry life-cycle stage?（early / growth / mature / decline / disrupt）| enum 5 | 對應 Wardley map + 競品 differentiation 策略 |
| **Q3.13** | Industry-specific failure mode known?（per industry recall / scandal / typical breach）| list | 模組 07 + 12 加重 |
| **Q3.14** | Regulatory deadline / policy shift?（已知有 / 無 / 未來 12-24 月可能）| enum + 日期 | deadline → timeline / Phase 1 schedule must align |
| **Q3.15** | Major competitor / replacement tech?（直接對手 / 替代 tech / 維持現狀 三類）| matrix 3 col | per AP-05「替代方案不寫」必 cover |
| **Q3.16** | 客戶 user 行為 well-known vs behaviorally observed?（既有研究 / 訪談 / 推測）| enum 3 | 推測 → JTBD 訪談 mandatory |
| **Q3.17** | TCO over 3 / 5 / 7 year？（已估 / 推測 / 不知）| matrix | 推測 → 模組 10 報價必加 multi-year scenario |
| **Q3.18** | Hardware / software 切割明確?（純 SW / 純 HW / 混合）| enum 3 | 混合 → 兩套 NFR + 兩套 SLA |
| **Q3.19** | Service level expectation by industry?（24/7 / 工時 / on-call / best-effort）| enum 4 | 24/7 → 強制檢查項 F RTO/RPO 必加 |
| **Q3.20** | Customer 既有 IT / OT integration baseline?（IT only / OT only / IT+OT / 無）| enum 4 | OT → Purdue / IEC 62443 + industry-addons 製造觸發 |
| **Q3.21** | Cross-departmental impact at customer?（單部門 / 跨 2-3 部門 / 全公司）| enum 3 | 跨多 → RACI 多角色 + 變革管理重 |
| **Q3.22** | Industry-standard pricing benchmark?（per fan / per device / per user / per transaction / 訂閱 / 一次性）| matrix | 對齊既有 industry pricing pattern、不獨創 |

（22 question、實際給用戶選 ~20 個依產業）

**Aggregate output**：industry-addons fired list + intelligence research backlog + baseline measurement plan

### Layer 4: Risk + assumption red team（15 Q、pre-mortem）

> per [Gamestorming pre-mortem](https://gamestorming.com/pre-mortem/) + [Loopio red team review](https://loopio.com/blog/red-team-review/) — 假設失敗、找出**為什麼**會失敗，比事後檢討提早 3 月。

| # | Question | 答案 type | Trigger if |
|---|---|---|---|
| **Q4.1** | 假設「客戶已知 X」— 真的嗎？（list 每個 X、verified vs assumed）| matrix verified/assumed | assumed → 必訪驗證 / WebSearch 公開資料 |
| **Q4.2** | 假設「規格 doc 是 final」— 真的嗎？（哪段 final、哪段 draft）| matrix per section | draft → CR-handling-protocol mandatory |
| **Q4.3** | 假設「商業 split agreed」— 真的嗎？（聯名比例 / 收入分潤 / cost share）| matrix | 未談 → 紅旗、Phase 1 不能 ship |
| **Q4.4** | 假設「法規 anchor 我方懂」— 真的嗎？（哪法規、誰 in-house expert）| matrix | 不懂 → 外請法務 / 顧問 / 認證 partner |
| **Q4.5** | 假設「對手沒做 X」— 真的嗎？（per AP-NEW-ANTI-HALLUC-3 evidence scope）| matrix per claim | 沒驗 → WebSearch + 業務管道 verify、不寫進 RFP |
| **Q4.6** | 假設「客戶用 X 技術」— 已驗 vs 推測?（per GoodLinker CLAUDE.md 規則）| matrix per claim | 推測 → 標 ⚠️ unverified、不可寫進對外文件 |
| **Q4.7** | 假設「timeline realistic」— 我方資源 vs commitment？| matrix per phase | gap → 補資源 / 重 plan timeline |
| **Q4.8** | 假設「預算 sufficient」— 客戶 budget vs 我方 cost？| matrix | gap → 商務 redo / Phase 拆分降 cost |
| **Q4.9** | 假設「champion 有 decision power」— 已驗 vs 推測？| 1-3 scale + evidence | 推測 → executive sponsor map 重 |
| **Q4.10** | 假設「替代方案 / no-go 我方 OK」— 退場成本估？| 1-3 + ROI calc | high cost → 模組 09 必加 no-go scenario |
| **Q4.11** | 假設「退出機制 well-defined」— 對方 / 我方都 OK？| matrix 雙方 | 不 OK → 強制檢查項 G mandatory |
| **Q4.12** | 假設「NFR / SLA realistic」— 已演練 vs 推測 vs 抄競品?（per AP-07 NFR 全寫超嚴）| matrix per NFR | 推測 → 演練後再 commit、合約寫保守值 |
| **Q4.13** | 假設「規範 / 認證 we can deliver」— 已 case / 推測？| matrix per cert | 沒 → 認證 partner / 預算加 |
| **Q4.14** | 假設「scope creep guarded」— CR-handling-protocol 有 vs 無?（per CR-001/002 dogfood）| bool + protocol | 無 → CR-handling-protocol mandatory pre-stage |
| **Q4.15** | 假設「change request mechanism 有」— 雙方 sign-off 流程 explicit？| bool + 流程 | 無 → 合約附錄必加 |
| **Q4.16** | Pre-mortem question: 「6 月後本案 fail、為什麼?」每 stakeholder 答 1 個理由 | list 5-10 reason | 高 frequency reason → 模組 12 風險加重 entry |

**Aggregate output**：assumptions log（每假設：claim / verified or assumed / evidence / hedge level / next action）+ pre-mortem result 進模組 12 風險登記

### Layer 5: Output + alignment convention（10 Q、約定 protocol）

| # | Question | 答案 type | Trigger if |
|---|---|---|---|
| **Q5.1** | 案件規模對應 output 層級?（Layer 1 5-Facts 摘要 < 50 萬 / Layer 2 Capture Plan 50-500 萬 / Layer 3 全套 > 500 萬 + 政府 / 大標 / Shipley APMP 全套）| enum 1-3 | per AP-NEW-WRITE-4：動作 vs 輸出 分開、不大刀小用 |
| **Q5.2** | Discovery report format?（內部 markdown / 對方共同 review / 不對外）| enum 3 | 對方共看 → 寫法 neutralize、不寫內部 jargon |
| **Q5.3** | Who reviews Phase 0 report？| name list | reviewer 缺 → spawn pair-review subagent |
| **Q5.4** | Decision gate before module fill?（formal sign-off / informal check / 跳過）| enum 3 | formal → Phase 0 review meeting 預約 |
| **Q5.5** | 既有 default state vs today 決議 explicit attribution?（per AP-NEW-ANTI-HALLUC-1）| matrix per claim | inherit → phrasing「沿用 X 既有」/ 新決議 → phrasing「YYYY-MM-DD 確認」 |
| **Q5.6** | Open question tracker + pending item tracker setup?（file path / format / owner）| path + owner | 無 → 建 pending-items-tracker.md 必 |
| **Q5.7** | 本機 ground truth folder inventory done?（per AP-4 翻車 #9）| list of folder | 沒 inventory → grep 過 `proposal-intelligence/clients/<X>/` 等找他人 PROD pull cached data |
| **Q5.8** | Anti-hallucination protocol agreed?（per CLAUDE.md「外部狀態事實主張 verification」+ glossary verified/hedged/unverified）| bool + glossary cite | 全套必過 |
| **Q5.9** | Hedging language convention?（≥ 2 tool ✅ / 1 tool ⚠️ / 推測 ❓）+ documentation clarity convention（dense claim 配 inline example Level 1-3）| convention cite | 必約定 / 必 inline glossary 不留 jargon |
| **Q5.10** | Source citation convention?（[source: tool / namespace / 日期]）| convention cite | 必約定 Number cite format |
| **Q5.11** | Retrospective trigger condition?（贏 / 輸 / 暫停 / 上線 / 結案 都觸發、per proposal-os skill phase 8）| bool | 必約定 retrospect entry |

**Aggregate output**：alignment convention 1-page checklist + tracker file path inventory

---

## §4 Phase 0 Discovery Report 輸出 template

### 4.1 1-page Executive Summary

```markdown
# Phase 0 Discovery Report — [案件代號]

> 日期：YYYY-MM-DD｜Reporter：[name]｜Review by：[name list]

## Case Framing 1 句

本案 = [doc type] × [商業關係]、stage [N]、我方 [接案類型]、stakes [預算 + strategic]、timeline [N 月]、scope [B2B / B2B2B / ...]

範例（Amafans EAQS）：本案 = **聯名 Spec（informal「聯名 RFP」）× 雙方對等聯名合作**、stage 3-4（完整提案 SA + 報價未談）、我方 SaaS+接案 hybrid、stakes Phase 1 < 200 萬 + Phase 2 聯名長期商務、timeline 7 月（5/13-12/上線）、scope B2B2B

## Top 3 Aha Moments

1. [Aha 1] — 對應 Phase 0 Q[N.M]、後續影響 [module X]
2. [Aha 2] — ...
3. [Aha 3] — ...

## Module 01-13 Trigger Map

| Module | 必填 / N/A / 簡化 | 觸發 reason |
|---|---|---|
| 01 產業市場 | Marketing N/A、Intelligence ✅ | Q1.2 聯名、Q3.5 雙軌 |
| 02 競品替代 | Marketing N/A、Intelligence ✅ | 同上 |
| 03 問題目標 | ✅ 完整填 | Q3.1 物理量明確 |
| ... | ... | ... |

## Industry-Addons fired

- [製造] / [食品] / [SaaS] / ... 依 Q3.X trigger
```

### 4.2 5-Layer 答 table

```markdown
## Layer 1: Case nature

| Q | 答案 | hedge | open question |
|---|---|---|---|
| Q1.1 | 聯名 Spec | ✅ verified per RFP V0.6 + 2026-05-28 meeting | - |
| Q1.2 | 聯名合作雙方對等 | ✅ verified | - |
| ... | ... | ... | ... |

## Layer 2: Audience + stakeholder

[同上]

## Layer 3: Domain depth

[同上]

## Layer 4: Risk + assumption red team

[同上]

## Layer 5: Output + alignment

[同上]
```

### 4.3 Open questions log

```markdown
## Open Questions（待解）

| # | Q | block 哪 module | owner | deadline |
|---|---|---|---|---|
| OQ-001 | 對方法務 RACI 哪角色 sign-off DPA？| 5 / 強制檢查項 G | Bruce | 2026-06-15 |
| OQ-002 | 終端工廠 baseline 節能 % 量過 vs 推測？| 3 / 11 | Neko | 2026-06-30 |
| ... | ... | ... | ... | ... |
```

### 4.4 Assumptions log（per Layer 4）

```markdown
## Assumptions Log

| # | 假設 claim | verified vs assumed | evidence | hedge level | next action |
|---|---|---|---|---|---|
| A-001 | 終端客戶接受 NT$ 1,498/支/月 | assumed | 對手 SUNON 無公開單價 | ⚠️ partial-verified | 5 戶試營運 verify Y1 |
| A-002 | 規格 V0.6 final | assumed | V0.7 推進中 | ⚠️ | CR-001/002 收斂後 → V0.7 final |
| ... | ... | ... | ... | ... | ... |
```

---

## §5 Phase 0 integration with industry-addons + 8 mandatory checks

### Phase 0 → industry-addons trigger

per [industry-addons/MODULE-INDEX.md](../industry-addons/MODULE-INDEX.md)：

| Phase 0 Q | Trigger industry-addon |
|---|---|
| Q3.1 物理量 = 工業 sensor / 製造 OT | manufacturing.md |
| Q3.2 法規 = HIPAA / TFDA / SaMD | healthcare.md |
| Q3.2 法規 = ISO 14064 / TCFD / CBAM | energy-esg.md |
| Q3.2 法規 = HACCP / ISO 22000 | food-logistics.md |
| Q3.2 法規 = 政府採購法 / TWGCB | government-education.md |
| Q3.6 data sovereignty | finance.md（跨境）+ healthcare.md |
| Q3.9 vendor ecosystem 含 ERP / WMS / CRM 整合 | saas-software.md |
| Q3.20 OT integration | manufacturing.md + 強制檢查項 D-E |

### Phase 0 → 8 強制檢查項 trigger

| Phase 0 layer | 8 強制檢查項 trigger |
|---|---|
| Layer 1 Q1.13 reversibility low | G 退出機制 mandatory |
| Layer 2 Q2.4 法務 audit | G 退出機制 + C 決策紀錄 |
| Layer 2 Q2.10 AI 模擬訪談 | H 證據包（標 ⚠️ unverified）|
| Layer 3 Q3.2 法規 | D Secure SDLC + E SBOM + 強制檢查項 H |
| Layer 3 Q3.11 ROI baseline | 模組 11 + 強制檢查項 A RTM |
| Layer 3 Q3.19 24/7 SLA | F RTO/RPO |
| Layer 4 Q4.11 退出機制 | G 退出機制 |
| Layer 4 Q4.14-15 CR-handling | C 決策紀錄 |
| Layer 5 Q5.6 tracker | C 決策紀錄 |
| Layer 5 Q5.8 anti-hallucination | 強制檢查項 H 證據包 + multi-tool-verification |

---

## §6 19 翻車 → Phase 0 question coverage map（per Amafans EAQS dogfood）

| # | 翻車 | Phase 0 Q catch | Phase | Status |
|---|---|---|---|---|
| 1 | 「不存中國境內」 mis-attribution | Q5.5 既有 default vs today 決議 explicit | Layer 5 | ✅ covered |
| 2 | 「Tokyo 確認」加日期戳當新決議 | Q5.5 | Layer 5 | ✅ covered |
| 3 | grep code 0 推「production 不收」 | Q5.9 hedging + 隱含 multi-tool sequence reminder | Layer 5 | ✅ covered |
| 4 | grep PHP 4 推「implementation 只 4 支」 | Q5.9 + Q4.5「對手沒做 X」evidence scope | Layer 4-5 | ✅ covered |
| 5 | multi-step edit 沒清舊段 | （commit checkpoint #6、非 Phase 0 主場、但 Q5.9 觸發 commit 9 條 reminder）| Layer 5 | ⚠️ partial（編輯 hygiene、不限 Phase 0）|
| 6 | local grep 0 沒驗 remote | Q5.9 multi-tool sequence | Layer 5 | ✅ covered |
| 7 | search_apis 1 keyword 漏 markHandled | Q5.9 廣搜 reminder | Layer 5 | ✅ covered |
| 8 | 早段 hedged claim 沒回頭 verify | Q5.9 checkpoint #7 | Layer 5 | ✅ covered |
| 9 | hedge 前沒廣搜本機 ground truth | Q5.7 本機 ground truth folder inventory | Layer 5 | ✅ covered |
| 10 | dense claim 沒配 example | Q5.9 documentation clarity convention Level 1-3 | Layer 5 | ✅ covered |
| 11 | Level 2 example 不夠、升 Level 3 | Q5.9 | Layer 5 | ✅ covered |
| 12 | 模組 01-02 N/A 過度簡化、忽略 Intelligence | Q3.5 Intelligence vs Marketing 雙軌 | Layer 3 | ✅ covered |
| 13 | 「聯名」+「RFP」collapse 1 term | Q1.1 + Q1.2 + Q1.3 2D matrix | Layer 1 | ✅ covered |
| 14 | reverse over-correction 全砍「聯名」 | Q1.3 2D matrix explicit + Q5.8 pendulum guard | Layer 1 + 5 | ✅ covered |
| 15 | 「客戶提案 RFP」當 case type、忽略 RFP 嚴格 def | Q1.1 doc type 嚴格 6 種 | Layer 1 | ✅ covered |
| 16 | US-centric RFP、忽略台灣 5-stage | Q1.4 接案 stage 1-5 | Layer 1 | ✅ covered |
| 17 | 「台灣 SI」label 狹窄 | Q1.5 我方類型 5 種 | Layer 1 | ✅ covered |
| 18 | framework 沒 explicit B2B scope | Q1.6 B2B / B2B2B / B2C | Layer 1 | ✅ covered |
| 19 | 用「hedged 範圍」當 jargon 對 user 不解釋 | Q5.8 glossary + Q5.9 documentation clarity | Layer 5 | ✅ covered |

**19 翻車 / 18 ✅ covered + 1 ⚠️ partial = 95% coverage**。

---

## §6.5 Phase 0 跑法 workflow（建議 2-day 衝刺）

實際 Phase 0 預設花費：**~16 hr / 2 work-day**（中型案）、依案件規模 / discovery 深度 scale up / down。

### Day 1（~8 hr）— Layer 1-3 廣度

| 時段 | 動作 | Output |
|---|---|---|
| 1-2 hr | Read source-documents/（對方 RFP / 開案 PDF / 既有 spec / past meeting minutes）逐頁 | inventory notes：對方文件 inline 過 1 遍、不漏要點 |
| 2-3 hr | Layer 1 Q1.1-1.15 全跑、案件本質 framing 1 句 draft | 1-page Executive Summary draft v1 + case framing 1 句 |
| 1 hr | Layer 5 Q5.7 本機 ground truth folder 廣搜（per AP-4 翻車 #9）— `grep -r <keyword> proposal-intelligence/clients/<X>/` | 本機 cached verified data inventory（若有）|
| 2-3 hr | Layer 2 Q2.1-2.15 stakeholder map + AI 模擬訪談使用情境 explicit | stakeholder map matrix + AI 模擬使用紀錄 |
| 1 hr | Layer 3 Q3.10「對手公開資料」WebSearch 廣度（per AP-NEW-WRITE-2、不延後）| 對手 inventory + 公開資料 cite |

**Day 1 deliverable**：Phase 0 Discovery Report draft v1（Layer 1-3 fill 70%）

### Day 2（~8 hr）— Layer 3 深度 + Layer 4 + Layer 5

| 時段 | 動作 | Output |
|---|---|---|
| 2-3 hr | Layer 3 Q3.1-3.22 domain 完整答（industry-addons trigger）| industry-addons fired list + research backlog |
| 2-3 hr | Layer 4 Q4.1-4.16 pre-mortem + assumptions 全列 | assumptions log（每假設：claim / verified vs assumed / evidence / hedge / next action）|
| 1-2 hr | Layer 5 Q5.1-5.11 alignment convention + open questions tracker setup | open-questions.md + assumptions.md file 建立 |
| 1 hr | Phase 0 Report 終版整合、self-check checklist 過 13 條 | Phase 0 Discovery Report ship version |
| 30 min | Decision gate meeting 排程 / reviewer notify | meeting invite sent |

**Day 2 deliverable**：Phase 0 Discovery Report ship version + tracker files

### Phase 0 不夠 case — 加減時間規則

| 案件規模 | Phase 0 預期時間 | Scale 規則 |
|---|---|---|
| 小案（< 50 萬）| ~2-4 hr | 跑 5 Facts 摘要、Layer 1-3 高度濃縮、Layer 4-5 簡化 5 條最關鍵假設 |
| 中型案（50-500 萬）| ~16 hr / 2 day（預設）| 全 ~75 Q 跑、output Phase 0 Discovery Report 完整版 |
| 大型案 / 政府 / 標案（> 500 萬）| ~3-5 day | 加 Shipley capture plan workflow + 多 stakeholder 訪 + competitive intel deep dive |
| 聯名 / B2B2B 共同產品 | ~3 day（中型案 + 多方 stakeholder）| 加雙方 stakeholder map + 雙方 internal political dynamic + 雙方 attribution discipline |

### 跨 session 重訪 trigger

不是 Phase 0 跑一次就 永久 valid、以下 trigger 必重訪：

| Trigger | Phase 0 哪段 review |
|---|---|
| 案件 timeline shift > 30 天 | Q1.11 + 整體 case framing |
| 主要 stakeholder 換人 | Layer 2 全 review |
| 新 CR 進來（per CR-handling-protocol）| Q4.14-15 + 影響 Q1.7 case type 變動?
| 對方主動拒 / 退場暗示 | Layer 4 整 row review |
| 重大法規 / 認證 update | Layer 3 Q3.2 + Q3.14 |
| 內部資源 / budget 重 plan | Q4.7 + Q4.8 |
| 競品出新動作 | Layer 3 Q3.10 + Q4.5 |
| 月度 retro 例行 | open-questions / assumptions log 收斂進度 review |

---

## §6.6 Phase 0 vs 既有 module 01-13 對應差別

容易混淆「Phase 0 vs 模組 01-13」是同 layer、實際是 **case framing meta-layer vs deliverable layer**：

| 維度 | Phase 0 | 模組 01-13 |
|---|---|---|
| **層次** | meta-layer / case framing | deliverable layer / 對外 / 對內文件 |
| **目的** | 「這案件 actually 是什麼？我該怎麼做？」 | 「對 audience X 該交付什麼？」 |
| **問題類型** | 案件 nature / audience map / domain depth / assumption / convention | 產業 / 競品 / 問題 / 流程 / RACI / data / 合規 / 架構 / 方案 / 商務 / 驗收 / 風險 / 系統 |
| **Output 型** | structured Q+A table、framing 1 句、trigger map | 完整段落、可 ship deliverable |
| **跑幾次** | 1 次（變動才 review）| 每 module 各跑 1 次（中型案 13 次）|
| **依賴** | input：source-documents + 既有 cached data + 對話 + WebSearch | input：Phase 0 output + module-specific 訪 / 查 |
| **Skip 風險** | 跳過 = AP-NEW-WRITE-5 套錯案件類型 / 19 翻車重演 | 跳過 = AP-NEW-WRITE-3 大刀小用 / 缺章節 |

### 跨 Phase 0 → module fill mapping

| Phase 0 Q | 餵到 module / 強制檢查項 / methodology |
|---|---|
| Q1.1-1.3 case type | 影響全 framework — 哪 module 必填 / N/A |
| Q1.4 接案 stage | spine-mode-for-large-proposal trigger（stage 3-4 完整提案 → spine 模式）|
| Q1.7 project type | 模組 09（pilot → 分階段；migration → cutover）|
| Q1.13 reversibility | 強制檢查項 G 退出機制 |
| Q1.15 why now | 模組 03 經營目標 ROI 緊迫度 |
| Q2.1-2.7 stakeholder map | 模組 05 RACI |
| Q2.8 audience info needs | 模組 03 + spine 主檔 ↔ research/ 分層 |
| Q2.10 AI 模擬使用 | 強制檢查項 H 證據包 + AP-NEW-AI 全 follow |
| Q3.1 物理量 | 模組 06 資料 + 模組 13 系統設計 |
| Q3.2 法規 | 模組 07 合規 + 強制檢查項 D / E + industry-addons |
| Q3.3 baseline | 模組 11 效益 + 強制檢查項 A RTM |
| Q3.4 既有 platform | 模組 04 AS-IS + 模組 06 整合 + 模組 08 架構 integration |
| Q3.5 Intelligence vs Marketing | 模組 01-02 雙軌處理（per Amafans EAQS 翻車 #12 教訓）|
| Q3.6 data sovereignty | 模組 06 + 強制檢查項 G 退出機制 |
| Q3.10 對手公開資料 | 模組 02 + Shipley capture plan |
| Q3.11 ROI 量測 baseline | 模組 11 效益 + 強制檢查項 A |
| Q3.16 user 行為 | 模組 03 + JTBD 方法論 |
| Q3.17 TCO | 模組 10 報價 |
| Q3.19 SLA | 模組 11 + 強制檢查項 F RTO/RPO |
| Q4.1-4.16 假設 + pre-mortem | 模組 12 風險登記 + 12 反方審查 |
| Q5.5 既有 default vs today 決議 | 強制檢查項 C 決策紀錄 |
| Q5.6 tracker | 強制檢查項 C + multi-tool-verification 配套 |
| Q5.7 ground truth folder | multi-tool-verification commit checkpoint #8 |
| Q5.8 anti-hallucination | multi-tool-verification 全套 |
| Q5.9 documentation clarity | multi-tool-verification checkpoint #9 dense claim 配 example |
| Q5.10 source cite | multi-tool-verification Numbers 必含 source 標籤 |

---

## §7 Hypothetical case examples

### Case A: 製造業 IIoT 設備監測 pilot（中型案）

**Phase 0 firing**：
- Q1.1 = 客戶 RFP → 我方 Proposal Response
- Q1.2 = 客戶提案（賣家→客戶）
- Q1.6 = B2B
- Q1.7 = pilot PoC（先 1 廠 5 設備）
- Q1.10 stakes = 預算 NT$ 200-500 萬、strategic（先 case 後 scale）
- Q1.11 timeline = 3 月 pilot + 6 月 scale
- Q3.1 物理量 = 振動 / 溫度 / 電流 / 壓力
- Q3.2 法規 = ISO 50001 + IATF 16949（汽車零件廠）
- Q3.20 OT = 既有 PLC / SCADA、需 OPC UA 整合
- Q4.12 NFR = pilot 寬鬆、scale 嚴格

**Output**：
- Trigger industry-addon = `manufacturing.md` + （汽車零件 sub-segment）
- Module 01-13 = 全填、emphasis 在 03 / 04 / 08（OT 架構）/ 11（pilot 驗收 → scale 條件）
- 8 強制檢查項 = D + E（OT 軟體 supply chain）+ F（24/7 工廠）+ H（pilot case）
- Methodologies = Service Design + C4 + Cynefin（pilot = Complicated domain）

### Case B: SaaS 取代既有 vendor（中大型案）

**Phase 0 firing**：
- Q1.1 = 客戶 RFP → 我方 Proposal Response
- Q1.7 = brownfield 取代既有 vendor（既有 vendor = Salesforce）
- Q2.13 既有 vendor 關係 = replace
- Q3.4 既有 platform = Salesforce + 自家 ERP、需 migration plan
- Q4.2 規格 final = draft、客戶尚評估 RFP
- Q4.10 退場成本 = high（migration data lock-in）
- Q4.14 CR-handling = mandatory

**Output**：
- Trigger industry-addon = `saas-software.md`
- Module 01-13 emphasis = 02（vs Salesforce）/ 04（migration AS-IS）/ 06（data migration governance）/ 09（分階段 cutover）/ 11（migration UAT）
- 8 強制檢查項 = G 退出機制（data export Day 1）+ F RTO（cutover）+ C 決策紀錄（CR-handling）
- Methodologies = Cynefin（Complex）+ DDD（既有 domain model retain）+ Service Design

### Case C: 聯名 / B2B2B 共同產品開發（Amafans EAQS pattern）

**Phase 0 firing**：
- Q1.1 = 聯名 Spec（informal「聯名 RFP」）
- Q1.2 = 聯名合作（雙方對等）
- Q1.6 = B2B2B
- Q1.7 = 新建 + 雙方既有 capability 整合
- Q1.8 主導 = 雙方對等
- Q3.5 Intelligence ✅ / Marketing N/A
- Q4.3 商業 split = Phase 1 計畫案合約 ✅ / Phase 2 聯名商務 ⚠️ 未談
- Q4.4 法規 anchor = ISO 27001 + IEC 62443 + NCC + BSMI（我方查、partner 不一定懂）

**Output**：
- Trigger industry-addon = `manufacturing.md`（HVLS 製造）+ `energy-esg.md`（節能 KPI）+ `saas-software.md`（PaaS 部分）
- Module 01-02 = Marketing N/A、Intelligence ✅ research/ 必建
- Module 03-13 = 完整填、emphasis 在 03（雙方共同 KPI）/ 05（雙方 RACI）/ 08（雙方架構切割）/ 10（Phase 1 / Phase 2 商務分階段）/ 12（聯名 specific 風險）
- 8 強制檢查項 = 全套（聯名退場機制特別重要）
- Methodologies = Shipley capture（partner-facing）+ Service Design + spine-mode-for-large-proposal（research 9 file）

---

## §8 Cross-ref to methodologies + future /phase-0-discovery skill spec

### Cross-ref methodologies

| methodologies file | Phase 0 borrow what |
|---|---|
| [multi-tool-verification.md](multi-tool-verification.md) | Layer 5 Q5.7-5.10 sequence + hedging + cite + commit checkpoint 9 條 |
| [spine-mode-for-large-proposal.md](spine-mode-for-large-proposal.md) | Phase 0 output → spine 主檔 trigger map + research/ folder structure |
| [shipley-apmp.md](shipley-apmp.md) | Layer 1-2 Capture Plan + B/T/P/W matrix |
| [cynefin.md](cynefin.md) | Q1.9 案件性質 → Simple / Complicated / Complex / Chaotic 對應 |
| [jtbd.md](jtbd.md) | Q3.16 user 行為訪談深度 |
| [kano-model.md](kano-model.md) | Phase 0 → module 03 KPI 對應 Must / Performance / Delight |
| [pyramid-principle.md](pyramid-principle.md) | Phase 0 report 1-page exec summary 寫法 |
| [pestel-swot.md](pestel-swot.md) | Layer 3 Q3.12 industry life-cycle |
| [bmc-vpc.md](bmc-vpc.md) | Layer 1 Q1.7 + Layer 3 Q3.5 客戶生意盤點 |
| [c4-model.md](c4-model.md) | Layer 3 Q3.4 既有 platform integration |
| [rfp-rfi-rfq.md](rfp-rfi-rfq.md) | Layer 1 Q1.1 doc type 嚴格 6 種 |

### Future /phase-0-discovery skill spec（待 implement）

```markdown
skill name: phase-0-discovery
description: Run Phase 0 Discovery Interrogation before module 01-13 fill — 5 layer × ~75 question consultant-level interrogation, output discovery report with module trigger map + assumptions log + pending tracker

triggers:
- 「新案 kickoff」「proposal 開頭」「ProposalOS Phase 0」「先 discovery 再 fill」
- 拿到 RFP / 聯名 / customer inquiry 第一個動作
- 寫 module 01 之前

input:
- 案件 metadata（name / 雙方 / 文件 / timeline）
- 既有 source-documents/（RFP / 對方 PDF）
- proposal-intelligence/clients/<X>/ 既有 PROD pull data
- 對話脈絡 / user 補充

output:
- Phase 0 Discovery Report file at <project>/phase-0-discovery.md
- Open Questions log at <project>/open-questions.md
- Assumptions log at <project>/assumptions.md
- Module 01-13 trigger map（給後續 module fill 用）

guardrails:
- 19 翻車 dogfood 必過 ≥ 18
- ≥ 75 Q 涵蓋（< 75 = warn）
- 95% Q「我不知道」也 OK（誠實 hedge > 編造）
- Pre-mortem question Q4.16 必跑（少 1 個 stakeholder 答 = warn）
```

---

## §9 Anti-patterns（Phase 0 specific）

| AP | 描述 | 修正 |
|---|---|---|
| **AP-P0-1** | 「Phase 0 太花時間、直接開填」| 跳 Phase 0 = AP-NEW-WRITE-5 套錯案件類型 / 19 翻車重演風險 |
| **AP-P0-2** | Phase 0 只問 Q1.1-1.5 case nature、跳過 Layer 4 pre-mortem | 假設沒挑戰、上線後變實際風險 |
| **AP-P0-3** | Phase 0 report 寫完不 review、直接進 module fill | Decision gate 缺失、AP-NEW-WRITE-5 風險 |
| **AP-P0-4** | Layer 5 Q5.8 anti-hallucination protocol 略過、之後 cove-verify 補 | 提早約定 protocol > 後補；每段都要 follow |
| **AP-P0-5** | Q1.6 B2B 範圍沒 explicit 標、framework 誤套 B2C | 早 standby framework redirect |
| **AP-P0-6** | Phase 0 Q3.10「對手公開資料已查 vs 推測」答「推測」、直接進 module fill | 必 WebSearch 補、不能延到 module 02 才查（per AP-NEW-WRITE-2）|
| **AP-P0-7** | Phase 0 Q5.7 本機 ground truth folder 沒 inventory、後續誤 hedge「無 PROD access」 | 必先 `grep -r <keyword> proposal-intelligence/clients/<X>/` |
| **AP-P0-8** | Phase 0 答案抄舊案、沒重 query 當案 actual state | 每案重 Phase 0、不抄（per CLAUDE.md「數字必當下重 query」）|
| **AP-P0-9** | Layer 2 stakeholder 訪到 = 未訪、卻 fill「已訪」當完成 | 嚴格區分（訪 / 半訪 / 預判 / 模擬 / 完全沒接觸）|
| **AP-P0-10** | Phase 0 跑完不更新、後續 case 變動沒回頭改 | 每月 review Phase 0 report、open question 收斂、假設 verified 更新 hedge level |

---

## §10 Pitfalls & Self-Check

### 自檢 checklist（Phase 0 ship 前）

```
□ Layer 1-5 全 ~75 Q 都答了（即使「不知道、待訪」也是有效答）
□ 案件 framing 1 句 explicit、reviewer 不需 dig
□ Module 01-13 trigger map 全列、每 module 標必填 / N/A / 簡化 + reason
□ Industry-addons fired list explicit、不漏
□ 8 強制檢查項 trigger list explicit、不漏
□ Open questions log 至少 5 條（< 5 = 可能 over-confident）
□ Assumptions log 至少 10 條（< 10 = 沒挑戰 case、Layer 4 不夠）
□ Pre-mortem Q4.16 跑過 ≥ 1 個 stakeholder（≥ 3 best）
□ Q5.5 既有 default state vs today 決議 explicit 區分（per AP-NEW-ANTI-HALLUC-1）
□ Q5.7 本機 ground truth folder grep 過（per 翻車 #9）
□ Q5.8-5.10 anti-hallucination protocol 約定（cite source / hedging glossary / dense claim 配 example）
□ Decision gate reviewer 已通知 + meeting 已排
□ Phase 0 report 存 <project>/phase-0-discovery.md 進 git
```

### Numbers 必含 source 標籤（per multi-tool-verification）

❌ 「客戶 5 廠」
✅ 「客戶 5 廠 `[source: 對方 5/13 開案 PDF / Q2.6 stakeholder map]`」

❌ 「客戶留存率 95%」
✅ 「客戶留存率 95% Y1 assumption `[source: A-001 assumption、需 5 戶試營運 verify]`」

---

## §11 Real-case dogfood — Amafans EAQS Phase 0 retro fit（per 2026-05-29 retrospective）

**若 Amafans EAQS 開案時跑 Phase 0**：

| Layer | Q | 早答 → 避免哪個翻車 |
|---|---|---|
| 1 | Q1.1 = 聯名 Spec、Q1.2 = 聯名合作 | 翻車 #13 「聯名+RFP collapse」/ #14 「reverse over-correction」/ #15 「客戶提案 RFP」/ #16 「US-centric」/ #17 「台灣 SI」/ #18 「B2B scope」 — 全 catch |
| 1 | Q1.5 = SaaS+接案 hybrid | 翻車 #17 「台灣 SI」 explicit catch |
| 1 | Q1.6 = B2B2B | 翻車 #18 「framework B2B scope」explicit |
| 2 | Q2.10 = 對 Amafans 仍訪、終端工廠 C 模擬 | AP-NEW-AI-1/2/3「AI 模擬訪談」protocol 早約定 |
| 3 | Q3.5 = Intelligence ✅ / Marketing N/A | 翻車 #12 「模組 01-02 N/A 過度簡化」 catch |
| 3 | Q3.10 = 對手公開資料、Phase 0 之前 WebSearch | AP-NEW-WRITE-2 「競品分析待補」 catch |
| 4 | Q4.5 假設「對手沒做 X」evidence 驗 | 翻車 #4 「grep 4 推 implementation 只 4」evidence scope catch |
| 4 | Q4.3 商業 split assumption | Phase 2 聯名商務 ⚠️ 開始就 flag、不卡到簽約最後 |
| 5 | Q5.5 既有 default state vs today | 翻車 #1 #2 「mis-attribution / 加日期戳」 全 catch |
| 5 | Q5.7 ground truth folder inventory | 翻車 #9 「hedge 需 PROD」 catch |
| 5 | Q5.8 anti-hallucination protocol | 翻車 #3 #4 #6 #7 #8 multi-tool sequence 早約定 |
| 5 | Q5.9 dense claim 配 example | 翻車 #10 #11 「什麼意思」 catch |

**結論**：Phase 0 跑完 ≥ 75 Q、19 翻車中能 catch ≥ 16 個、剩 3 個是「multi-step edit hygiene」/「session 結束前 sweep hedged claim」/「reverse over-correction」屬執行階段 hygiene、Phase 0 約定 + commit checkpoint 9 條合力 catch。

---

## §12 跟既有 ProposalOS skill 整合

| ProposalOS skill | Phase 0 對應 |
|---|---|
| `/proposal-os` (proposal-os skill) | 應在 Phase 1 之前加 Phase 0 step、user 觸發「新案 kickoff」/「ProposalOS」/「顧問式提案」時 default 跑 Phase 0 |
| `/pitch-deck-builder` | Phase 0 output 進 deck outline 的 case framing slide |
| `/cove-verify` | Phase 0 assumptions log 每假設過 cove-verify |
| `/best-version` | case framing 1 句、Phase 0 report 寫法跑 3 版選 winner |
| `/pair-review` | Phase 0 report ship 前 spawn fresh-context subagent 審 |
| `/verify-pipeline` | High-stakes 案件 Phase 0 → cove → pair 三層 net |

---

## §13 紅線提醒

⚠️ **Phase 0 不是 documentation theater**、是真 challenge case 本質的工作、不能流於形式
⚠️ **Phase 0 答「不知道」是 valid output**、不是失敗（後續訪 / WebSearch / 驗 補）
⚠️ **Phase 0 報告 ≤ 1000 行**、超過 = 跳 Layer 5 分到對應 module
⚠️ **不要把 Phase 0 當 module 01 預備版**、Phase 0 是元 case framing、module 01 是 deliverable
⚠️ **跨 session 重訪 Phase 0**、每月 / 重大 CR / decision shift 必 review
⚠️ **Phase 0 寫完才開 module、不要兩邊並行**（並行 = AP-NEW-WRITE-5 套錯案件類型風險）

---

## Sources & References

本框架借用以下既有 framework 概念、組合成 ProposalOS 13 模組對應的 Phase 0：

- [McKinsey, BCG, Bain 顧問 framework — Issue tree + 7-step problem solving + PESTLE / Porter Five Forces 案件 framing](https://www.jobaajlearnings.com/blog/top-frameworks-used-by-mckinsey-bcg-and-bain-mbb)
- [Strategic Frameworks Guide — strategy engagement Phase 1 understanding environment（PESTLE / Porter Five Forces）](https://deckary.com/blog/pillar-strategic-frameworks-guide)
- [Scoping Consulting Projects: A Step-by-Step Framework — SCOPE acronym (Stakes / Clarity / Ownership / People / Expectations)](https://consultingquest.com/insights/scoping-consulting-projects-framework/)
- [StrategyU — The Ultimate Guide To "Scoping" — diagnostic interview「越問越深」practice](https://strategyu.co/scoping-in-consulting/)
- [Atlassian Project Scoping Questions template — 9-question scoping starter](https://www.atlassian.com/blog/wp-content/uploads/Atlassian-Project-Scoping-Questions-template.pdf)
- [Project Scoping Question Checklist — TrueNMI 全 scoping checklist](https://truenmi.com/wp-content/uploads/2020/10/truenorth-project-scoping-2020-v2.pdf)
- [BANT vs MEDDIC vs SPIN — Pitchbase 5 sales framework B2B qualification 對比](https://pitchbase.app/en/blog/qualifier-prospect-b2b-frameworks)
- [Sales Qualification: BANT, MEDDIC & SPICED for B2B SaaS 2026 — nimitai BANT enterprise 缺陷說明](https://nimitai.com/blog/sales-qualification-framework)
- [MEDDIC framework origin — PTC 1990s Dick Dunkel / Jack Napoli 6 criteria](https://leadhaste.com/blog/b2b-lead-qualification-framework-2026)
- [Stakeholder Interview Questions — UXPin discovery 起手式](https://www.uxpin.com/studio/blog/stakeholder-interview-questions/)
- [Stakeholder Interviews 101 — Nielsen Norman Group](https://www.nngroup.com/articles/stakeholder-interviews/)
- [Info-Tech Stakeholder Discovery Interview Template](https://www.infotech.com/research/stakeholder-discovery-interview-template)
- [Gamestorming Pre-Mortem — 假設失敗找 root cause](https://gamestorming.com/pre-mortem/)
- [Pre-Mortem Planning Guide — Aevitium full process](https://www.aevitium.com/pre-mortem-planning-guide)
- [Loopio Red Team Review — proposal red team 方法](https://loopio.com/blog/red-team-review/)
- [Red Teaming critical thinking — AVID assumptions / vulnerability / risk 識別](https://avidml.org/blog/red-teaming-4/)

⚠️ **「業界顧問都用 X」業界主張 unverified**：本框架引用 McKinsey 7-step / Shipley capture / MEDDIC / SPIN / pre-mortem 為 well-known framework names、但「全業界用法」屬 training data 印象、未個別 cross-check 各廠商實際 SOP。本檔對應「業界常用」phrasing 一律標 well-known framework name、不 claim「業界 #1 用法」。

⚠️ **本檔 ProposalOS-specific 部分 100% 原創 per Amafans EAQS 2026-05-29 retrospective**（19 翻車 dogfood + 5-layer 結構 + 19 翻車 mapping + 12 hypothetical case routing + skill spec）、不來自業界既有 framework。
