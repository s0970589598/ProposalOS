# CR-Trigger Lint Protocol — 新 sensor / 新 measurement / 新 data stream 自動觸發 5 大 implication 問

> per Amafans EAQS 2026-05-29 retrospective：CR-001「加風速 sensor」一開始被 surface-level handled（只在 sensor 清單加一個名字）、真正的 placement / count / regulatory / BOM / data&UI implication 直到 5/29 顧問 deep-dive `research/09-sensor-placement-consultancy.md` 才浮上來。本 protocol 把這 5 維度 bake 成方法論、任何未來 CR 一進來都自動 trigger 同 5 問、不再靠 ad-hoc dependency。
>
> **本框架原創**（per Amafans EAQS 2026-05 retrospective）— 借用 ITIL 7Rs / CMMI Configuration Management 的 impact analysis 概念、但 5 問是針對「**物理量 sensor / device / data stream**」新增情境特化（ITIL 7Rs 是泛用 IT change、CMMI CM 是 generic work product；兩者都沒專門對「新增物理量 sensor」這類有強 spatial / regulatory / BOM 耦合的 CR 出 protocol）。

---

## §1. 為什麼需要這個 methodology

### 1.1 真實 dogfood — Amafans EAQS CR-001 翻車紀錄

**時序**：
- **2026-05-28**：Amafans 口頭提「加風速 sensor」、GoodLinker 在 `CR-001-add-wind-speed.md` 處理 → 主要動作 = **把「風速」放進 sensor 清單**、釐清是哪一種風速（fan output / ambient / RPM derived）、列影響的 RFP § 編號。
- **2026-05-28 後續**：CR-002（加電力箱）開出來、開始發現 sensor scheme 不是「加一個名字」這麼簡單。
- **2026-05-29**：才 surface 真正的 placement 邏輯 — 風速 fan-near placement、PM2.5/CO₂ ambient grid、HVLS ROI 量測 representativeness、S/M/L preset tier、ASHRAE 法規 anchor、3 年 TCO trade-off、UI L1-L3 hierarchy implication。
- **產出**：`research/09-sensor-placement-consultancy.md`（605 行顧問版分析）+ `risk-register.md` 補 R-22/R-23/R-24 + `rfp-v07` 補 §6.0.1 / §A.1 / §A.3 / §6.0.5 4 段 drop-in。

**Gap**：5/28 → 5/29 之間有 24 小時的 implication blindspot — CR 被 logged、但**真正的 implication 沒被自動 surface**。Sara × Neko 對接如果照 5/28 版進行、會發現對話時 customer-facing 5 個 question 沒準備好（哪一種風速？BOM 怎麼算？哪些 tier 強制 1:1？法規 anchor？UI 怎麼顯示？）。

### 1.2 Root cause

| Sub-cause | 表現 | Fix |
|---|---|---|
| **Surface-level CR triage** | CR 進來 → 只 update sensor 清單名字 / 列出影響的 § 編號 / 標記「待 Sara × Neko 對接」 → close | CR-trigger lint：每個新 sensor / device / data stream CR **強制過 5 大 implication 問**、未答完不算 logged |
| **Implication blindspot** | 沒 anchor 哪些維度必問 — placement / count / regulatory / BOM / data&UI 任一漏問就會出現 ad-hoc 補件 | 5 問 hardcode、不靠記憶 |
| **Trigger 時機 reactive** | 等到顧問 deep-dive / 客戶會議卡到才 surface | Trigger 時機 = CR 一 logged、不等下個會議 |

### 1.3 為什麼這個比 ITIL 7Rs / CMMI CM 更具體

ITIL 7Rs（Raised / Reason / Return / Risk / Resources / Responsible / Relationship）是**泛用 IT change** 問法、CMMI Configuration Management 的 change request impact analysis 是**通用 work product**。兩者對「**新增物理量 sensor / device / data stream**」這類有強 **spatial（哪裡放）+ regulatory（哪些標準 anchor）+ BOM（多少錢 × 多少顆）+ data&UI（pipeline + hierarchy）** 耦合的 CR、缺更專門的 5 問。

→ 本 protocol 補位、specifically for **IoT system proposal / sensor scheme 規格 / 新 device 整合**情境。

---

## §2. Scope — 哪些 CR 觸發 / 哪些不觸發

### 2.1 觸發條件（Fire on）

| CR 類型 | 範例 |
|---|---|
| **新 sensor / 新物理量** | 「加風速 sensor」/「加震動 sensor」/「加 PM2.5 加 PM10」 |
| **新 measurement** | 「加溫度 delta」（既有 sensor 但新 derived metric）/「加風扇 vs ambient 對比」/「加月度節能率」 |
| **新 device type** | 「加電力箱」/「加 PLC」/「加閘道」 |
| **新 data stream** | 「加 MQTT topic」/「加 OPC-UA channel」/「加 protocol」 |
| **新 device count / scope expand** | 「Sensor 從 5 顆變 10 顆」/「從廠房 A 擴到 A+B+C」/「每 fan 1:1 變抽樣」 |
| **新 user role / 新 permission scope** | 「加廠商遠端 view」/「加客戶分區 admin」（觸發 Q5 data&UI subset：alert routing + UI hierarchy）|

### 2.2 不觸發（Do NOT fire on）

| 不 fire 類型 | 範例 |
|---|---|
| 純 UI 文字改 | 「按鈕中翻英」/「label 改字」 |
| 純 bug fix | 「告警觸發後沒推播」/「圖表 x 軸顛倒」 |
| 純 cosmetic | 「儀表板配色」/「字體大小」 |
| 純 backend perf | 「DB query 加 index」/「API timeout 從 5s 改 10s」（不涉新 device / sensor） |
| 純 doc 修訂 | 「合約 § 編號重排」/「§ phrasing 改寫」 |

⚠️ **邊界 case**：「新 alert 規則」如果只是改既有 sensor 的閾值 → 不 fire；但「新 alert 規則」如果牽涉新 sensor / 新 user role → fire（走 Q5 data&UI 局部）。判斷法：**是否涉及新 hardware / 新 data source / 新 BOM / 新 user-facing scope**、任一是 → fire。

---

## §3. The 5 Trigger Questions

每個 CR 一 logged 即 trigger 以下 5 問、未答完（含 ⚠️ hedge 標記）不算 close。

### Q1: WHERE — placement / location logic?

**核心問題**：這個 sensor / device / measurement 該**放在哪裡**？依什麼邏輯？

**Sub-question**：

| # | Sub-question | 為什麼問 |
|---|---|---|
| 1.1 | **per-device / per-site / per-zone / per-grid？** | 同一物理量在不同 spatial scheme 下、量到的可能是完全不同的東西（如風速 fan-near vs ambient = 完全不同的意義）|
| 1.2 | **Physical placement（高度 / 距離 / 角度 / orientation）？** | Sensor 安裝高度直接影響量到的值（如 PM2.5 breathing zone 1.2-1.5 m vs 屋頂 = 不同值）|
| 1.3 | **Regulatory anchor for placement？** | 法規可能 explicit 規定 placement（ASHRAE 62.1 §6 / ASHRAE 55 §5.3 / OSHA 1910.1000 / CNS 3612 / IEC 標準）|
| 1.4 | **Cabling / connectivity from placement？** | Placement 決定了 RS485 配線 / 電源 / Gateway port 配置、進而影響 BOM 跟 onboarding 工時 |
| 1.5 | **Existing sensor 殘留 / conflict？** | 客戶端可能已有同類 sensor、placement scheme 要 merge / 退役舊有 |

**為什麼這個 question 重要**（per Amafans CR-001 dogfood）：

CR-001「加風速 sensor」一開始只記了「加進 sensor 清單」、**沒問 placement**。直到 `research/09 §2.3` 才釐清：

> 風速是「fan throughput physical quantity」、由 fan 本身產生、衰減快、空間 representativeness 差 → **必 fan-near 量測、不可場域 ambient**。場域 ambient 風速通常 < 0.2 m/s、不反映 fan 性能、量到的數字對 HVLS ROI 評估幾乎無用。

→ 如果 5/28 當下直接問 Q1.1「per-device 還是 per-site？」、Sara × Neko 對接時就能直接 surface「fan-near placement」結論、不需等顧問 deep-dive。

**怎麼回答 Q1**：

| 來源 | 動作 |
|---|---|
| **客戶 site survey** | 問客戶現場可以放哪、有沒既有點位、有沒法規 / 客戶 IT 限制 |
| **規格 datasheet** | sensor IC 規格通常 specify 操作環境（溫度範圍 / 氣流 / vibration tolerance）|
| **Regulatory lookup** | WebSearch ASHRAE / OSHA / CNS / 國家標準 clause 編號（**⚠️ Training data hedge 規則**：clause 編號未 WebSearch verify 一律標 ⚠️、不用 confident phrasing）|
| **既有部署 case study** | 自家 / 同業既有客戶部署、看怎麼放 |

**⚠️ Anti-hallucination hedge**：如果 placement 是業界 / 法規宣稱 + 未 WebSearch、必須**標 ⚠️ training-data 印象**、不可寫 confident（per `multi-tool-verification.md` 規則 4「業界 / 公司主張」必含 WebSearch + 廠商官網交叉）。

---

### Q2: COUNT — how many + scaling logic?

**核心問題**：要**多少顆**？scaling 邏輯是什麼（per device 1:1、per zone、per site、抽樣）？

**Sub-question**：

| # | Sub-question | 為什麼問 |
|---|---|---|
| 2.1 | **1:1 with parent device 或 sampled？** | 「每 fan 1 顆」vs「抽樣 30% fan」差 3-10× BOM、HVLS ROI 量測 representativeness 也不同 |
| 2.2 | **Sampling fraction（1/2 / 1/3 / 1/N）trade-off？** | 抽樣率必須跟「ROI 量測精度」+「客戶 BOM 可接受度」雙軸 derive、不能隨意 |
| 2.3 | **Per customer site size（S / M / L preset）？** | 客戶廠房大小（< 5k m² / 5-15k m² / 15-30k m²）對應不同 sensor count、需 preset tier |
| 2.4 | **Replacement / spare ratio？** | 3 年壽命 sensor（如 PM2.5 laser）需 N% 替換量、影響 3 年 TCO |
| 2.5 | **Cross-tier customer transfer 規則？** | 客戶從 S 擴 M、count 從 X 變 Y、補裝價差 / 訂閱對應規則 |

**為什麼這個 question 重要**（per Amafans CR-001 dogfood）：

CR-001 一開始沒明示「風速每 fan 1 顆還是抽樣」、5/28 那刻可能 default「per fan 1:1」、但 `research/09 §6` S/M/L preset 揭示：

| Tier | Fan 範圍 | 風速 sensor 推薦 |
|---|---|---|
| S | ≤ 4 fan | **1:1**（量小、BOM 可控）|
| M | 4-10 fan | **抽樣 50%** |
| L | 10-20 fan | **抽樣 30-40%** |

→ 如果 5/28 當下直接問 Q2.1+Q2.2、Sara × Neko 對接時就能直接帶「按 tier 的抽樣 SOP」、不會給客戶 default 1:1 報價（M / L tier 客戶會嫌貴）。

**怎麼回答 Q2**：

- 對 sales team 跟 PM 釐清「每 unit cost × N unit」對客戶定價的影響（用 [research](#) cost band 做敏感度分析）
- 對 customer success / onboarding 釐清「不同 tier 客戶 default 推哪個 scheme」
- 若有現存 case study（如本案 Amafans 大同大學 EMS 5 電表 / 30 sensor 案例）= count + scale verified、可直接 anchor

---

### Q3: REGULATORY — compliance anchor + 工安?

**核心問題**：有沒**法規門檻 / 認證 / 工安**要對齊？任一觸線必處理。

**Sub-question**：

| # | Sub-question | 為什麼問 |
|---|---|---|
| 3.1 | **國家標準 / 行業規範 anchor？** | 國家規範可能 explicit 規定（如 CNS 3612 室內空品 / ASHRAE 62.1 IAQ / IEC 61000 EMC / ISO 50001 EMS）|
| 3.2 | **工安門檻（PEL / TLV / 告警閾值）？** | 法規可能 mandate 警報閾值（如 OSHA CO₂ PEL 5,000 ppm 8-hr TWA / ACGIH TLV）— sensor scheme 不符 = 工安客訴 / 法務糾紛 |
| 3.3 | **個資 / DPA implication？** | 新 sensor / device / data stream 可能涉 PII（如人流計數 / 攝影機 / wearable）、觸發 DPA / GDPR / 個資法 |
| 3.4 | **認證需求（ISO / CAS / 台灣優良 / 綠色金融）？** | 客戶可能需要對外送認證（綠色金融 SLL Assurance / ISO 50001 / HACCP）、sensor data 是必要依據、規格不符 = 認證掉鏈 |
| 3.5 | **跨境資料 / sovereignty？** | 雲端 region 與資料存放區域、客戶可能合約要求境內、跨境送雲端 = 法規違規 |

**為什麼這個 question 重要**（per Amafans CO₂ dogfood）：

EAQS 加 CO₂ sensor、5/28 紀錄 default 是「PM2.5 / CO₂ 用 hybrid sensor、共點位」、但 `research/09 §2.1` 點出：

> ⚠️ **OSHA 1910.1000 Table Z-1**（CO₂ PEL 5,000 ppm 8-hr TWA）+ **ACGIH TLV 2024 CO₂ 5,000 ppm TWA** + **ASHRAE 62.1-2022 §6** Ventilation Rate Procedure — 場域 grid placement、breathing zone 高度 1.2-1.5 m

→ 如果 5/28 直接問 Q3.1+Q3.2、立即知道 CO₂ 必須對齊 OSHA PEL + ASHRAE 62.1、grid density 不能任意砍。`risk-register.md R-23`「PM grid density 不足、工安門檻警報 false negative」是 Q3 沒問 surface 的 case。

**怎麼回答 Q3**：

| 來源 | 動作 |
|---|---|
| **WebSearch 法規 clause** | ASHRAE / OSHA / CNS / IEC / ISO 等對應 clause 編號（必驗、不能憑訓練資料印象） |
| **客戶法務 / 合規團隊** | 確認客戶端有沒既有合規要求 / 認證承諾 |
| **產業 vertical 標準** | 如食品 HACCP / 醫療 GMP / 半導體 SEMI / 政府採購法 |
| **訂閱合約 / 認證承諾** | 如客戶宣稱「對外送綠色金融」、需 Assurance 認證 |

**⚠️ Anti-hallucination hedge**（per `multi-tool-verification.md` 規則 4）：

| 證據完整度 | phrasing |
|---|---|
| ≥ 2 source WebSearch verified（clause + 數字 cross-check）| ✅「per [ASHRAE clause + 廠商 case study] verified」 |
| 1 WebSearch verified、其他 layer 未查 | ⚠️「[source A] 顯示 X、[layer B] 未驗、需 [tool] 補」 |
| 訓練資料印象、未 WebSearch | ❓「⚠️ training-data 印象、需 WebSearch verify」 |

→ Amafans `research/09 §10.2` 表格列 5 個 regulatory anchor、4 個標 ⚠️ training-印象、1 個 verified（台電 + 經濟部能源局）— 即是這個 hedging discipline 的 dogfood 範例。

---

### Q4: BOM — cost driver + tier preset?

**核心問題**：這個 CR 對 **BOM** 增加多少？per-tier preset 怎麼套？3 年 TCO 多少？

**Sub-question**：

| # | Sub-question | 為什麼問 |
|---|---|---|
| 4.1 | **Per-unit hardware cost？** | Sensor IC 報價 / 變送器 / mounting 配件、含進口稅 + 通路 markup |
| 4.2 | **Cable / mounting / labor multiplier？** | RS485 配線 NT$ X/m + 工時 NT$ Y/day、placement 越複雜 multiplier 越高 |
| 4.3 | **Tier preset（S / M / L / XL）？** | 每 tier sensor count + BOM range（cost band）必須 hedged + WebSearch 報價 verify |
| 4.4 | **3 年 TCO 含 replacement？** | 短壽命 sensor（PM2.5 laser ~3 年 / IC 級溫濕度 ~5 年）必算替換、TCO 不只 day-1 BOM |
| 4.5 | **Cross-tier transfer 價差規則？** | 客戶從 S 擴 M / M 擴 L、價差怎麼算（補裝 vs 整套 vs 訂閱對應）|

**為什麼這個 question 重要**（per Amafans dogfood）：

`research/09 §5.1` M 廠 8 fan 範例 3 年 TCO 對比：

| 項目 | A pure-1:1 | B pure-site | C mixed（推薦）|
|---|---|---|---|
| Sensor 硬體 | NT$ 200-400k | NT$ 20-50k | NT$ 80-180k |
| RS485 + Gateway | NT$ 50-100k | NT$ 10-20k | NT$ 30-60k |
| 安裝工時 | NT$ 80k | NT$ 16k | NT$ 40k |
| 3 年維護 | NT$ 60-120k | NT$ 10-20k | NT$ 30-60k |
| 3 年替換 | NT$ 30-60k | NT$ 5-10k | NT$ 15-30k |
| **3 年 TCO** | **NT$ 420-760k** | **NT$ 60-120k** | **NT$ 200-370k** |

→ 沒問 Q4、就會有「pure-1:1 BOM 推訂閱 cost、客戶不續訂」風險（per `research/09 §5.3` 商業 implication）。Q4 必須 derive S/M/L preset、不能 default「per fan 1:1」/「per site 1 顆」/「per device 1 顆」。

**怎麼回答 Q4**：

| 來源 | 動作 |
|---|---|
| **Sensor brand / 通路** | WebSearch + 廠商報價單（hedged ±30% variance 標清楚）|
| **既有部署 case study** | 自家 / 同業既有部署 BOM range |
| **Tier preset master table** | 跨 size / tier 客戶套用、Phase 0 site survey 後微調 |
| **3 年壽命表** | sensor IC 規格 lifetime / 替換週期 / 維護週期 |

**⚠️ Anti-hallucination hedge**：

- 報價 **必標 hedged ±N% variance**、不能寫「NT$ 80k」當定值（per Amafans `research/09 §5` 全標「NT$ 80-200k」+ `⚠️ 估算範圍 hedged、實際 sales process 要 site survey 後報價、不是 catalog price」）
- 跨 tier 補裝 / 訂閱對應規則、若未 Bruce 商務評估、標 ⚠️「待 Bruce 商務評估」

---

### Q5: DATA + UI — pipeline + display implication?

**核心問題**：這個 CR 對 **data pipeline** + **UI** + **alert routing** 影響什麼？

**Sub-question**：

| # | Sub-question | 為什麼問 |
|---|---|---|
| 5.1 | **Data ingestion topic / channel？** | 新 sensor 進 MQTT 哪個 topic / RS485 哪個 slave addr / API 哪個 endpoint |
| 5.2 | **Time-series storage tier？** | 新 measurement 落在哪 DB（DDB / RDS / shadow）/ retention / aggregation 規則 |
| 5.3 | **Aggregation rule（per device / per site / per zone）？** | 月報 / KPI 怎麼算（總和 / 平均 / max / per-fan 細）|
| 5.4 | **UI hierarchy（L1 場域 overview / L2 device detail / L3 trend + PDCA）？** | 新 sensor 在哪 hierarchy 層顯示、L1 hero stat 還是 L3 trend chart |
| 5.5 | **Alert routing path？** | 新 sensor 異常告警通知誰（場域管理員 / Amafans 維修 / Bruce 商務）|

**為什麼這個 question 重要**（per Amafans dogfood）：

`research/09 §7.4` RFP V0.7 §6.0.5 顧問版補充：

> 告警路由按 sensor category 分：
>
> - **Site-level alert**（基於 ambient grid）：PM2.5 / CO₂ 超標、ambient 溫濕度異常 → 通知**場域管理員**
> - **Fan-level alert**（基於 fan-local）：風速過低（< 1 m/s 連續 30 min）/ fan-local 溫度異常 → 通知**Amafans 維修窗口** + **場域管理員**
> - **Power alert**（per CR-002）：超約 / 需量爆衝 / 電費異常 / 電表離線 → 通知**場域管理員 + Bruce 商務（EMS option 客戶）**

→ 沒問 Q5、就會 default「所有 alert 通知同一個 webhook」、結果 Amafans 維修被 PM 異常打擾 / 客戶場域管理員看不到風扇 fan-local 異常。Q5 必須 derive **alert routing matrix**。

UI hierarchy：`research/09 §9.4` 把 sensor metadata 對應 L1/L2/L3：

| Layer | 顯示什麼 |
|---|---|
| **L1 場域 overview** | 依 §3 ambient grid 點 + fan 數量 + ambient hero (PM/CO₂/T/RH) |
| **L2 fan detail** | 依 §3 fan-local 點 + 風速 + fan-local T/RH |
| **L3 trend + PDCA** | 跨 sensor category trending + per-fan group PDCA |

→ 沒問 Q5、UI mockup 不知新 sensor 在哪層顯示、Phase 1B 交付會 cascade 改。

**怎麼回答 Q5**：

| 來源 | 動作 |
|---|---|
| **平台既有 data pipeline 文件** | 既有 topic / DB schema / aggregation 規則 |
| **既有 UI mockup / wireframe** | L1/L2/L3 hierarchy 文件、看新 sensor 哪層 |
| **Alert routing matrix** | 現有 routing rule + 新 sensor 對應 owner |
| **Customer success 接觸計畫** | 客戶端 escalation path（誰收 alert / 誰 acknowledge）|

---

## §4. Output format — CR analysis report template

### 4.1 Per-CR 5-row table

每個 CR 一 logged、必填以下表格（5 row × 4 col = 20 格）：

| Q | Answer | Hedging level | Open question |
|---|---|---|---|
| **Q1 WHERE** placement | (1-3 line answer) | ✅ verified / ⚠️ partial / ❓ unverified | (open sub-question + owner) |
| **Q2 COUNT** scaling | (1-3 line answer) | (同上) | (open sub-question + owner) |
| **Q3 REGULATORY** compliance | (1-3 line answer) | (同上) | (open sub-question + owner) |
| **Q4 BOM** cost driver | (1-3 line answer) | (同上) | (open sub-question + owner) |
| **Q5 DATA+UI** pipeline + display | (1-3 line answer) | (同上) | (open sub-question + owner) |

**範例**（per Amafans CR-001 風速）：

| Q | Answer | Hedging level | Open question |
|---|---|---|---|
| Q1 WHERE | Fan-near placement、距 fan 下方 1.5-2 m air column。風速衰減快、不可場域 ambient | ✅ verified per `research/09 §2.3` + research/06 sensor IC + 通用流體動力學 | 確切高度 / 位置在 Phase 0 site survey 時 site-by-site adjust |
| Q2 COUNT | 按 S/M/L tier preset：S=1:1、M=抽樣 50%、L=抽樣 30-40% | ⚠️ Sara × Neko + Amafans Eric 商業選擇待定 per A.20 | 抽樣 fan 選定 SOP（representative + boundary fan / 分區）|
| Q3 REGULATORY | ASHRAE 55 §5.3 Local Thermal Discomfort 含風速量測規範（高度 0.1 m / 0.6 m / 1.1 m）| ⚠️ training-data 印象、需 Phase 0 WebSearch verify clause 編號 | 對客戶 / 法務 confirm 是否需 explicit cite |
| Q4 BOM | 風速 sensor 中國 OEM NT$ 2.5k-6k / 高階 E+E EE650 NT$ 10k-15k、3 年 TCO M 廠 hedged NT$ 30-60k | ⚠️ hedged ±30% variance、依 brand / 通路 / 客戶議價 | Bruce 商務評估 Y1 vs Y3 替換週期 |
| Q5 DATA+UI | RS485 slave addr per Amafans Neko 提供（A.1 阻塞中）/ L2 fan detail 顯示風速即時值 + 24h 折線 / Fan-level alert routing to Amafans 維修 + 場域管理員 | ⚠️ A.1 阻塞中、A.21 UI mockup Phase 1B 交付 | RS485 點位 metadata（slave addr / function / 高度）|

### 4.2 Cross-ref to applicable industry-addon question bank

| 產業 | 對應 industry-addon |
|---|---|
| 製造 / IoT / sensor 部署 | `industry-addons/iiot-deployment.md`（若存在）|
| HVLS 風扇 / 空氣品質 | `industry-addons/hvls-fan.md` + `industry-addons/air-quality.md`（若存在）|
| 食品物流 | `industry-addons/food-logistics.md`（若存在）|
| 醫療 / 半導體 cleanroom | `industry-addons/cleanroom-medical.md`（若存在）|

→ 每個 industry-addon 應該有自己的 **CR-trigger lint 子問題庫**（依產業特性擴充 5 大問的 sub-question）。

⚠️ 本檔不規定 industry-addon 內容（FW#1 agent 負責）、僅指出 cross-ref 入口。

---

## §5. Anti-pattern callouts

### 5.1 AP-CR-1：Surface-level CR triage（只 update sensor 清單名字、不過 5 問）

| 欄位 | 內容 |
|---|---|
| **發生** | CR 一進來、只把新 sensor 名字加到清單、列影響的 § 編號、標「待 Sara × Neko 對接」、close |
| **後果** | 5 大 implication（placement / count / regulatory / BOM / data&UI）需後續顧問 deep-dive surface、24 hr ~ 5 天 delay、Sara × Neko 對接時 customer-facing question 沒準備好 |
| **根因** | 沒 hardcode 5 問 trigger、靠 ad-hoc 推 implication |
| **教訓** | CR-trigger lint：每個新 sensor / device / data stream CR 強制過 5 問、未答完不算 logged |
| **對應 CR** | Amafans EAQS CR-001（加風速）|

### 5.2 AP-CR-2：Regulatory anchor 用訓練資料印象、不 WebSearch verify

| 欄位 | 內容 |
|---|---|
| **發生** | 寫「per ASHRAE 62.1 §6」、實際沒 WebSearch confirm 確切 clause + 數字 |
| **後果** | 客戶法務 / 認證審查時可能不對齊、需後續補驗、信譽損 |
| **根因** | 把「業界共識」當「verified」、跳過 multi-tool verification |
| **教訓** | Q3 regulatory anchor 一律走 `multi-tool-verification.md` 規則 4「業界 / 公司主張」WebSearch + 廠商官網交叉、未 verify 必 ⚠️ hedge |
| **對應 AP** | `anti-patterns.md` AP-NEW-ANTI-HALLUC-4 Single-tool over-confidence |

### 5.3 AP-CR-3：BOM 報價寫定值、不 hedged variance

| 欄位 | 內容 |
|---|---|
| **發生** | 寫「Sensor NT$ 5,000」、實際依 brand / 通路 / 客戶議價 ±30% variance |
| **後果** | 客戶 sales process 要 site survey 後才能 firm pricing、寫定值會被當承諾、後續 delta 被當「臨時加價」|
| **根因** | 跳過 cost band hedging discipline |
| **教訓** | Q4 BOM 一律寫「NT$ X-Y k hedged ±30% variance」、不寫定值 |
| **對應 AP** | `anti-patterns.md` AP-NEW-WRITE-1 寫 proposal 沒做 WebSearch |

### 5.4 AP-CR-4：Default 全 tier 同 scheme（不 derive S/M/L preset）

| 欄位 | 內容 |
|---|---|
| **發生** | 「每 fan 1:1」default 套到所有客戶、M/L 客戶嫌貴拒絕、S 客戶反而 over-deploy |
| **後果** | M/L 客戶 BOM 推高訂閱 cost、續訂 narrative 弱；S 客戶 over-deploy、信用受損 |
| **根因** | Q2 COUNT 沒 derive tier preset |
| **教訓** | Q2 必出 S/M/L preset master table、Phase 0 site survey 後微調 |
| **對應 AP** | `anti-patterns.md` AP-08 一律 Big Bang 上線（變形：一律 same scheme）|

### 5.5 AP-CR-5：Alert routing 沒分 owner、全進同一個 webhook

| 欄位 | 內容 |
|---|---|
| **發生** | 新 sensor alert 沒指 routing owner、default 全進同一個 webhook |
| **後果** | Amafans 維修被 PM 異常打擾 / 客戶場域管理員看不到風扇 fan-local 異常 / Bruce 商務沒收到電費爆衝 |
| **根因** | Q5 DATA+UI 沒做 alert routing matrix |
| **教訓** | Q5.5 必出 alert routing matrix per sensor category |
| **對應 AP** | `anti-patterns.md` AP-17 驗收標準寫「客戶滿意」（變形：通知都用 default）|

---

## §6. Cross-ref to industry-addons

當 CR-trigger lint fire、依產業 fetch 對應 industry-addon 子問題庫：

| 觸發 CR | 必讀 industry-addon |
|---|---|
| 新 sensor（PM / CO₂ / T / RH / 風速 / 噪音 / 震動）| `industry-addons/iiot-deployment.md` + `air-quality.md`（若存在）|
| 新 HVLS / 風扇相關 measurement | `industry-addons/hvls-fan.md`（若存在）|
| 新電力 / EMS device | `industry-addons/ems-tariff.md`（若存在）|
| 新人流 / 攝影機 / wearable | `industry-addons/pii-dpa.md`（若存在）|
| 新食品冷鏈 / 物流 sensor | `industry-addons/cold-chain.md`（若存在）|

⚠️ 本 protocol 不規定 industry-addon 內容（FW#1 agent 負責）。本 protocol 僅指出 cross-ref 入口、industry-addon 提供更細的 sub-question + 法規 anchor + 既有 case study。

---

## §7. Skill integration — `/cr-trigger-lint` skill spec（未來）

### 7.1 Trigger condition

| 觸發來源 | 條件 |
|---|---|
| **User invoke** | 「/cr-trigger-lint <file>」/ 「跑 CR lint」/「對這個 CR 過 5 問」 |
| **Auto-detect** | 偵測 `change-requests/CR-NN-*.md` 新檔、檢測有沒 5 問 5 row table、缺則建議跑 |
| **CR 結案 gate** | CR status 從 draft → confirmed 前、強制過 5 問 |

### 7.2 Skill output format

```markdown
# CR-NN Trigger Lint Report — [CR title]

## §1 5 問 answer table

| Q | Answer | Hedging level | Open question |
|---|---|---|---|
| Q1 WHERE placement | ... | ... | ... |
| Q2 COUNT scaling | ... | ... | ... |
| Q3 REGULATORY compliance | ... | ... | ... |
| Q4 BOM cost driver | ... | ... | ... |
| Q5 DATA+UI pipeline + display | ... | ... | ... |

## §2 Hedge summary

- ✅ Verified: [N]
- ⚠️ Partial: [N]
- ❓ Unverified: [N]
- → 任一 ❓ / ⚠️ → 列下一步 owner + deadline

## §3 Cross-ref industry-addon

- 適用 industry-addon: [list]
- 觸發 sub-question 子集: [list]

## §4 Anti-pattern check

- [ ] AP-CR-1 Surface-level triage 已避免？
- [ ] AP-CR-2 Regulatory anchor 已 WebSearch verify or ⚠️ hedged？
- [ ] AP-CR-3 BOM 已 hedged variance？
- [ ] AP-CR-4 S/M/L preset 已 derive？
- [ ] AP-CR-5 Alert routing matrix 已出？

## §5 Recommended next steps

- [Owner]: [action] by [date]
- ...
```

### 7.3 Skill 依賴

- **Read**：CR file（`change-requests/CR-NN-*.md`）
- **Optional WebSearch**：Q3 regulatory anchor verify（per `multi-tool-verification.md` 規則 4）
- **Cross-ref**：`industry-addons/<applicable>.md`（若存在）
- **Output**：新 file `change-requests/CR-NN-lint-report.md` + update CR file 本體加 5 問 table

⚠️ 本檔僅 spec skill trigger + output 格式、實際 skill 實作見未來 `~/.claude/skills/cr-trigger-lint/SKILL.md`（不在本檔範圍）。

---

## §8. Dogfood examples

### 8.1 Amafans CR-001（加風速）— 跑 5 問 lint 會 surface 什麼

| Q | 5/28 原 CR 狀態 | 5 問 lint 會 surface 什麼 |
|---|---|---|
| **Q1 WHERE** | 列了 3 種風速類型（fan output / ambient / RPM derived）、推測 (A) fan output、但**沒 derive placement 邏輯** | **應 surface**：fan-near placement、距 fan 下方 1.5-2 m air column、ASHRAE 55 §5.3 anchor、不可場域 ambient（per `research/09 §2.3`）|
| **Q2 COUNT** | 「客戶端每台 / 每區風扇需加風速 sensor」、**沒 derive tier preset** | **應 surface**：S=1:1 / M=抽樣 50% / L=抽樣 30-40%、抽樣 SOP（representative + boundary fan / 分區）（per `research/09 §6`）|
| **Q3 REGULATORY** | **完全沒提法規 anchor** | **應 surface**：ASHRAE 55 §5.3 ⚠️ training-印象、需 WebSearch verify clause 編號（per `research/09 §10.2`）|
| **Q4 BOM** | 「客戶平均 20 支 = 20+ sensors」、無 cost band | **應 surface**：sensor NT$ 2.5k-6k OEM / NT$ 10-15k 高階、3 年 TCO M 廠 hedged NT$ 30-60k（per `research/09 §5.1`）|
| **Q5 DATA+UI** | 列了 §6.0.1 / §6.0.4 / §6.1 / §6.0.5 影響 / 告警 / 多語系、**但沒做 alert routing matrix** | **應 surface**：Fan-level alert routing to Amafans 維修 + 場域管理員、L2 fan detail 顯示風速即時 + 24h 折線 + heatmap（per `research/09 §7.4` + §9.4）|

→ 若 5/28 當下跑 5 問 lint、Sara × Neko 對接時 5 個 customer-facing question 直接準備好、不需等顧問 deep-dive 24 hr 後 surface。

### 8.2 Amafans CR-002（加電力箱）— 跑 5 問 lint 會 surface 什麼

| Q | 5/28 原 CR 狀態 | 5 問 lint 會 surface 什麼 |
|---|---|---|
| **Q1 WHERE** | 列了 CR-002.a 三選（A 只風扇分路 / B 客戶整廠總電表 / C 總+分路）、**有 surface scope question** ✅ | 已 OK、Q1 在 CR-002.a 已 surface |
| **Q2 COUNT** | 大同大學 5 電表案例做 benchmark、**沒 derive tier preset** | **應 surface**：S=1 總+1 分路、M=1 總+2-3 分路、L=1 總+4-6 分路（per `research/09 §6.2`）|
| **Q3 REGULATORY** | 引台電契約用電辦法 + 經濟部能源局《能源管理法》✅ verified（per `research/cr002-tariff-ems-taiwan.md`）| 已 OK、Q3 已 verified |
| **Q4 BOM** | 「GoodLinker 端零開發」、客戶端電表 BOM 待 Amafans 配套提供、**沒 derive S/M/L preset 跟 GenAI cost band** | **應 surface**：GenAI cost NT$ 20-50/月/客戶、電表 BOM 走 GoodLinker 標準 Energy Data Panel（per CR-002 §影響範圍）|
| **Q5 DATA+UI** | 列了 §6.0.5 告警類型（超約 / 需量異常 / 電費爆衝）、AI 月報、PDCA、**alert routing 已 partial 拆**（per `research/09 §7.4`）| 已 OK、Q5 partial surfaced |

→ CR-002 比 CR-001 surface 早（因為 GoodLinker 內部主動提案、自家既有 functionality）、但 Q2 跟 Q4 tier preset 仍漏（需後續顧問 deep-dive）。

### 8.3 Hypothetical 案例 — 跑 5 問 lint 會 surface 什麼

#### 8.3.1 假設 CR-003：加 vibration sensor（監測 fan 軸承健康）

| Q | 5 問 lint surface |
|---|---|
| **Q1 WHERE** | Fan 軸承上、accelerometer 直接黏附（per ISO 10816 振動量測標準）⚠️ training-印象 / 不可場域 ambient |
| **Q2 COUNT** | 推 **per fan 1:1**（軸承健康不可抽樣、單 fan 故障即 fail）|
| **Q3 REGULATORY** | ISO 10816 機械振動量測 ⚠️ training-印象、需 WebSearch verify |
| **Q4 BOM** | Vibration sensor NT$ 3-8k IEPE / NT$ 15-30k 高階 wireless ⚠️ hedged、3 年 TCO M 廠 hedged NT$ 40-80k |
| **Q5 DATA+UI** | RMS / peak / FFT 上雲、L2 fan detail 加 vibration trend chart、Fan-level alert routing 到 Amafans 維修（軸承異常 = preventive maintenance trigger）|

→ Vibration 跟風速 placement 邏輯不同（fan 軸承 vs fan 下方 air column）、count 不同（必 1:1）、法規不同（ISO 10816 vs ASHRAE 55）— 顯示 5 問每個 CR 答案都應該 derive 不同 scheme。

#### 8.3.2 假設 CR-004：加濕度 grade 細分（區分 ambient vs fan-local）

| Q | 5 問 lint surface |
|---|---|
| **Q1 WHERE** | 雙軌：(a) 場域 grid ambient 站、(b) fan 下方 fan-local（per `research/09 §2.2`）|
| **Q2 COUNT** | per `research/09 §6.2`：S=1 ambient + 3 fan-local / M=2-3 ambient + 4-5 fan-local / L=4-6 ambient + 6-10 fan-local |
| **Q3 REGULATORY** | ASHRAE 55-2020 §5 + CNS 12676 室內濕度 ⚠️ training-印象 |
| **Q4 BOM** | IC 級 SHT4x NT$ 200-1k、低成本、3 年 TCO M 廠 hedged NT$ 10-30k |
| **Q5 DATA+UI** | L1 場域 overview 顯示 ambient hero / L2 fan detail 顯示 fan-local delta vs ambient / Site-level alert（ambient 異常）+ Fan-level alert（fan-local 異常）|

→ 既有 sensor 加新 grade（不是新 hardware）、但仍 fire（因為觸發新 measurement + 新 UI dimension）。

#### 8.3.3 假設 CR-005：加 temperature delta（衍生指標、不是新 sensor）

| Q | 5 問 lint surface |
|---|---|
| **Q1 WHERE** | N/A — delta 是衍生、placement 已 inherit ambient + fan-local |
| **Q2 COUNT** | N/A — count 已 inherit 既有 sensor |
| **Q3 REGULATORY** | ASHRAE 55 thermal comfort 計算規範 ⚠️ training-印象 |
| **Q4 BOM** | 零硬體增量、僅 GoodLinker 平台側計算邏輯 + UI 顯示 |
| **Q5 DATA+UI** | DB 加 derived column / API 加 endpoint / L2 fan detail 加 delta chart / Site-level alert（delta > 5°C 表示 HVLS 效益異常）|

→ 衍生指標 CR、Q1-Q2 N/A、但 Q3-Q5 仍 fire — 顯示 lint 對「衍生 measurement」也適用、但 Q1/Q2 答案是 N/A + 標明 inherit 來源。

---

## §9. 結論 + 下一步

### 9.1 解決什麼

1. **CR 一 logged 即過 5 問**（Q1 WHERE / Q2 COUNT / Q3 REGULATORY / Q4 BOM / Q5 DATA+UI）、不再 surface-level triage
2. **5 問 5 row table** + hedging level + open question 是 CR close 條件、未答完不算 logged
3. **5 個 anti-pattern**（AP-CR-1 ~ AP-CR-5）覆蓋常見翻車類型
4. **Cross-ref industry-addon** 機制（未來 industry-addon 提供子問題庫擴充）
5. **`/cr-trigger-lint` skill spec**（未來實作）
6. **3 hypothetical CR dogfood**（vibration / 濕度 grade / temperature delta）顯示 5 問每 CR 答案都不同、不能 default

### 9.2 已驗 vs 未驗（per `multi-tool-verification.md` hedging discipline）

| Claim category | Verification status |
|---|---|
| 5 問 trigger 來源（Amafans EAQS CR-001 dogfood）| ✅ Verified per `change-requests/CR-001-add-wind-speed.md` + `research/09-sensor-placement-consultancy.md` |
| ITIL 7Rs / CMMI CM 對比 | ✅ Verified per WebSearch（多 source）|
| AP-CR-1 ~ AP-CR-5 anti-pattern | ✅ Derived per Amafans EAQS dogfood + ProposalOS 既有 anti-patterns.md framework |
| Hypothetical CR 案例（vibration / 濕度 grade / temperature delta）| ⚠️ 推導範例、未 dogfood 真實案件 |
| 法規 anchor（ASHRAE / OSHA / ISO 10816 / CNS）| ⚠️ training-data 印象、本檔不重 verify（屬 Q3 範圍、CR-trigger lint 跑時才 verify）|

### 9.3 未解 / 待補

| 項目 | Owner | 時程 |
|---|---|---|
| `/cr-trigger-lint` skill 實作 | 後續 skill 開發 | TBD |
| Industry-addon 子問題庫對應 | FW#1 agent | per industry-addon 各檔 |
| 真實案件累積 CR-trigger 抓中率（5 問漏問了幾項）| 後續案件 retrospective | per 真實案件 |
| 對其他 CR 類型擴充（如新 user role / 新 protocol / 新 cloud region）| 後續方法論擴充 | TBD |

### 9.4 跟既有 ProposalOS framework 的對應

| 既有 framework | 本檔 cross-ref |
|---|---|
| `8-mandatory-checks/C-decision-log.md` | CR-trigger lint 是 C 強制檢查項的 sub-protocol、CR 一 logged 即 trigger |
| `methodologies/multi-tool-verification.md` | Q3 regulatory anchor 走規則 4「業界 / 公司主張」WebSearch + 廠商官網交叉 |
| `methodologies/spine-mode-for-large-proposal.md` | CR 5 問 table 是 spine 主檔的 cross-ref entry、details 放 `change-requests/CR-NN-lint-report.md` |
| `anti-patterns.md` AP-NEW-ANTI-HALLUC-4 | AP-CR-2 Regulatory anchor 訓練資料印象 = 本檔特化版 |
| `industry-addons/<applicable>.md` | Q1-Q5 子問題庫擴充入口 |

---

## §10. Reference

### 10.1 WebSearch citations（3 個）

- [ITIL Change Management 7Rs Impact Assessment](https://blog.masterofproject.com/change-request-7-r/) — 7Rs 通用 IT change 問法、本檔借用 Reason / Risk / Resources / Relationship 概念、擴成 5 問 sensor 特化
- [CMMI Configuration Management Change Request Impact Analysis](https://www.wibas.com/cmmi/cmsp-21-track-change-requests) — CMMI CM SP 2.1 Track Change Requests、impact analysis 含 work product / 預算 / 排程、本檔擴成 BOM / placement / regulatory / data&UI 4 軸
- [Software Change Request Impact Analysis 5 Questions](https://www.joetheitguy.com/how-to-assess-the-risk-of-a-change-with-5-simple-questions/) — 5 simple questions 風險評估、本檔對應到 Q4 BOM hedging discipline

### 10.2 內部 cross-ref

- `change-requests/CR-001-add-wind-speed.md` — dogfood 主要 case（5/28 surface-level + 5/29 顧問補件）
- `change-requests/CR-002-add-power-box.md` — dogfood 對比 case（GoodLinker 主動提案、部分 surface 早）
- `research/09-sensor-placement-consultancy.md` — placement / count / regulatory / BOM / data&UI 5 軸 deep-dive、是 CR-trigger lint protocol 的 dogfood 源頭
- `methodologies/multi-tool-verification.md` — Q3 regulatory anchor verify 走多 tool sequence
- `anti-patterns.md` AP-NEW-ANTI-HALLUC-4 — Single-tool over-confidence 對 Q3 anchor 之 hedging discipline

---

**版本**：v0.1 draft、2026-05-29
**起源**：Amafans EAQS 2026-05-29 retrospective、CR-001 surface-level 翻車後提煉
**驗證狀態**：3 WebSearch citation verified（ITIL 7Rs / CMMI CM / 5 questions）+ 內部 dogfood 主 case verified（Amafans CR-001/CR-002 + research/09）+ 4 hypothetical CR 範例為 推導 hedged
**驗證 ⚠️ markers**：本檔內 ⚠️ training-data 印象 hedge 計約 7-9 處（主要對應 Q3 regulatory anchor 範例段、法規 clause 編號需 CR-trigger 跑時 WebSearch verify、本 methodology 檔不重 verify）
**對應 skill 觸發**：未來 `/cr-trigger-lint` skill（spec 見 §7）

---

## §11. CR Revoke Cascade Methodology（CR 撤回 / scope-shrink 後的 cascade sweep）

### §11.1 介紹 — 為什麼要這節

`§3 5-Q lint` 涵蓋 **CR fire** 時 5 維度 implication 驗（WHERE / COUNT / REGULATORY / BOM / DATA+UI）— 是 CR 進來那一刻要做的事。

本節涵蓋 **CR revoke / scope-shrink / cleanup execution** — 一個 CR 已經被撤回、scope 縮小、product 整個 cut 的時候、**framework 要怎麼掃 child docs / cross-ref / RACI / UAT case / audit chain、不留半身 stale**。

兩節互補：
- **§3** = CR 出生時的 implication 驗 (lint at fire-time)
- **§11** = CR 死亡 / 縮 scope 時的 cascade 清理 (sweep at revoke-time)

> Per Amafans EAQS 2026-06-01 dogfood（W3-A / W3-B / W5-B audit）：CR-003 撤回電力 + AI 月報 cut 同 session 觸發 ~48 file × ~600 corrections cascade、但 W5-B audit 仍 caught 4 ancillary file 完全 pre-CR-003 + 2 file partial sweep banner-only 留 8 inline mentions stale。沒有 methodology → 每次 cleanup 都漏。

### §11.2 3-Mode 決策樹（revoke 範圍 × 是否保留 forward routing）

| Mode | 條件 | 處理方式 | 範例 |
|---|---|---|---|
| **Mode A: Narrow-keep** | 部分撤回、保留 Phase 2 / 後續階段 forward routing（不打死「永遠不做」）| Header banner + Phase-N routing note + body inline strikethrough、保留商務 reroute path | **CR-002 撤回電力**（amafans CR-003）：Phase 1 cut 電力 + Phase 2 EMS module 另案 forward path 保留、客戶有電力需求 → 轉介 GoodLinker EMS sales |
| **Mode B: Full-cut** | 整 product / feature cut、不保留 routing（unconditional removed） | Header banner + body inline strike ❌ N/A across all mentions + UAT row 移除 / strikethrough + RACI row strike | **AI 月報 cut**（amafans 2026-06-01）：S01-S05 monthly cron + Anthropic Claude + PDCATracker + `/monthly` route + MonthSelector 全 cut、24 file cascade strike |
| **Mode C: Archive** | 該 doc 整個 obsolete、新版 doc 取代 / 內容過時且無 forward path | Move file → `archive/` folder + 頂部加 `> ⚠️ HISTORICAL — superseded by [new doc]、do not cite for current scope` banner | **W7 archive moves**（amafans 2026-06-01）：pre-CR-003 retro draft / pre-V.08 RFP audit / pre-cut 1-pager moved to `archive/` per W5-A audit recommendation |

**決策樹**：
```
CR 撤回 / scope shrink 進來
    ↓
Phase 2 / 後續 forward path 保留嗎？
    ├─ Yes → Mode A: Narrow-keep（保留 routing note）
    └─ No  → 該 doc 還有 current scope 價值嗎？
              ├─ Yes → Mode B: Full-cut（body inline strike、doc 留）
              └─ No  → Mode C: Archive（move to archive/、加 HISTORICAL banner）
```

### §11.3 7-Step Sweep Checklist（任一 mode 都要跑、依 mode 內容不同）

CR record 一旦從 draft → confirmed revoke 狀態，**同 commit 內**跑完 7 step：

1. **CR record file 加 revoke 決議 + 5-row decision chain audit trail**
   - CR-NNN.md 檔頂部加 `> ⚠️ REVOKED YYYY-MM-DD per [decision source]` banner
   - 含 5-row decision chain（per `anti-patterns.md` AP-NEW-DECISION-CHAIN-1）：WHO initiated / WHEN finalized / WHO ↔ WHO sync before / WHO informed after / counterparty commitment confirmed
   - 例：amafans CR-003 §9.1 5-row chain (Ethan ↔ Eric phone confirm + GoodLinker 內部 informed + Amafans 內部 informed)

2. **Child doc body inline strikethrough + ❌ 標 N/A**
   - 不能只在 header 加 banner、body 全文 grep keyword 都要 strikethrough
   - `<del>` HTML tag 或 markdown `~~text~~`、配 `❌ N/A per CR-NNN YYYY-MM-DD`
   - 例：amafans `raci.md L48 / L52` 「電力分析」row 加 strikethrough + ❌ N/A

3. **Cross-ref typo grep sweep（防 broken link）**
   - 新 CR record file 命名後、grep 所有 `CR-NNN-*` 引用 verify naming 一致
   - 例：amafans 一度有 `CR-003-remove-electricity-monitoring.md` typo、應為 `CR-003-remove-power-from-scope.md`、broken link 4 處 cross-ref

4. **RACI row 處理**
   - RACI matrix 內凡 owner / responsible 涉及 revoked scope 都 strikethrough + reason note
   - 不要直接刪 row（保留 audit trail）、用 strikethrough + `(removed per CR-NNN)` 註

5. **UAT case row 處理**（per Mode B / C 必跑、Mode A 移動到 Phase 2 UAT）
   - UAT script / acceptance criteria 內凡 revoked feature 都 strikethrough / 移除 / 標 N/A
   - 例：amafans `acceptance/uat-script.md` AI 月報 5 case row strike + 標「Phase 2 EMS routing、Phase 1 N/A」

6. **Audit score chain update**
   - rfp-audit.md / 內部 audit doc 內 audit score evolution chain 更新
   - 注意 audit score 可能 **non-monotonic**（amafans W5: 73→91→98→95→93、D.5 differentiator 略降反映 scope shrink、但 audit trail + Protocol A 加分）
   - 不要強行寫「audit score 持續上升」、scope shrink 對某維度可能扣分但對 risk / clarity 加分、要 explicit 註

7. **README CR table + roadmap update**
   - README / index doc 內 CR list table 加 revoked status + revoke date + reason
   - Roadmap / Phase plan 內 revoked feature 移到 Phase 2 / 或標 ❌ removed
   - Spine 主檔（`proposal.md`）對應 §X 段加 cross-ref to CR-NNN revoke note

### §11.4 Dogfood Examples（雙 case + W6/W7 cleanup）

#### Dogfood 1: CR-002 Narrow-keep（Mode A、amafans CR-003 撤回電力）

- **Trigger**：2026-06-01 Ethan ↔ Eric 電話 confirm 撤回電力 from Phase 1 scope
- **Mode**：A — narrow-keep、Phase 2 EMS module forward routing 保留
- **CR record**：`change-requests/CR-003-remove-power-from-scope.md`（含 §9.1 5-row decision chain）
- **Cascade scope**：~24 file edit（proposal.md spine §3 + RACI + UAT + roadmap + README + 4 industry-addon cross-ref + ai-handoff/spec + research/cr002-* + rfp-audit + decks-sub）
- **Step 1 例**：CR-003 §9.1 5-row decision chain explicit、不只「Ethan 決議」單一 actor naming
- **Step 7 例**：README CR table 加「CR-002 → CR-003 撤回、Phase 2 EMS routing」+ Roadmap Phase 1 scope 移除電力 + Phase 2 加「客戶有電力需求 → Amafans 轉介 GoodLinker EMS module 獨立合約」routing note

#### Dogfood 2: AI 月報 Full-cut（Mode B、amafans 2026-06-01 全 cut）

- **Trigger**：2026-06-01 user authoritative directive「AI 月報都要拿掉、因為他本來就跟能源模組綁在一起的」
- **Mode**：B — full-cut、無 forward routing（AI 月報 與能源模組綁、能源模組已 Phase 2 routing、AI 月報自然 Phase 2 reserved）
- **Cascade scope**：~24 file × inline strikethrough（S01-S05 monthly cron + Anthropic Claude + PDCATracker + `/monthly` route + MonthSelector）
- **Step 2 例**：每個 inline「AI 月報」mention 都要 strikethrough + ❌ N/A、不能只在 header 加 banner（W5-B audit caught `sales/joint-sales-kit.md` 8 處 inline still active despite header banner — 經典 Mode B sweep 失敗 case）
- **Step 5 例**：`acceptance/uat-script.md` AI 月報 5 case row 全 strikethrough + 標「Phase 2 EMS reserved」

#### Dogfood 3: W6 cleanup + W7 archive（48 file change in one commit）

- **Trigger**：2026-06-01 W5-B audit 找到 41 inconsistency、9 critical、user directive「W6 fix + W7 archive」
- **Mode mix**：Mode B (full-cut sweep on stale phrasing) + Mode C (archive obsolete pre-CR-003 docs)
- **Cascade scope**：48 file change in one commit（W6 fix critical inline strikethrough + W7 move 4 obsolete file to `archive/`）
- **Step 6 例**：rfp-audit.md audit score chain 73→91→98→95→93 non-monotonic explicit 註、D.5 differentiator score 略降 reflect 4→2 differentiator narrative shift
- **Lesson reinforced**：**沒有 methodology → 每次 cleanup 都漏、W5-B 41 finding 證明 banner alone 不夠**（see `anti-patterns.md` AP-NEW-CASCADE-2 G2 fix）

### §11.5 Cross-ref

- **`anti-patterns.md` AP-NEW-CASCADE-PHRASING-1**（child docs phrasing stale at parent index change）— 本節 Step 2 內 inline strike-through 規則的 anti-pattern 源
- **`anti-patterns.md` AP-NEW-CASCADE-2**（Header banner ≠ body sweep done — partial sweep 留半身 stale）— 本節 Step 2 + Step 4 verify-zero-match 規則的 anti-pattern 源、雙 doc 互引
- **`anti-patterns.md` AP-NEW-DECISION-CHAIN-1**（5-row audit trail explicit）— Step 1 decision chain 必含 5 欄、cross-party sync chain 不能省
- **`methodologies/spine-mode-for-large-proposal.md`** HISTORICAL banner / archive 結構 — Mode C archive 目錄結構 + banner 文字模式
- **`methodologies/multi-tool-verification.md` commit checkpoint #11**（parent index add → child cascade sweep）— 本節 7-step checklist 是該 commit checkpoint 的 expanded 版

---
