# 產業加掛｜IIoT Deployment（工業 IoT 部署）

> **Meta-framework upgrade**：本檔為 ProposalOS framework Day-1 consultant-question bank、回應 Amafans EAQS 2026-05-29 retrospective 翻車 — 「客戶 sensor 要放哪？」這類問題第 5+ session 才被 user push 出來。本檔讓下個 IIoT 案件 Day 1 auto-surface 50 個顧問必問問題、不再等 user push。
>
> **Scope**：工業 / 製造 IoT 部署案件（工廠 sensor / telemetry / edge gateway / 雲端 PaaS）。**B2B-only**、含 B2B2B（PaaS × OEM × 終端客戶、如 Amafans × GoodLinker × 工廠）。
>
> **使用方式**：proposal-os skill Phase 1（產業 / 訪談）開始前、auto-surface 本檔。Phase 0 site survey 必填 §1 + §2、Phase 1 訪談前必過 §3-§5、Phase 2 模組 06/08 fill 前必對齊本檔產出。
>
> **Verification status（per CLAUDE.md anti-hallucination protocol）**：法規 clause 編號 / 業界 rule of thumb 標 ⚠️ training-data 印象、需 WebSearch 補。已 cite 真實 source：ASHRAE 62.1-2022、ISA-95 Purdue Model、台灣《室內空氣品質管理法》、Big Ass Fans 安裝指南、HiveMQ / EMQX 邊緣 buffer best practice。
>
> **Last updated**：2026-05-29（initial draft v0.1）。

---

## §0 Scope — 何時觸發本 addon

### 0.1 Trigger keyword

| 中文 keyword | 英文 keyword | 案件樣態 |
|---|---|---|
| 工廠 / 廠房 / 製造業 / OT | factory / plant / manufacturing / OT | 製造業 IT/OT |
| sensor / 感測器 / 量測 / 監測 | sensor / metering / telemetry | 場域 / 設備量測 |
| MQTT / Modbus / RS485 / OPC UA | — | 工業通訊協定 |
| Gateway / 閘道器 / 邊緣 | gateway / edge / RTU | 邊緣設備 |
| 上雲 / cloud telemetry / 雲端整合 | cloud telemetry / IoT platform | 雲端整合 |
| 預知保養 / PdM / 稼動率 / OEE | predictive maintenance / OEE | 製造 KPI |
| ESG / 碳盤查 / 能源管理 | EMS / energy management | 能管 / ESG |
| 空品 / PM2.5 / CO₂ / 溫濕度 | IAQ / indoor air quality | 空品監測（→ 同步觸發 air-quality-system addon）|
| HVLS / 工業風扇 / 大型風扇 | HVLS fan / industrial fan | HVLS 案（→ 同步觸發 hvls-fan addon）|

### 0.2 何時 NOT 用本 addon

- 純 IT SaaS（無實體 sensor / 設備）→ 用 `saas-software.md`
- 純 B2C 智慧家電 → ProposalOS 不適用（B2B-only framework）
- 純資料分析 / BI（無 ingest hardware）→ 用 `manufacturing.md` + `methodologies/c4-model.md`

### 0.3 觸發後本檔產出時機

| Phase | 觸發時機 | 本檔對應段 |
|---|---|---|
| **Phase 0** Pre-flight | 接到案件 keyword 後 24 hr 內 | §1（10 題、case kickoff）|
| **Phase 0/1** Site survey + 訪談前 | Site survey 排程前 1 週 | §2 sensor scheme（15 題）+ §3 gateway（8 題）|
| **Phase 1** 訪談中 | 第 1-2 次訪談 | §4 data governance（7 題）+ §5 NFR / SLA（5 題）|
| **Phase 2-5** 模組 fill | RTM / 架構 / 驗收 / 報價 fill 時 | §7 dogfood + §6 trigger 表回查 |

---

## §1 Pre-flight assumption checklist（10 題、case kickoff 24 hr 內必過）

**Why**：避免「客戶零基礎」型 wrong assumption（per anti-patterns.md AP-NEW-WRITE-1）— 接案前 30 分鐘必過此 10 題、用 WebSearch + 短訪。

### Q1.1 — 客戶 factory layout 已知否？單一 site 還是多 site？

**為何問**：BOM scope / 報價 tier / onboarding 工時直接受 site 數量驅動。多 site 必含跨 site UI hierarchy + 跨 site data aggregation 需求。

**Trigger**：所有 IIoT 案、Phase 0 必填。

**期望答**：(a) 單 site / 多 site 數量 (b) 每 site 面積（m²）(c) 是否同產業 / 異產業混合 (d) 是否跨國（觸發資料主權 §4.5）。

**Anti-pattern 避**：用「假設單 site」default、實際 3 個廠 → 報價 / 工時 + 200%（per AP-08 Big Bang）。

### Q1.2 — 監測設備 / 量測點數量已知否？靜態 / 動態？

**為何問**：sensor count 是 BOM / 訂閱費 / 雲端 ingestion cost 的 master driver。靜態 vs 動態（如行動式設備、隨產線 reconfig）會 fundamentally 改 onboarding / sensor mounting / network topology。

**Trigger**：所有 IIoT 案。

**期望答**：N 個 device（設備）× M 個 sensor / device、是否會隨產線 reconfig 變動、是否有 hot-swap / hot-add 需求。

### Q1.3 — Sensor 種類客戶已選 / 已 lock 廠牌 / 開放推薦？

**為何問**：客戶若已 lock 廠牌（如「我只買 Siemens / Endress+Hauser」）— 報價結構、整合風險、competitive landscape 完全不同。若開放推薦 — 顧問可主導 BOM 設計、利潤空間大。

**Trigger**：所有 IIoT 案。

**期望答**：(a) lock 哪家 (b) 開放任選 (c) 客戶有「不可選」black list（如「不買中國品牌」per geopolitical 顧慮）。

**Cross-ref**：[research/09 §3 Master placement table](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md)（Amafans EAQS dogfood — 5 sensor 種類 × placement scheme）。

### Q1.4 — Connectivity 假設（Wi-Fi / Ethernet / 4G/5G / LoRa / 工業 fieldbus）？

**為何問**：(a) 廠房 Wi-Fi cover 不到生產線是常態 (b) 4G/5G 流量費月帳上限要 cap（per AP-12 用量上限）(c) LoRa 點距 / 穿牆 / EMI 都有 limit (d) 工業 fieldbus（Modbus RTU / Profinet / EtherCAT）有自己的物理層需求。

**Trigger**：所有 IIoT 案。

**期望答**：(a) 主 connectivity 規劃 (b) fallback / redundancy (c) 是否需 ATEX / IECEx 防爆認證網路設備 (d) 預計每 month per device 流量（MB）。

**WebSearch verified**：per [HiveMQ Industrial Edge 文章](https://www.hivemq.com/blog/powering-the-industrial-edge-with-mqtt/)、邊緣 gateway 應 default store-and-forward buffer、應對 flaky network。

### Q1.5 — 資料主權 / 跨境 / region constraint？

**為何問**：(a) 中國境內 → PIPL + 不能存境外（觸發 §4.5）(b) 歐盟 → GDPR + SCC + region 限定 (c) 半導體 / 國防 / 政府 → 國產雲端 / 信任應用清單。

**Trigger**：跨國集團 / 政府 / 半導體 / 醫療 / 金融關聯客戶。

**期望答**：(a) 客戶接受的 region (b) 客戶禁止的 region (c) 是否走 customer-owned cloud（BYOC）。

**Anti-pattern 避**：用 default region（如 AWS Tokyo）不問客戶、後期合約被法務退（per anti-patterns.md AP-NEW-ANTI-HALLUC-1 Tokyo 案例）。

### Q1.6 — 維護 access — 本地團隊 or remote-only？

**為何問**：(a) 本地有電工 / IT → onboarding 排程靈活 (b) remote-only → 必含 OTA / remote troubleshooting 工具鏈 (c) 高機密廠（半導體 / 軍工）→ 不能 remote、需現場票證流程。

**Trigger**：所有 IIoT 案。

**期望答**：本地 vs remote vs 混合、有無 vendor escort 規定、廠 SOP（如必兩人入內）。

### Q1.7 — 既有 IT/OT 整合 baseline — MES / ERP / SCADA / BMS 已有？

**為何問**：(a) 客戶有 SAP / Oracle ERP → 整合工程量是新拉系統 3-5×（per AP-NEW-WRITE-1 祥圃案例）(b) 有 SCADA（Siemens WinCC / Rockwell FactoryTalk）→ 走 OPC UA bridge (c) 有 BMS（Honeywell / Johnson Controls）→ BACnet 整合。

**Trigger**：所有製造業 IIoT 案、特別 200 人 +。

**期望答**：(a) ERP 廠牌 + 版本 (b) MES（若有）廠牌 (c) SCADA 廠牌 (d) BMS（若樓宇）廠牌 (e) 是否需即時雙向 sync vs 單向 read-only。

**WebSearch verified**：per [HighByte ISA-95 Industry 4.0](https://www.highbyte.com/blog/applying-isa-95-in-an-industry-40-world) — IIoT 平台必對齊 ISA-95 Level 0-4 階層、Level 1 sensor 直接走 cloud telemetry 是現代趨勢、但仍需跟 Level 3 MES / Level 4 ERP 做資料對齊。

**Cross-ref**：[anti-patterns.md AP-NEW-WRITE-1 SAP ERP 假設踩雷](../anti-patterns.md#ap-new-write-1)。

### Q1.8 — 客戶既有資料平台 — 取代 or 共存？

**為何問**：(a) 客戶有自己的歷史資料平台（如 PI Historian / GE Proficy）→ 我方平台是替代 or 並存？並存則必含資料同步機制 (b) 客戶有 BI 工具（Power BI / Tableau）→ 必含 API / data export。

**Trigger**：所有 IIoT 案。

**期望答**：(a) 取代既有 (b) 並存（指定哪些資料雙向同步）(c) 客戶要直接 BI 接、走 API / data lake。

**Anti-pattern 避**：寫「我們是 single source of truth」但實際客戶有 PI Historian、雙系統並行 → 資料對不上、客戶 blame 我方。

### Q1.9 — Lifecycle — pilot / scale / enterprise stage？

**為何問**：(a) pilot stage → 客戶 willingness 高、但 budget 低、KPI 是「能 demo」(b) scale stage → 預期 production-grade、KPI 是 OEE 提升 X% (c) enterprise stage → 多廠 / 國際、KPI 是平台統一 + 合規。

**Trigger**：所有 IIoT 案、Phase 0 必填。

**期望答**：(a) 客戶當下階段 (b) 預計 1-2 年內進展 (c) 客戶內部成功案例 reference。

**Cross-ref**：[模組 09 方案分階段](../modules/09-solution-options-phased-rollout.md)。

### Q1.10 — Regulatory anchor by industry — 半導體 / 食品 / 製藥 / 化工 / 一般製造？

**為何問**：產業別決定 mandatory regulation：
- 半導體：SEMI 規範 + cleanroom ISO 14644 + 半導體園區資安
- 食品：HACCP + ISO 22000 + 衛福部食安法
- 製藥：GMP + FDA 21 CFR Part 11（電子簽章 / audit trail）
- 化工：ATEX / IECEx 防爆 + REACH
- 一般製造：ISO 9001 / 14001 / 45001 baseline

**Trigger**：所有 IIoT 案、Phase 0 必填。

**期望答**：客戶產業 + 客戶目前持有 / 預計取得認證 + 對方供應鏈下游有無附加要求（如 Tier 1 給汽車廠 → IATF 16949）。

**Cross-ref**：[manufacturing.md §模組 07 合規與標準](manufacturing.md#模組-07-合規與標準) + [模組 07 合規資安 AI](../modules/07-compliance-security-ai-risk.md)。

---

## §2 Sensor scheme deep-dive（15 題、THE category Amafans EAQS 5 session 才挖出）

**Why**：sensor scheme = BOM cost driver + onboarding 工時 driver + measurement representativeness driver + ROI 量化的 critical dependency。Amafans EAQS 案 5 session 才釐清「1 fan 1 set vs 1 site 1 set」是 binary 偽選擇、實際是 mixed strategy。本節讓下案 Day 1 過關。

**Concrete dogfood**：[Amafans EAQS research/09 sensor-placement-consultancy](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md)（605 lines、解 A.18-A.21 + 3 新風險 + 4 段 RFP V0.7 drop-in clause）。

### Q2.1 — 物理量分類（ambient / asset-local / process / safety）？

**為何問**：不同物理量空間特性不同 — 強行單一 placement scheme 必然某維度測不準。

**4 類分法（per research/09 §2）**：
1. **Ambient bulk**（PM2.5 / CO₂ / 場域溫濕度）：bulk 屬性、grid 配置、避 fan downwash
2. **Asset-local**（fan-local 溫濕度 / 風速 / 機台震動）：local delta、設備附近、1:1 or 抽樣
3. **Process-bound**（流量 / 壓力 / 製程 pH）：source-bound、製程管線
4. **Safety-bound**（CO / VOC / explosive gas）：法規門檻、分區密度

**期望答**：客戶要量的物理量列表、每項分到哪類。

### Q2.2 — Per-device vs per-zone vs per-grid sensor density？

**為何問**：(a) per-device 1:1 → BOM 推高 N× (b) per-zone → 適用大廠分區 (c) per-grid（場域 grid）→ ambient 物理量必用。

**Trigger**：Phase 0 site survey 必過。

**期望答**：每物理量對應的 density 規則 + S/M/L preset。

**Cross-ref**：[research/09 §6 S/M/L BOM preset](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§6-sensor-bom-sml-preset)。

### Q2.3 — Regulatory placement anchor — ASHRAE / OSHA / CNS / 國家規範？

**為何問**：sensor placement 若違反 ASHRAE 62.1 breathing zone / OSHA TLV measurement / CNS 3612 室內空品、客戶後期審核會被退、需重做。

**Anchor 清單（per WebSearch + training-印象、需 Phase 0 verify clause）**：
- **ASHRAE 62.1-2022**：breathing zone 通風規範、含 sensor placement guidance（per [ASHRAE 官方 PDF](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf)、CO₂ sensor ±75 ppm @600/1000/2500 ppm 認證要求）
- **ASHRAE 55-2020**：thermal comfort、含 local thermal discomfort 量測規範（高度 0.1/0.6/1.1 m）⚠️ training-印象
- **OSHA 1910.1000 Table Z-1**：化學物質 PEL（CO₂ 5000 ppm 8-hr TWA、CO 50 ppm）⚠️ training-印象
- **ACGIH TLV 2024**：TLV-TWA 對齊（CO₂ 5000 ppm）⚠️ training-印象
- **台灣《室內空氣品質管理法》+ 室內空氣品質標準**：CO₂ 8-hr 1000 ppm、PM2.5 24-hr 35 μg/m³（per [全國法規資料庫](https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=O0130005)）✅ verified
- **CNS 3612**：中華民國國家標準、室內空品（具體 §X 編號需 WebSearch 補）⚠️ training-印象

**期望答**：客戶產業適用哪些 anchor + 客戶內部 EHS 是否有額外規範 + 是否需 third-party 驗證。

**Cross-ref**：[air-quality-system.md §1 Regulatory anchor](air-quality-system.md)（5 題 deep dive）。

### Q2.4 — Sampling vs 1:1 trade-off for high-cost sensors？

**為何問**：(a) 1:1 → 每設備獨立 ROI 可量、BOM 推 N× (b) sampling 30-50% → 場域 representative、BOM 省、但個別異常偵測差。trade-off 由客戶決定、需明示 trade-off。

**Trigger**：sensor 單顆 > NT$ 5k 時必問。

**期望答**：每物理量 sampling rate + sampling 方法學（representative vs random）+ R-24 風險對策（per research/09）。

### Q2.5 — BOM tier（S/M/L preset）by customer site size？

**為何問**：避免「客戶報價困難症」— 沒 preset 每案重議、效率差、case-by-case bias 大。

**Trigger**：Phase 0 報價產出前。

**期望答**：(a) S 小工坊（< 5000 m² × ≤ 4 設備）(b) M 典型廠房（5-15k m² × 4-10 設備）(c) L 大廠（15-30k m² × 10-20 設備）(d) XL 個案。

**Cross-ref**：[research/09 §6.1 S/M/L master table](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§6-sensor-bom-sml-preset)（Amafans EAQS verified template）。

### Q2.6 — Sensor 廠牌 / protocol locked or flexible？RS485 / SDI-12 / 0-10V / 4-20mA？

**為何問**：(a) 客戶已有 RS485 bus → 必相容 Modbus RTU、可省一條 bus (b) 客戶有 4-20mA loop → 必含 transmitter (c) 客戶用 SDI-12（環境量測常見）→ 跟工業 fieldbus 不通。

**Trigger**：Phase 0 site survey 必過。

**期望答**：(a) 客戶現有 fieldbus / wiring infrastructure (b) 開放新拉 vs 必須沿用 (c) 每物理量對應的訊號規格（4-20mA / 0-10V / RS485 / pulse / 數位）。

### Q2.7 — HVLS ROI 量測 baseline vs treated 設計？

**為何問**：HVLS / 通風 / 冷氣等 ROI 量化必有 baseline period（裝前）+ treated period（裝後）對照、沒 baseline = ROI 算不出 = value prop 量化失敗（per AP-18 基線數字沒量）。

**Trigger**：HVLS / 通風 / 冷氣 / 任何 retrofit case。

**期望答**：(a) baseline 量測期長度（推薦 ≥ 2 週）(b) baseline 量測 KPI（kWh / 體感溫度 / 員工 churn / PMV）(c) treated 期 KPI 對齊。

**Cross-ref**：[hvls-fan.md §2 Sensor integration](hvls-fan.md) + [模組 11 驗收與效益](../modules/11-acceptance-benefits-operations.md)。

### Q2.8 — Cross-site comparability — sensor SKU vary or unified？

**為何問**：多 site 客戶若 sensor SKU 不一致 → 跨 site 數據 noise variance 不同、無法 apples-to-apples 對比 → BI / 異常偵測 / benchmark 失靈。

**Trigger**：多 site 客戶。

**期望答**：(a) 全 unified SKU (b) 部分 unified（核心 SKU 統一）(c) 各 site 自選（warning）。

### Q2.9 — Cabling — wired only or wireless-allowed？

**為何問**：(a) 半導體 / 食品 cleanroom → 嚴格規範 cable type + 走線 (b) 化工 ATEX 區 → 必防爆認證 cable (c) 既有廠 retrofit → 通常 wireless 較容易 (d) wireless 受 EMI / 牆穿透限制。

**Trigger**：所有 IIoT 案。

**期望答**：(a) 客戶廠規 (b) EMI 環境（電焊 / 變頻器 / 微波）(c) 拉線可行性。

### Q2.10 — Power supply — POE / 24V DC / 220V AC / battery / solar？

**為何問**：每 sensor power 來源是現場 install 成本主因之一 — POE 省 power 線、24V DC 需 power adapter、220V 需電工。

**Trigger**：Phase 0 site survey 必過。

**期望答**：每 sensor 對應 power 規格 + 客戶現場可用 power 點位 + 是否需單獨拉電。

### Q2.11 — Tamper / safety / enclosure rating（IP65+ for outdoor / IP54 indoor）？

**為何問**：(a) 戶外 / 高粉塵 / 高濕度（食品冷藏室）→ IP65+ (b) 防爆區 → ATEX/IECEx + Ex d/e enclosure (c) tamper-evident → 高安全廠（軍工 / 半導體）防破壞。

**Trigger**：戶外 / 食品 / 化工 / 半導體 / 國防案。

**期望答**：每 sensor 對應 IP rating + 防爆認證 + tamper 規格。

### Q2.12 — Calibration schedule — annual / quarterly / 5-year（per CO₂ ASHRAE）？

**為何問**：(a) PM2.5 laser scatter 通常 1 年校正 (b) CO₂ NDIR 通常 5 年（per ASHRAE 62.1 manufacturer certification）(c) 流量計 / 溫度 RTD 通常 1 年 (d) 客戶 ISO 9001 / GMP 環境校正計畫必符。

**Trigger**：所有有 calibration 需求 sensor。

**期望答**：(a) 每 sensor calibration interval (b) 客戶內部校正計畫 (c) 我方 vs 客戶誰負責校正 (d) 校正期間 sensor downtime SLA。

**WebSearch verified**：per [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf)、CO₂ sensors 5-year manufacturer certification。

### Q2.13 — Sensor drift detection rule（alert at +X% baseline）？

**為何問**：sensor 跑 6-12 月後常 drift、若 platform 不檢測 → 客戶看 dashboard 數字錯而不自知。

**Trigger**：所有 IIoT 案、特別 ROI 量化案。

**期望答**：(a) 每 sensor drift threshold（如 ±10% baseline）(b) detection 機制（rolling baseline / 統計 anomaly / cross-sensor diff）(c) drift alert routing。

### Q2.14 — Replacement / RMA logistics？

**為何問**：(a) sensor 故障替換需現場工時 + spare inventory (b) RMA 流程（誰收件 / 誰送修 / SLA）(c) spare 庫存 — 客戶端 vs 我方倉。

**Trigger**：所有 IIoT 案、特別維護合約段。

**期望答**：(a) RMA 流程 (b) spare 庫存策略 (c) sensor 替換 mean-time（hour）(d) 替換期間 data gap 處理。

### Q2.15 — Multi-vendor sensor mix accept or single-vendor lock-in？

**為何問**：(a) multi-vendor → 議價空間大、但 integration 複雜（多 driver / 多 protocol variant）(b) single-vendor → 整合單純、但 lock-in 風險 + 議價弱 (c) 客戶可能有「不買 X 廠牌」黑名單。

**Trigger**：所有 IIoT 案、特別 BOM 議價段。

**期望答**：(a) 客戶採購策略 (b) 黑名單 (c) 是否接受 OEM rebrand（如我方拿白牌包裝）。

---

## §3 Gateway + connectivity（8 題）

### Q3.1 — Gateway 廠牌 / firmware control — vendor-locked or open？

**為何問**：(a) 我方專屬 gateway → 走 vendor lock、利潤高、但客戶無法用第三方 (b) open（如 Moxa / Advantech）→ 客戶易接受、但 platform 需支援多種 firmware (c) GoodLinker 慣例 — 限定專屬 Gateway（per Amafans EAQS 2026-05-28 會議決議）。

**Trigger**：所有 IIoT 案。

**期望答**：(a) gateway 採購來源 (b) firmware 控制權 (c) 客戶可否自行更換 gateway。

**Cross-ref**：[research/09 §6.4 Self-service vs Pro-service](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§6-sensor-bom-sml-preset)（Amafans EAQS 案 GoodLinker gateway lock-in）。

### Q3.2 — Edge compute presence — full edge / cloud-only / hybrid？

**為何問**：(a) full edge → 低 latency / 離線可跑、但 edge box 規格高、firmware 複雜 (b) cloud-only → 簡單、但離線無功能 (c) hybrid → 邊緣 buffer + cloud 主邏輯（推薦）。

**WebSearch verified**：per [Wevolver IoT Gateway 文章](https://www.wevolver.com/article/iot-gateway-architecture-edge-vs-cloud-protocol-translation-and-deployment-patterns)、現代 IIoT 預設 hybrid、邊緣負責 protocol translation + buffer、雲端負責分析 + UI。

**期望答**：每 use case 對應 edge / cloud 分工。

### Q3.3 — Connectivity redundancy — primary + fallback？

**為何問**：(a) 工廠 Wi-Fi 常 dropout → 必含 4G fallback (b) 4G 月帳費需 cap (c) 雙 ISP 對重要場域標配。

**Trigger**：所有 IIoT 案、特別 24/7 場域。

**期望答**：(a) primary connectivity (b) fallback (c) auto-failover 規則 (d) 月帳費 hard cap。

### Q3.4 — Bandwidth budget — cellular cost cap per month / per device？

**為何問**：4G/5G 流量費若不 cap、客戶 bug 跑迴圈 → 月帳炸 10× 是常見事故（per AP-12 用量上限）。

**Trigger**：用 cellular connectivity 案。

**期望答**：(a) 每 device 月流量上限（MB）(b) 超量處理（throttle / disconnect / alert）(c) 帳單拆給誰（我方 vs 客戶）。

### Q3.5 — Offline buffer — store-and-forward how long？

**為何問**：邊緣 gateway 必對網路 outage 做 store-and-forward、buffer 長度決定資料完整性 + 邊緣 disk 需求。

**WebSearch verified**：per [HiveMQ Edge 文章](https://www.hivemq.com/blog/powering-the-industrial-edge-with-mqtt/)、邊緣 buffer 是必須、但 backlog 過大需 retention 政策。

**期望答**：(a) buffer 長度（hour / day / week）(b) buffer 滿時策略（drop oldest / drop newest / pause）(c) buffer 對齊資料壓縮策略。

### Q3.6 — Local OTA update authority — vendor or customer？

**為何問**：(a) 我方主導 OTA → 集中管理、客戶不需 IT 介入、但客戶可能要求審核 (b) 客戶主導 → 客戶 IT 必有介入 / window (c) 半導體 / 政府客戶常要 OTA 審核流程（per change-control board）。

**Trigger**：所有 IIoT 案。

**期望答**：(a) OTA 流程 (b) 維運窗口（maintenance window）(c) 客戶審核流程。

### Q3.7 — Security — VPN / TLS / mTLS / certificate management？

**為何問**：(a) 工廠 OT 跟 IT 隔離（per AP-13 資安）→ 必含 IT/OT bridge 設計 (b) gateway 對雲端 default mTLS (c) cert 管理 — 自簽 / Let's Encrypt / customer CA。

**WebSearch verified**：per [Cirrus Link MQTT security](https://cirrus-link.com/securing-mqtt-best-practices-for-a-robust-iot-ecosystem/)、MQTT 必 TLS + ACL + 最小權限。

**Trigger**：所有 IIoT 案、特別資安敏感行業（半導體 / 金融 / 政府）。

**期望答**：(a) gateway-cloud encryption (b) cert 管理 (c) IT/OT 隔離設計 (d) 是否需 customer-owned CA。

**Cross-ref**：[強制檢查項 D Secure SDLC](../8-mandatory-checks/D-secure-sdlc.md) + [強制檢查項 E SBOM](../8-mandatory-checks/E-sbom-license-supply-chain.md)。

### Q3.8 — Multi-tenant isolation at gateway？

**為何問**：(a) 多客戶共用 gateway（如 PaaS） → 必含 ACL / topic namespace 隔離 (b) per-customer gateway → 隔離天然、成本高 (c) Sparkplug B 命名規範。

**Trigger**：PaaS 模式 / 共用 gateway 案。

**期望答**：(a) 多租戶模型 (b) topic naming convention (c) ACL 機制 (d) data 跨租戶禁止規則。

### Q3.9 — MQTT QoS level — 0 / 1 / 2 by use case？

**為何問**：(a) QoS 0（at most once）→ 高頻 telemetry / metric、可丟 (b) QoS 1（at least once）→ 一般 alert / command、可重複 (c) QoS 2（exactly once）→ 計費 / billing critical、不可丟也不可重 (d) QoS 越高 latency + cost 越高。

**WebSearch verified**：per [MachineCDN MQTT QoS Industrial Telemetry 2026 guide](https://machinecdn.com/blog/2026/03/03/mqtt-qos-delivery-guarantees-industrial-telemetry-guide/)、industrial telemetry 多用 QoS 0/1 mix、QoS 2 留給 critical command。

**Trigger**：MQTT-based IIoT 案。

**期望答**：每 use case 對應 QoS level + 對應 retry / dedup 邏輯。

### Q3.10 — Sparkplug B / Unified Namespace（UNS）adoption？

**為何問**：(a) Sparkplug B 是 industrial MQTT 半業界標準、含 state management + 自動 birth/death 訊息 (b) UNS（Unified Namespace、per HighByte / Walker Reynolds）→ ISA-95 + IIoT 整合架構 (c) 客戶若已有 Sparkplug / UNS → 必相容、不能另立 namespace。

**WebSearch verified**：per [FlowFuse MQTT Sparkplug B](https://flowfuse.com/blog/2024/08/using-mqtt-sparkplugb-with-node-red/) + [HighByte ISA-95 Industry 4.0](https://www.highbyte.com/blog/applying-isa-95-in-an-industry-40-world)、Sparkplug B 是 industrial UNS 通用做法。

**Trigger**：大型 / 多廠 / industrial 4.0 推進 case。

**期望答**：(a) 客戶 namespace strategy (b) Sparkplug B 採用 (c) UNS 架構對齊。

---

## §4 Data integration / governance（7 題）

### Q4.1 — Data ingestion topic naming convention？

**為何問**：MQTT topic / DDB partition key / RDS table prefix 命名亂 → 後期重構 painful、跨 system join 對不上。

**Reference 命名**：
- GoodLinker shadow.config / thingName（per CLAUDE.md「thingName 是 canonical IoT identifier」）
- Amafans EAQS 點位 metadata（per research/09 §7.2）— Slave addr × sensor type × placement category
- Sparkplug B：`spBv1.0/{group}/{message_type}/{edge_node}/{device}`

**期望答**：(a) topic / table naming convention (b) canonical identifier (c) 跨系統 join key。

### Q4.2 — Real-time vs batch ingest split？

**為何問**：(a) real-time（< 1s）→ 高 ingestion cost (b) near-real-time（1-60s）→ 通用 (c) batch（hour / day）→ 低成本、適合 ESG 報告 / 月報。

**Trigger**：所有 IIoT 案。

**期望答**：每 use case 對應 ingest tier + 對應 storage tier。

### Q4.3 — Time-series DB retention policy by tier？

**為何問**：(a) raw 1-second tier 保留 30-90 day（高 cost）(b) 分鐘 / 小時 aggregate 保留 1-3 年 (c) 月 aggregate 保留 5-10 年 (d) 客戶若需 audit 必含 immutable archive。

**Trigger**：所有 IIoT 案、特別 ESG / 醫療 / 金融。

**期望答**：(a) tier 設計 (b) downsample 規則 (c) cold storage（S3 Glacier / Azure Archive）。

### Q4.4 — Data export — client-facing API / data lake / CSV / BI 連接？

**為何問**：(a) 客戶要自行做 BI → 必含 read-only API / S3 export (b) 客戶要 Power BI / Tableau → 必含 ODBC / DirectQuery (c) 客戶要原始資料當 audit → 必含 raw export。

**Trigger**：所有 IIoT 案。

**期望答**：(a) export 介面 (b) 頻率 (c) format (d) 客戶端誰使用。

### Q4.5 — Tenant isolation — DB / row-level / column-level？

**為何問**：(a) DB 隔離 → 最強、成本最高 (b) row-level（per tenant_id）→ 通用 (c) column-level（共享 row、不同欄位給不同租戶）→ 罕見、複雜。

**WebSearch verified**：per [SaaS partnership / SaaS reseller 文章](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/)、SaaS 必含 multi-tenant 隔離設計。

**Trigger**：PaaS / SaaS 模式。

**期望答**：(a) 隔離方式 (b) 跨租戶聚合需求（如平台 benchmark）(c) 跨租戶禁止場景。

### Q4.6 — Data ownership at termination — 客戶不續約資料怎麼帶走？

**為何問**：強制檢查項 G 退出機制 / AP-22 退出機制不清 → 客戶法務必問、答不出來不簽約。

**Trigger**：所有 IIoT 案、合約段必填。

**期望答**：(a) 終止 30 day grace period (b) 客戶 export format（CSV / Parquet / SQL dump）(c) 我方刪除 SLA + 證明 (d) 已脫敏 aggregate 保留權。

**Cross-ref**：[強制檢查項 G 退出機制](../8-mandatory-checks/G-exit-plan.md) + [anti-patterns.md AP-22](../anti-patterns.md#ap-22)。

### Q4.7 — Cross-region replication SLA — primary down 多久 failover？

**為何問**：(a) DR 演練是強制檢查項 F (b) 客戶若要 99.99% SLA → 必含跨 region 雙活 (c) 跨 region 復本費用 + latency 需要 ROI 評估。

**Trigger**：高 SLA 案、跨國案、政府 / 金融關聯案。

**期望答**：(a) RTO / RPO (b) primary region (c) DR region (d) failover 觸發條件 (e) 演練頻率。

**Cross-ref**：[強制檢查項 F RTO/RPO/回滾](../8-mandatory-checks/F-rto-rpo-rollback.md)。

---

## §5 NFR / SLA / reliability（5 題）

### Q5.1 — Uptime SLA per tier？RTO / RPO？

**為何問**：避免 AP-07 NFR 全部不寫 / 全部寫超嚴、AP-19 RTO 寫 5min 但實際 8hr。

**Trigger**：所有 IIoT 案、商務段必填。

**期望答**：(a) 99.5% / 99.9% / 99.95% / 99.99% 哪一級 (b) per tier 對應 RTO / RPO (c) 違約金條款 (d) 是否已演練過（per AP-19）。

**Cross-ref**：[模組 08 NFR](../modules/08-architecture-functional-nfr.md) + [強制檢查項 F RTO/RPO](../8-mandatory-checks/F-rto-rpo-rollback.md)。

### Q5.2 — DR drill cadence — 演練頻率？

**為何問**：未演練的 DR plan = paper plan、不可信、客戶法務會問。

**Trigger**：所有合約 RTO < 4hr 案。

**期望答**：(a) 演練頻率（quarterly / semi-annual / annual）(b) tabletop vs full-scale (c) 演練報告交付。

### Q5.3 — Performance — concurrent device / query latency budget？

**為何問**：(a) 容量規劃（per [模組 08](../modules/08-architecture-functional-nfr.md)）(b) Load test 必過 (c) 客戶若預期擴展 → 容量規劃要含未來 3 年。

**Trigger**：所有 IIoT 案。

**期望答**：(a) peak concurrent device (b) query latency budget by tier (c) 擴展計畫。

### Q5.4 — Disaster scenario — 整廠斷網 / sensor 失效 / gateway 死 / cloud region down？

**為何問**：scenario-driven NFR 比 SLA 數字更具體 — 客戶法務能對應到具體 case 寫合約條款。

**Trigger**：所有 IIoT 案、合約段。

**期望答**：每 scenario 對應的 degraded behavior + 復原策略 + 客戶端責任。

### Q5.5 — Penalty / liability cap for SLA breach？

**為何問**：(a) 沒 cap → 我方無限責任、保險 risk (b) 太低 → 客戶不接受 (c) 客戶若是上市櫃 → 通常要求 SLA 違約金 ≥ 月費 1-3× cap at annual fee。

**Trigger**：所有 IIoT 案、合約段。

**期望答**：(a) SLA breach 賠償 formula (b) liability cap (c) 保險覆蓋。

**Cross-ref**：[模組 10 商務報價](../modules/10-procurement-pricing.md) + [b2b2b-channel-partnership.md §3 Legal / liability split](b2b2b-channel-partnership.md)（若聯名案）。

### Q5.6 — Cybersecurity incident response — IT/OT 攻擊面 detect + isolate SOP？

**為何問**：(a) OT 越往下越關鍵、被駭可能停產 / 安全事故（per [manufacturing.md IT/OT 分離](manufacturing.md)）(b) detect / isolate / recover SOP 必含 (c) 客戶 ISMS / TISAX / 半導體園區資安 都要求事件回應流程。

**Trigger**：所有 IIoT 案、特別資安敏感行業。

**期望答**：(a) detect 機制 (b) isolate（如自動切 OT 跟雲端 link）(c) recover SOP (d) customer notification SLA (e) post-mortem 流程。

**Cross-ref**：[強制檢查項 D Secure SDLC](../8-mandatory-checks/D-secure-sdlc.md) + [methodologies/mlops-and-ai-governance.md](../methodologies/mlops-and-ai-governance.md)。

### Q5.7 — Capacity planning — 3-year device count growth + cost projection？

**為何問**：(a) 客戶 pilot stage 100 device → enterprise stage 5000 device、容量規劃必含 (b) cloud cost projection（ingestion / storage / compute）— 用 hard cap 避免帳單爆炸（per AP-12）(c) hardware refresh cycle（sensor 通常 3-5 年壽命）。

**Trigger**：scale / enterprise stage 案。

**期望答**：(a) 3 年 device count growth projection (b) cloud cost cap (c) hardware refresh cycle (d) 容量擴增觸發條件。

**Cross-ref**：[模組 09 方案分階段](../modules/09-solution-options-phased-rollout.md) + [anti-patterns.md AP-12 用量上限沒設](../anti-patterns.md#ap-12)。

### Q5.8 — Audit logging — 操作 log / 資料 access log / 變更 log retention？

**為何問**：(a) ISO 27001 / SOC 2 / GMP / FDA 21 CFR Part 11 都要求 audit log (b) admin 操作 / 客戶 data access / 配置變更 都要 log (c) log retention 通常 ≥ 1 年 + immutable (d) 客戶法務 / 稽核 必問 audit trail 完整度。

**Trigger**：所有 IIoT 案、合規 case 必填。

**期望答**：(a) audit log 範圍 (b) retention period (c) immutable 機制（WORM / blockchain hash chain）(d) 客戶 access audit log 介面 (e) tamper detection。

**Cross-ref**：[README.md §4 稽核留痕與不可竄改](README.md) + [強制檢查項 D Secure SDLC](../8-mandatory-checks/D-secure-sdlc.md)。

---

## §6 Trigger conditions table — 每題何時 critical

| 題號 | Critical 觸發條件 | 不 critical 條件 |
|---|---|---|
| Q1.1-1.3 | 所有 IIoT 案、Phase 0 必填 | — |
| Q1.4 | 廠房 Wi-Fi 不穩 / 4G fallback / 流量費敏感 | 已有穩定 LAN |
| Q1.5 | 跨國 / 中國境內 / 政府 / 半導體 | 純台灣 / 一般製造 |
| Q1.6 | remote-only / 高機密廠 | 本地團隊充足 |
| Q1.7 | ERP / MES / SCADA 已有 | greenfield、無既有系統 |
| Q1.8 | 客戶有 PI Historian / 自建 BI | greenfield |
| Q1.9 | enterprise / 多廠 case | 純 pilot |
| Q1.10 | 半導體 / 食品 / 製藥 / 化工 | 一般製造、低監管 |
| Q2.1-2.5 | 所有 IIoT 案（核心 sensor scheme）| — |
| Q2.6-2.10 | 既有 wiring / 防爆區 / 戶外 | 純 indoor / greenfield |
| Q2.11-2.15 | 多 site / 合約段 / 維護段 | 純 1 廠 pilot |
| Q3.1-3.3 | 所有 IIoT 案 | — |
| Q3.4 | cellular 案 | 純 LAN |
| Q3.5-3.6 | 24/7 場域 / OTA 需求 | 低 criticality pilot |
| Q3.7-3.8 | 資安敏感 / PaaS / 多租戶 | 單客戶 dedicated |
| Q3.9-3.10 | MQTT / industrial UNS case | 純 HTTP / proprietary protocol |
| Q4.1-4.4 | 所有 IIoT 案 | — |
| Q4.5 | PaaS / SaaS 模式 | 單客戶 dedicated |
| Q4.6 | 所有 IIoT 案、合約段必填（per G 退出）| — |
| Q4.7 | 高 SLA / 跨國 / 政府 / 金融 | 低 SLA pilot |
| Q5.1-5.2 | 所有 IIoT 案、合約段 | — |
| Q5.3 | 高 throughput 案 | 低 throughput pilot |
| Q5.4-5.5 | 上市櫃 / 政府 / 金融客戶 | 一般中小企業 |
| Q5.6 | 資安敏感行業 | low criticality pilot |
| Q5.7 | scale / enterprise stage | pilot stage |
| Q5.8 | 合規 case（ISO 27001 / SOC 2 / GMP / FDA）| 低監管 pilot |

---

## §7 Concrete dogfood references

### 7.1 Amafans EAQS 案（2026-05-28 ~ 2026-05-29）— 本檔催生案

**Why dogfood**：本檔 §2 sensor scheme deep-dive 15 題的 case-in-point。Amafans EAQS 案 5+ session 才挖出「1 fan 1 set vs 1 site 1 set」是 binary 偽選擇、實際 mixed strategy。

**Concrete output**：
- [research/09-sensor-placement-consultancy.md](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md)（605 lines、解 A.18-A.21）
- [pending-items-tracker.md A.IV section](../../examples/amafans-eaqs/pending-items-tracker.md)（A.18-A.21）
- 3 新風險 R-22 / R-23 / R-24（per research/09 §8）
- 4 段 RFP V0.7 drop-in clause（per research/09 §7）

**本檔 Q2.1-2.15 對應 Amafans EAQS 出現的問題**：

| 本檔題號 | Amafans EAQS 對應 |
|---|---|
| Q2.1 物理量分類 | 4 layer（ambient grid / 雙軌溫濕度 / fan-near 風速 / power scope）|
| Q2.2 sensor density | 每 5000 m² 3-4 PM 點 ⚠️ |
| Q2.3 法規 anchor | ASHRAE 62.1 + 55 + CNS 3612 + OSHA + ACGIH + 台電契約用電辦法 |
| Q2.4 sampling | 風速 1:1 vs 抽樣 30-50%（A.20 商業選）|
| Q2.5 S/M/L preset | S=8-12 / M=18-26 / L=35-50 sensor |
| Q2.7 HVLS ROI baseline | 體感降 3-6°C 需 fan-local T vs ambient T 對比 |

**Why session 5+ 才挖出**：framework 沒 Day-1 question bank、framework 預設 generic「問題定義」過於抽象、無法引導具體問「sensor 放哪」。

**本檔修正**：把 Amafans EAQS retrospective 15 個 sensor 問題標準化、下案 Day 1 必過。

### 7.2 祥圃 MES proposal（2026-05-27）— SAP ERP 假設踩雷

**Why dogfood**：本檔 Q1.7「客戶 ERP 已有否」對應 case。祥圃案 proposal 寫成「我們從 0 蓋」、實際客戶有 SAP ERP、整 framing 過時。

**本檔修正**：Q1.7 必填、用 WebSearch 查客戶官網 + Salesforce 案例 + SAP 案例庫驗證。

**Cross-ref**：[anti-patterns.md AP-NEW-WRITE-1](../anti-patterns.md#ap-new-write-1)。

### 7.3 GoodLinker × Goodlinker 內部既有專案

**Why dogfood**：本檔 Q3.1 gateway lock-in 設計 (GoodLinker 限定專屬 Gateway 慣例)、Q4.1 thingName canonical identifier、Q4.6 客戶資料退出機制、Q5.1 SLA tier — 全屬 GoodLinker 既有 production 累積 know-how。

**Cross-ref**：CLAUDE.md「Goodlinker 工作慣例」段落。

---

## §8 Anti-pattern callouts

對應本檔的 anti-pattern（per [anti-patterns.md](../anti-patterns.md)）：

| 本檔段 | 對應 anti-pattern | 教訓 |
|---|---|---|
| §1.1 多 site / 客戶現況 | AP-NEW-WRITE-1 SAP ERP 假設踩雷 | 接案前 30 分鐘必 WebSearch |
| §1.5 資料主權 / region | AP-NEW-ANTI-HALLUC-1 Temporal attribution drift | 「沿用既有」vs「today 真決議」phrasing 必區分 |
| §2 sensor scheme | （無 AP、本檔是首次標準化）| Day 1 必過 15 題 |
| §3.7 資安 | AP-13「我們有資安」沒細節 | 每階段必含具體做法 |
| §3.4 用量上限 | AP-12 用量上限沒設 | cellular 流量必 cap |
| §4.6 退出機制 | AP-22 退出機制不清 | 退出條款是讓客戶敢簽 |
| §5.1 SLA | AP-07 NFR 全寫超嚴 + AP-19 RTO 寫 5min 實際 8hr | NFR 數字必演練過 |
| §5.5 liability cap | AP-09 整套報一個價 | 商務分項 + 責任 cap |

---

## §9 Cross-ref — 對應 13 模組 / 9 強制檢查 / 其他 addon / methodologies

### 9.1 對應 13 模組

| 本檔段 | 對應模組 |
|---|---|
| §1 Pre-flight | [01 產業](../modules/01-industry-market.md) + [03 問題](../modules/03-problem-business-goals.md) |
| §2 Sensor scheme | [08 架構 NFR](../modules/08-architecture-functional-nfr.md) + [13 系統設計 MVP](../modules/13-system-design-mvp.md) |
| §3 Gateway / connectivity | [06 資料治理](../modules/06-data-integration-governance.md) + [08 架構](../modules/08-architecture-functional-nfr.md) |
| §4 Data governance | [06 資料治理](../modules/06-data-integration-governance.md) + [07 合規](../modules/07-compliance-security-ai-risk.md) |
| §5 NFR / SLA | [08 架構 NFR](../modules/08-architecture-functional-nfr.md) + [11 驗收維運](../modules/11-acceptance-benefits-operations.md) |

### 9.2 對應 9 強制檢查

| 本檔段 | 強制檢查 |
|---|---|
| §3.7 資安 | [D Secure SDLC](../8-mandatory-checks/D-secure-sdlc.md) + [E SBOM](../8-mandatory-checks/E-sbom-license-supply-chain.md) |
| §4.6 退出 | [G 退出機制](../8-mandatory-checks/G-exit-plan.md) |
| §5.1-5.4 NFR/SLA | [F RTO/RPO/回滾](../8-mandatory-checks/F-rto-rpo-rollback.md) |
| §1 + §2 all | [A RTM](../8-mandatory-checks/A-rtm.md) + [H 證據包](../8-mandatory-checks/H-evidence-pack.md) |

### 9.3 對應其他 addon

| 本檔段 | 相關 addon |
|---|---|
| §2.1-2.5 sensor scheme | [hvls-fan.md](hvls-fan.md)（fan-specific）+ [air-quality-system.md](air-quality-system.md)（空品）|
| §3 gateway / multi-tenant | [b2b2b-channel-partnership.md](b2b2b-channel-partnership.md)（聯名 case）|
| 跨段 | [manufacturing.md](manufacturing.md)（IT/OT 分離 / 工業環境）|

### 9.4 對應 methodologies

- [multi-tool-verification.md](../methodologies/multi-tool-verification.md) — sensor 量測 claim 必交叉多 layer
- [c4-model.md](../methodologies/c4-model.md) — gateway / edge / cloud 架構分層
- [mlops-and-ai-governance.md](../methodologies/mlops-and-ai-governance.md) — sensor drift detection / anomaly model

---

## §10 結論 — 50 題 Day-1 question bank 落實

### 10.1 本檔解決什麼

1. **Amafans EAQS retrospective 翻車** — 「sensor 放哪」第 5 session 才挖出 → 本檔 §2 15 題 Day 1 過
2. **下個 IIoT 案 Day 1 efficiency** — 50 題 checklist、Phase 0 接案 24 hr 內過、不再 case-by-case 自摸
3. **跨案 know-how 累積** — Amafans EAQS / 祥圃 MES / GoodLinker 內部既有 → 標準化進 framework

### 10.2 用法 SOP

| 階段 | 動作 | 時長 |
|---|---|---|
| 接案 24 hr 內 | §1 過 10 題（用 WebSearch + 短訪）| 30 min |
| Phase 0 site survey 前 | §2 sensor scheme + §3 gateway（23 題）| 2 hr 訪 |
| Phase 1 第 1-2 次訪談 | §4 data + §5 NFR（12 題）| 訪談中 |
| Phase 2 模組 fill | §6 trigger 表回查、§7 dogfood 參考 | 持續 |
| Phase 6 反方審查 | 本檔當 checklist 自查 | 1 hr |

### 10.3 累積機制

每案結束 retrospective、本檔 §7 dogfood section append、新 anti-pattern append 進 anti-patterns.md、新 question 補進本檔（Phase 7 ProposalOS skill 收尾流程）。

---

**作者**：ProposalOS framework upgrade（per Amafans EAQS 2026-05-29 retro）
**版本**：v0.1 draft、2026-05-29
**Cite source（≥ 5 verified）**：
1. [ASHRAE 62.1-2022 Addendum ab PDF](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf) — CO₂ sensor placement / breathing zone
2. [HiveMQ Industrial Edge MQTT](https://www.hivemq.com/blog/powering-the-industrial-edge-with-mqtt/) — store-and-forward / TLS
3. [Wevolver IoT Gateway Architecture](https://www.wevolver.com/article/iot-gateway-architecture-edge-vs-cloud-protocol-translation-and-deployment-patterns) — edge vs cloud
4. [HighByte ISA-95 Industry 4.0](https://www.highbyte.com/blog/applying-isa-95-in-an-industry-40-world) — ISA-95 / Purdue / UNS
5. [Cirrus Link MQTT security](https://cirrus-link.com/securing-mqtt-best-practices-for-a-robust-iot-ecosystem/) — MQTT TLS / ACL
6. [台灣《室內空氣品質標準》全國法規](https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=O0130005) — CO₂ 1000 ppm / PM2.5 35 μg/m³
7. [Kaiterra ASHRAE 62.1 DCV](https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv) — DCV / sensor cert
8. [MachineCDN MQTT QoS Industrial Telemetry 2026 guide](https://machinecdn.com/blog/2026/03/03/mqtt-qos-delivery-guarantees-industrial-telemetry-guide/) — QoS 0/1/2 by use case
9. [FlowFuse MQTT Sparkplug B](https://flowfuse.com/blog/2024/08/using-mqtt-sparkplugb-with-node-red/) — Sparkplug B industrial UNS

**驗證狀態**：9 個 verified URL + 6 個 ⚠️ training-data hedged claim category（ASHRAE clause 編號 / OSHA Z-1 / ACGIH TLV / CNS 3612 / 業界 rule of thumb sensor density / 業界 sampling rate）。
