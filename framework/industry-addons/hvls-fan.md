# 產業加掛｜HVLS Fan（高容積低轉速工業風扇）

> **Meta-framework upgrade**：本檔為 ProposalOS framework Day-1 consultant-question bank for HVLS fan deployment 案 — Amafans × GoodLinker EAQS 聯名案 dogfood 衍生。HVLS 跟通用 IIoT 有 overlap（共用 sensor / gateway / data 層），但 fan domain 有特殊問題（fan-local sensor 放哪 / HVLS ROI baseline / 多 fan 互相影響 / 聯名 split）— 本檔列 30 個 fan-specific 必問問題。
>
> **Scope**：HVLS / 高容積低轉速工業風扇 deployment 案、含 retrofit（既有廠加裝）+ greenfield（新建廠合建）。**B2B-only**、典型聯名 / OEM-PaaS 模式（如 Amafans × GoodLinker、Big Ass Fans × X、MacroAir × Y）。
>
> **使用方式**：跟 [iiot-deployment.md](iiot-deployment.md) 同 trigger — 接到 HVLS / 工業風扇 keyword 後啟用、做 fan-specific 補強（本檔不 duplicate IIoT 通用問題）。
>
> **Verification status**：HVLS ROI 數字（體感降 X°C / kWh 省 N%）多為廠商 marketing claim ⚠️ training-印象、需 customer baseline 量測 verify。Big Ass Fans / MacroAir / Hunter Industrial 安裝指南 verified。
>
> **Last updated**：2026-05-29（initial draft v0.1）。

---

## §0 Scope — 何時觸發本 addon

### 0.1 Trigger keyword

| 中文 keyword | 英文 keyword |
|---|---|
| HVLS / 高容積低轉速 | HVLS / high volume low speed |
| 工業風扇 / 大型風扇 | industrial fan / ceiling fan |
| Big Ass Fan / Hunter Industrial / MacroAir / Magnovent | — |
| Amafans / 國際精工（台灣 OEM） | — |
| 廠房通風 / 體感降溫 / PMV / 工人舒適度 | factory ventilation / thermal comfort |
| 風扇 retrofit / 通風改善 | fan retrofit / ventilation upgrade |

### 0.2 何時 NOT 用本檔

- 一般 HVAC（冷氣 / 暖通）→ 用 `manufacturing.md` + ASHRAE 55 addons
- 散熱風扇 / 排氣風扇（局部、非空間性）→ 不適用
- 純消費型風扇（家用）→ B2C、ProposalOS 不適用

### 0.3 觸發後產出時機

| Phase | 對應段 |
|---|---|
| Phase 0 接案 24 hr | §1 fan technology + ROI（10 題）|
| Phase 0 site survey | §2 Sensor integration（10 題、bridge to IIoT addon §2）|
| Phase 1 訪談 | §3 Customer onboarding（5 題）|
| Phase 2-4 商務 / 聯名 | §4 Joint partnership with HVLS OEM（5 題）|

### 0.4 跟 iiot-deployment.md 的關係

| 議題 | 在 iiot-deployment.md | 在本檔 |
|---|---|---|
| Sensor scheme 4-layer 分類 | ✅ §2.1 通用版 | ✅ §2 fan-specific（fan-local + baseline）|
| Gateway / connectivity | ✅ §3 | — |
| Data governance | ✅ §4 | — |
| SLA / NFR | ✅ §5 | — |
| **Fan technology + ROI** | ❌（不通用）| ✅ §1 |
| **Customer onboarding for fan** | ❌ | ✅ §3 |
| **聯名 partnership split** | ❌ | ✅ §4（cross-ref b2b2b-channel-partnership.md）|

---

## §1 Fan technology + ROI（10 題）

### Q1.1 — Fan blade material / diameter / RPM range / 適用樓高？

**為何問**：(a) 大直徑（6-7 m）低 RPM（60-80 RPM）= HVLS、適合工廠 (b) 小直徑高 RPM = 一般工業風扇、不同物理 (c) blade material（鋁合金 / 碳纖維 / 複合）影響重量 + 慣性 + 耐久 (d) 樓高 < 4 m → HVLS 不適用、需 HVHS 或 destratification fan。

**Trigger**：所有 HVLS 案。

**期望答**：(a) 廠房樓高 + clear height（per Big Ass Fans 安裝規範、I-beam 底需 ≥ 65" 即 165 cm 淨空、per [installation guide](https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf)）(b) blade 規格 + RPM 範圍 (c) 客戶廠房既有遮蔽（lights / sprinklers / cable tray、影響 placement）。

**WebSearch verified**：per [Big Ass Fans Yellow Jacket installation guide](https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf)、I-beam 底 clearance ≥ 65 in、需符合 NEC / ANSI/NFPA 70 + local code、each fan 需 dedicated branch circuit。

### Q1.2 — Thrust / coverage area per fan？

**為何問**：(a) coverage（典型 HVLS 7m fan 覆蓋 ~900-1200 m²）⚠️ training-印象 (b) 廠房面積 / coverage = 風扇數量 (c) 過 dense → 風相互干擾（per Q2.7）、過 sparse → 死角。

**Trigger**：fan 數量計算前。

**期望答**：fan 廠商提供的 coverage spec + 廠房 layout 圖（含柱距 / 障礙 / 高度變化）。

### Q1.3 — HVLS vs HVHS（high vol high speed）/ destratification fan 之 trade-off？

**為何問**：客戶若樓高 < 4 m / 空間小 / 需要 spot cooling → HVLS 不是最優、需 HVHS。

**Trigger**：Phase 0 樓高評估。

**期望答**：客戶場域屬性 + 推薦 fan type matrix。

### Q1.4 — 能耗 per fan — kW typical / variable speed range？

**為何問**：(a) HVLS 通常 0.5-1.5 kW @ full speed (b) variable speed → 部分負載省電 (c) 能耗 × 運轉時數 × 電費 = 月成本、是節能 ROI 的分母。

**Trigger**：所有 HVLS 案、ROI 計算。

**期望答**：(a) fan power spec (b) 預期運轉時數 (c) 客戶當下廠電費單價（台電工業）+ contract tier (d) 是否走 VFD variable speed。

### Q1.5 — HVLS ROI 量測 baseline — 體感溫度 / kWh / PMV / 員工 churn？

**為何問**：避免 AP-18「基線數字沒量」。HVLS value prop（體感降 3-6°C / kWh 省 N%）必有 baseline period（裝前）+ treated period（裝後）對照、否則 ROI 算不出。

**WebSearch verified**：per [Hunter Industrial HVLS installation guide](https://industrialfans.hunterfan.com/blogs/hunter-industrial-blog/how-to-install-an-hvls-ceiling-fan-industrial-fan-installation-guide)、HVLS 設計目的是改善大空間 thermal comfort + 通風 + 員工生產力、非直接製冷。

**Trigger**：所有 HVLS 案、ROI 量化必填。

**期望答**：
- (a) Baseline 量測期長度（推薦 ≥ 2 週 / season-matched）
- (b) Baseline 量測 KPI（場域 T_amb / 體感 T_per / 風速 / kWh / 員工 PMV satisfaction 問卷 / 員工 churn）
- (c) Treated 期 KPI 對齊
- (d) baseline 期客戶端是否願意 collect（人時 + 配合度）

**Cross-ref**：[iiot-deployment.md §2 Q2.7](iiot-deployment.md) + [research/03 §1（Amafans EAQS）](../../examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md)。

### Q1.6 — 客戶既有 HVAC 互動 — replace / supplement / hybrid？

**為何問**：(a) HVLS replace 冷氣 → 大幅省電、但只在熱舒適區內有效、寒冷地不適 (b) HVLS supplement 冷氣 → 冷氣可調高 set point 2-3°C 仍維持舒適、典型 ROI 來源 (c) hybrid → HVLS 大空間 + spot 冷氣局部。

**Trigger**：客戶有冷氣 case。

**期望答**：(a) 既有 HVAC 規格 (b) HVAC set point 調整 willingness (c) 替代 / 補強 / hybrid 策略 (d) HVAC 能耗 baseline。

### Q1.7 — 廠房高度 / 樓板 / 鐵皮屋頂 影響 fan placement？

**為何問**：(a) I-beam 鋼結構廠 → HVLS 安裝最容易、yoke 直接鎖 (b) 鐵皮屋頂 → 需評估結構強度（HVLS fan 5-7 m 整組重量 50-150 kg + 動載荷）(c) 樑距太密 → fan 數量限制 (d) 中層樓板（如多層工廠）→ HVLS 不適用、改 HVHS。

**WebSearch verified**：per [Big Ass Fans Yellow Jacket installation guide](https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf)、I-beam mounting 必確保 fan plumb to ground + yoke 用最寬 bolt hole。

**Trigger**：Phase 0 site survey。

**期望答**：(a) 廠房結構類型 (b) 樑 / 柱距 (c) 屋頂材質 + 載重評估 (d) 是否需結構工程師簽證（高樓 / 公共建築常需）。

### Q1.8 — 風扇本體故障率 / MTBF / 保固期？

**為何問**：fan 是 24/7 高磨損設備（馬達 / 軸承 / blade balance）— MTBF 是客戶法務必問、保固 + RMA 流程必含。

**Trigger**：所有 HVLS 案、合約段。

**期望答**：(a) MTBF spec (b) 保固期（典型 1-3 年硬體 + 馬達單獨 5-10 年）(c) 故障率 + 維修 SLA (d) 保固外 RMA 計費。

### Q1.9 — 保固 / 維護合約結構 — annual / on-demand / 包年？

**為何問**：(a) annual contract → 預收、客戶 budget 好估、但 maintenance 工時不必跑滿 (b) on-demand → 客戶覺得便宜、但事故時排程慢 (c) 包年 包括 spare + 工時 → 客戶最省心、報價高。

**Trigger**：所有 HVLS 案、商務段。

**期望答**：(a) 客戶 preference (b) 競品標準 (c) 維護工時實際需求（推算）。

### Q1.10 — Fan firmware / controller OTA channel？

**為何問**：(a) modern HVLS 含 controller / IoT 介面 (b) firmware bug fix 需 OTA (c) 客戶 IT 可能限制 OTA window (d) 跟 [iiot-deployment.md Q3.6](iiot-deployment.md) 對齊。

**Trigger**：智能化 HVLS / 含 IoT controller 案。

**期望答**：OTA 流程 + 客戶端 IT 介入點。

---

## §2 Sensor integration with fan（10 題、bridge to IIoT addon）

**Why**：HVLS ROI 量測 + 工安門檻 + 訂閱 narrative 全靠 sensor scheme 對。Amafans EAQS 案 5 session 才挖出「1 fan 1 set vs 1 site 1 set」是 binary 偽選擇。本檔讓下案 Day 1 過。

### Q2.1 — Fan-local sensor vs site-level sensor — mixed strategy？

**為何問**：per [research/09 sensor placement](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md) — 不同物理量空間特性不同、強行單一 scheme 必某維度測不準。

**Trigger**：所有 HVLS 案、ROI 量化案。

**期望答**：
- **Ambient bulk**（PM2.5 / CO₂ / 場域溫濕度）→ 場域 grid、避 fan downwash
- **Fan-local delta**（溫濕度 fan 下 / 風速 fan 下）→ fan 正下方 1.5-2 m
- **Power**（風扇分路 + 總電表）→ per CR-002.a A/B/C

**Cross-ref**：[iiot-deployment.md §2 Q2.1-2.5](iiot-deployment.md)。

### Q2.2 — 風速 sampled 還是 1:1（per fan）？

**為何問**：(a) 1:1 → 每 fan ROI 獨立量、BOM N× (b) 抽樣 30-50% → 場域 representative、BOM 省、但個別 fan ROI 不可量 (c) 客戶若內部 PDCA / 異常偵測需 per-fan → 必 1:1。

**Trigger**：所有 HVLS 案。

**期望答**：(a) 客戶 ROI 量化粒度 (b) BOM 預算 (c) R-24 風險對策（抽樣 SOP）。

**Cross-ref**：[research/09 §8.3 R-24 抽樣方法學](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§8-risk-register-additions)。

### Q2.3 — 溫差量測 — 場域 ambient vs fan-local delta？

**為何問**：HVLS value prop 量化必有 **fan-local T_fan vs ambient T_amb 對照** — 沒 fan-near 溫度就無法證實 ROI、只 fan-near 又喪失 baseline reference。

**Trigger**：所有 HVLS ROI 案。

**期望答**：(a) 雙軌 scheme（fan-local + ambient 各 1 點） (b) 高度規範（per ASHRAE 55 §5.3 local thermal discomfort 0.1/0.6/1.1 m）⚠️ training-印象 (c) 抽樣 fan ratio。

### Q2.4 — PM2.5 / CO₂ — 不放 fan 上（per ASHRAE 62.1 breathing zone）？

**為何問**：(a) PM2.5 laser scatter 對高速氣流敏感、放 fan 下方反而 noise + 不在 breathing zone (b) CO₂ 沒有點源 / 點 sink、bulk 屬性、grid 配置即可 (c) 違反 ASHRAE 62.1 breathing zone 規範 → 後期客戶 IAQ audit 退。

**WebSearch verified**：per [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf)、sensor placement 應 validated to accurately represent breathing zone conditions、不是 fixed location prescription。

**Trigger**：所有 HVLS + 空品案。

**期望答**：(a) PM2.5 / CO₂ 場域 grid 規範 (b) 避開 fan downwash 規則 (c) Phase 0 site survey 對位驗證。

### Q2.5 — 工安門檻 alert routing — site-level or per-fan？

**為何問**：(a) 場域 PM 超標 → 通知場域管理員（site-level）(b) fan-local 風速異常 → 通知 fan 維修窗口（per fan）+ 場域 (c) routing 規則直接影響告警 SOP / 客戶端責任歸屬。

**Trigger**：所有有工安門檻案。

**期望答**：每 alert type 對應 routing rule + 雙方責任歸屬。

**Cross-ref**：[research/09 §7.4 §6.0.5 告警路由](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§7-rfp-v07-spec-impact) + [air-quality-system.md §3 Alert routing](air-quality-system.md)。

### Q2.6 — HVLS ROI 量測 baseline period 長度？

**為何問**：baseline 太短（< 1 週）→ noise 大、ROI 信度低；太長（> 1 月）→ 客戶等不及。最佳 2-4 週 season-matched。

**Trigger**：所有 HVLS 量化案。

**期望答**：(a) baseline 期長度 (b) baseline 期客戶端配合度 (c) season variability 處理（如 baseline 5 月、treated 8 月、需季節調整）。

### Q2.7 — 多 fan 互相影響 — 近距風扇 throughput 重疊？

**為何問**：(a) 兩 fan 距離 < 1.5× diameter → 風場互疊、影響量測 (b) 抽樣 fan 選擇必避「被相鄰 fan 影響」point (c) representative fan 定義必含此 constraint。

**Trigger**：fan 密度高的 case。

**期望答**：(a) fan 間距 (b) sampling fan 選擇 SOP (c) 風場互擾邊界。

### Q2.8 — Fan running 狀態如何 detect — RPM + 電流 + 直接 fault state？

**為何問**：(a) fan offline / fault 必 detect、否則 ROI 量測會錯歸因 (b) RPM 0 → fan 停 (c) 電流 0 → power 切 (d) controller fault state → 廠商 SDK 提供。

**Trigger**：所有智能化 HVLS 案。

**期望答**：(a) detect 機制 (b) controller SDK 介面 (c) 異常 fan data 自動標記。

### Q2.9 — Maintenance work-order trigger conditions？

**為何問**：(a) MTBF baseline 設定 → 預知保養 (b) RPM drift / 電流 異常 → 預警 (c) blade balance issue → 振動 sensor (d) work order 自動觸發或人工。

**Trigger**：有維護合約案。

**期望答**：(a) trigger condition list (b) work order 平台介接（客戶 CMMS / 我方 platform）(c) SLA 對應。

### Q2.10 — Sensor 故障 → fan 停 fail-safe rule？

**為何問**：(a) 通常 sensor 故障不 trigger fan 停（避免誤停 → 員工抱怨）(b) 但工安 sensor（CO 中毒 / 爆炸氣體）故障 → 必停（fail-safe）(c) 雙方責任歸屬。

**Trigger**：高安全場域（化工 / 食品 / 防爆區）。

**期望答**：(a) fail-safe rule per sensor type (b) 雙方責任 (c) 客戶 EHS 規範對齊。

---

## §3 Customer onboarding for HVLS（5 題）

### Q3.1 — Site survey for fan placement — 高度 / 障礙 / 區域劃分？

**為何問**：HVLS 安裝有 strict structural + clearance 規範、不做 site survey 直接報價必踩雷。

**WebSearch verified**：per [Big Ass Fans installation requirements](https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf)、site survey 必確認 fan 安裝區無 lights / cable / sprinkler 等障礙、infrared heater 區避 + clearance + 控制器位置。

**Trigger**：所有 HVLS 案、Phase 0 必跑。

**期望答**：(a) site survey checklist（樓高 / 結構 / 障礙 / 電源 / 控制器位置）(b) 雙方人員（Amafans / OEM Eric + 我方 Sara）(c) 1 day on-site。

**Cross-ref**：[research/09 §6.3 Onboarding workflow](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§6-sensor-bom-sml-preset)。

### Q3.2 — Customer baseline 量測 protocol — pre-install 體感問卷 / kWh / 員工 churn？

**為何問**：避免 AP-18「基線數字沒量」。HVLS value prop 量化必有 baseline、不單看 sensor 數字、人類體感 / 員工 churn 也是 KPI。

**Trigger**：所有 HVLS 案、商務段。

**期望答**：(a) 量測 KPI（kWh / 體感問卷 / churn / 員工抱怨 ticket count）(b) baseline 期長度 (c) 客戶端負責人 (d) 我方 vs 客戶端工時分擔。

### Q3.3 — Phase 0 → Phase 1 → upselling channel？

**為何問**：(a) Phase 0 pilot（1-4 fan）→ 客戶 willingness 高、能 demo (b) Phase 1 expand（5-15 fan）→ 客戶 ROI 證實後 scale (c) upselling channel — 從風扇延伸到電力管理 / 工安監測 / AI 月報。

**Trigger**：所有 HVLS 案、商務段。

**期望答**：(a) Phase 0 規模 (b) Phase 1 expand 條件（如 ROI 達 X% trigger）(c) upselling roadmap。

### Q3.4 — Customer training material — 操作 vs 維護？

**為何問**：(a) 操作 → 平台 dashboard / app（場域管理員、5 min 學）(b) 維護 → 故障判讀 / 簡單排除（客戶廠維修工、半 day）(c) 高階維護（馬達拆裝 / blade balance）→ 廠商 only。

**Trigger**：所有 HVLS 案、驗收段。

**期望答**：(a) training material 列表 (b) 訓練對象 (c) 訓練時長 (d) e-learning vs on-site。

**Cross-ref**：[模組 11 驗收與效益](../modules/11-acceptance-benefits-operations.md) + [強制檢查項 B 溝通計畫](../8-mandatory-checks/B-communication-plan.md)。

### Q3.5 — Customer churn / win-back playbook？

**為何問**：(a) 客戶 Year 2 不續訂主因（典型）：ROI 量化失敗 + 維護慢 + 沒人接平台 (b) win-back — Year 2 體感問卷 / kWh 報告 / fan 健康度 (c) AP-20 上線後沒人接。

**Trigger**：訂閱模式案、合約段。

**期望答**：(a) Year 1 / Year 2 / Year 3 milestone (b) win-back trigger (c) 客戶端 champion 維持機制。

**Cross-ref**：[anti-patterns.md AP-20](../anti-patterns.md#ap-20)。

---

## §4 Joint partnership with HVLS OEM（5 題、聯名 case 特殊）

**Why**：HVLS 案常是 fan OEM × PaaS 聯名（Amafans × GoodLinker / Big Ass Fans × X / 國際精工 × Y）— 商務 / 責任 / 客戶歸屬 / 退出 split 必明確。本節 cross-ref 詳細到 [b2b2b-channel-partnership.md](b2b2b-channel-partnership.md)。

### Q4.1 — OEM 提 hardware vs PaaS 提 software 切割明確？

**為何問**：聯名 case 雙方 scope 必明確、否則客戶問「壞了找誰」答不出來。

**Trigger**：所有 HVLS + 聯名案。

**期望答**：
- (a) OEM hardware scope：fan 本體 / fan controller / fan firmware / fan 安裝 / 保固
- (b) PaaS software scope：sensor / gateway / platform / dashboard / AI 月報 / SLA
- (c) **灰色地帶**：fan controller IoT 介面（OEM 提 SDK vs PaaS 自寫 driver）/ sensor 跟 fan 共線 vs 獨立 bus / OTA 由誰執行
- (d) 客戶端窗口 — 雙方 first responder 是誰

**Cross-ref**：[b2b2b-channel-partnership.md §1 Partnership structure](b2b2b-channel-partnership.md)。

### Q4.2 — 聯名 brand vs OEM brand vs PaaS brand？

**為何問**：(a) front-and-center 聯名 brand（如「Amafans × GoodLinker EAQS」）→ 雙方對等 (b) 主從 — OEM brand 主、PaaS behind（white-label）(c) 完全 white-label — PaaS 無 brand presence。

**Trigger**：所有聯名案、商務 deck 段。

**期望答**：(a) brand presence 策略 (b) marketing 物料雙方審 (c) customer-facing 文件（合約 / SOW）brand 規範。

### Q4.3 — 商業 split — 訂閱費 / 一次性 / 抽成 / 階梯？

**為何問**：(a) 訂閱費平分 vs 抽成 vs 階梯（量越大某方拿越多）(b) hardware 一次性收入歸 OEM、SaaS 訂閱歸 PaaS、是常見 default (c) maintenance contract 歸誰？

**WebSearch verified**：per [SaaS partnership template](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/) + [Kiflo channel partner](https://www.kiflo.com/blog/how-to-build-a-channel-partner-agreement-template)、SaaS partner 典型 split 20-50%、affiliate 10-30%、joint venture 50/50。

**Trigger**：所有聯名案、商務段。

**期望答**：(a) split formula (b) 觸發階梯條件 (c) reconciliation 頻率 (d) 客戶不續訂時雙方損失分擔。

**Cross-ref**：[b2b2b-channel-partnership.md §2 Commercial split](b2b2b-channel-partnership.md)。

### Q4.4 — 客戶 ownership — OEM 既有 vs PaaS 新拉？

**為何問**：(a) OEM 既有客戶（如 Amafans 既有 fan 客戶）→ OEM 帶來、客戶歸屬 OEM (b) PaaS 新拉 → PaaS 帶來、客戶歸屬 PaaS (c) 跨界客戶 — 雙方共同 nurture 的 → 共同 ownership？(d) 客戶資料雙方共用 vs 各自隔離。

**Trigger**：所有聯名案、合約段。

**期望答**：(a) 客戶歸屬規則 (b) 跨界 case 處理 (c) 客戶資料雙方 access 規範 (d) 排他條款（A 客戶只透過 OEM 賣、PaaS 不可繞過）。

### Q4.5 — 退出機制 — 一方退出對另方影響？

**為何問**：(a) OEM 退（如 Amafans 倒閉）→ 已賣客戶的 fan 沒人保固 / firmware 沒人 update → 客戶平台還能跑嗎？ (b) PaaS 退 → 客戶 dashboard 沒了、資料怎麼帶走？ (c) 雙方退出條款必對等。

**Trigger**：所有聯名案、合約段。

**期望答**：(a) 退出觸發條件 (b) 過渡期長度（典型 6-12 月）(c) 客戶資料 handoff (d) fan firmware open-source escrow（如 OEM 退 → 客戶可繼續維護）(e) liability cap 終止後仍 effective。

**Cross-ref**：[強制檢查項 G 退出機制](../8-mandatory-checks/G-exit-plan.md) + [b2b2b-channel-partnership.md §3 Legal / liability split](b2b2b-channel-partnership.md) + [anti-patterns.md AP-22](../anti-patterns.md#ap-22)。

---

## §5 Trigger conditions table

| 題號 | Critical 觸發條件 | 不 critical |
|---|---|---|
| Q1.1-1.3 | 所有 HVLS 案、Phase 0 必填 | — |
| Q1.4 | 節能 ROI 量化案 | 純 thermal comfort 案 |
| Q1.5 | 所有 HVLS ROI 案、商務必填 | — |
| Q1.6 | 既有 HVAC case | greenfield 無冷氣 |
| Q1.7 | 既有廠 retrofit | greenfield 新建 |
| Q1.8-1.9 | 合約 / 維護段必填 | — |
| Q1.10 | 智能化 HVLS | 純機械 fan |
| Q2.1-2.5 | 所有 HVLS + sensor 案 | 純 fan、無 sensor |
| Q2.6 | 量化 ROI 案 | 純安裝 |
| Q2.7 | fan 密度高 case | 散布 / 單 fan |
| Q2.8-2.10 | 智能化 + 工安 | 純機械 |
| Q3.1 | 所有 HVLS 案、Phase 0 | — |
| Q3.2 | 量化 ROI 案 | — |
| Q3.3 | 訂閱 / scale 模式 | 純一次賣斷 |
| Q3.4 | 所有 HVLS 案、驗收段 | — |
| Q3.5 | 訂閱模式 | 一次賣斷 |
| Q4.1-4.5 | 所有聯名案 | 單一公司案（cross-ref iiot-deployment.md）|

---

## §6 Concrete dogfood references

### 6.1 Amafans EAQS 案（2026-05-28 ~ 2026-05-29）— 本檔催生案

**核心 dogfood**：
- 5 sensor scheme（PM2.5 / CO₂ / 溫度 / 濕度 / 風速）+ 電力 → 4 layer 分類 mixed strategy
- 1 fan 1 set vs 1 site 1 set 是 binary 偽選擇
- Amafans × GoodLinker 聯名 — Bruce 商務段在合約 / appendix、不在 RFP 主文

**對應本檔題**：
- Q1.5 HVLS ROI baseline — 體感降 3-6°C 需 fan-local + ambient 雙軌（per research/03 §1）
- Q2.1-2.5 — sensor 4 layer mixed strategy（per research/09 §2-§3）
- Q4.1-4.5 — 聯名 split：OEM 提 fan / PaaS 提 platform、客戶端窗口、退出機制

**Cross-ref**：
- [research/09 sensor placement consultancy](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md)
- [pending-items-tracker.md A.18-A.21](../../examples/amafans-eaqs/pending-items-tracker.md)
- [anti-patterns.md AP-NEW-WRITE-5 + AP-NEW-ANTI-HALLUC-1~4](../anti-patterns.md)

### 6.2 國際精工 / 大同大學 EMS 標竿（per Amafans EAQS research）

**Dogfood**：30 sensor × 5 電表 大同大學案 — L tier preset 來源、scale 對標 reference。

### 6.3 Big Ass Fans 安裝指南 + Hunter Industrial guide — 業界 baseline

**Dogfood**：site survey checklist / structural requirement / electrical NEC 對齊 — 跨 OEM 通用。

---

## §7 Anti-pattern callouts

| 本檔段 | 對應 anti-pattern | 教訓 |
|---|---|---|
| §1.5 baseline | AP-18 基線數字沒量 | 簽約前必量基線 |
| §1.9 維護合約 | AP-09 整套報一個價 | 拆 maintenance / SLA / spare 分項 |
| §2 sensor scheme | （無 AP、本檔首次 fan-specific 標準化）| Day 1 必過 10 題 |
| §3.5 churn / win-back | AP-20 上線後沒人接 | 客戶端 champion 維持 |
| §4.1 OEM × PaaS scope | AP-NEW-WRITE-5 聯名 RFP 框架混用 | 案件類型先判斷、不要套錯框架 |
| §4.5 退出機制 | AP-22 退出機制不清 | 退出條款是讓客戶敢簽 |

---

## §8 Cross-ref — 對應 13 模組 / 8 強制檢查 / 其他 addon / methodologies

### 8.1 對應 13 模組

| 本檔段 | 對應模組 |
|---|---|
| §1 Fan technology | [01 產業](../modules/01-industry-market.md) + [02 競品](../modules/02-competitors-alternatives.md) |
| §1.5 ROI baseline | [11 驗收效益](../modules/11-acceptance-benefits-operations.md) |
| §2 Sensor | [08 架構](../modules/08-architecture-functional-nfr.md) + [13 系統設計](../modules/13-system-design-mvp.md) |
| §3 Customer onboarding | [04 As-Is / To-Be](../modules/04-as-is-to-be-service-blueprint.md) + [11 驗收](../modules/11-acceptance-benefits-operations.md) |
| §4 Joint partnership | [05 RACI](../modules/05-stakeholders-raci.md) + [10 商務報價](../modules/10-procurement-pricing.md) |

### 8.2 對應 8 強制檢查

| 本檔段 | 強制檢查 |
|---|---|
| §1.5 baseline | [A RTM](../8-mandatory-checks/A-rtm.md) + [H 證據包](../8-mandatory-checks/H-evidence-pack.md) |
| §3.4 training | [B 溝通計畫](../8-mandatory-checks/B-communication-plan.md) |
| §4 聯名 | [C 決策紀錄](../8-mandatory-checks/C-decision-log.md) |
| §4.5 退出 | [G 退出機制](../8-mandatory-checks/G-exit-plan.md) |

### 8.3 對應其他 addon

| 本檔段 | 相關 addon |
|---|---|
| §1-§3 IIoT 通用 | [iiot-deployment.md](iiot-deployment.md) |
| §2.4-2.5 空品 | [air-quality-system.md](air-quality-system.md) |
| §4 聯名 | [b2b2b-channel-partnership.md](b2b2b-channel-partnership.md) |
| §1.7 廠房結構 | [construction-realestate.md](construction-realestate.md) |
| 通用製造 | [manufacturing.md](manufacturing.md) |

---

## §9 結論

### 9.1 解決什麼

1. **HVLS fan-specific Day 1 question bank** — 30 題、避免 fan domain 特殊問題（baseline / ROI / 聯名 split）被略過
2. **跨 OEM 通用** — Big Ass / MacroAir / Amafans / Hunter / 國際精工 都適用
3. **聯名 case 框架** — Q4 5 題對齊 b2b2b-channel-partnership.md

### 9.2 用法 SOP

| 階段 | 動作 |
|---|---|
| Phase 0 接案 24 hr | §1 10 題 + iiot-deployment.md §1 通用 10 題 |
| Phase 0 site survey | §2 10 題 + iiot-deployment.md §2-§3 通用 |
| Phase 1 訪談 | §3 5 題 |
| Phase 2-4 商務 / 聯名 | §4 5 題 + b2b2b-channel-partnership.md 30 題 |

---

**作者**：ProposalOS framework upgrade（per Amafans EAQS 2026-05-29 retro）
**版本**：v0.1 draft、2026-05-29
**Cite source**：
1. [Big Ass Fans Yellow Jacket installation guide](https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf) — site survey / clearance / NEC
2. [Hunter Industrial HVLS installation guide](https://industrialfans.hunterfan.com/blogs/hunter-industrial-blog/how-to-install-an-hvls-ceiling-fan-industrial-fan-installation-guide) — HVLS design intent
3. [HVLS Application Guide (Entrematic)](https://epicfan.com/assets/6022798B-HVLS-Application-Guide.pdf) — HVLS application
4. [SaaS Partnership Agreement template (Terms.Law)](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/) — SaaS partner split formula
5. [Kiflo channel partner agreement](https://www.kiflo.com/blog/how-to-build-a-channel-partner-agreement-template) — channel partner clauses
6. [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf) — breathing zone（fan sensor 不在 fan 上的依據）
7. [LED Lighting Supply HVLS Buyers Guide](https://www.ledlightingsupply.com/blog/hvls-fans-a-comprehensive-buyers-guide) — HVLS overview

**驗證狀態**：5 個 verified URL + 4 個 ⚠️ training-data hedged claim（HVLS coverage 數字 / 體感降溫 ROI / MTBF / fan 間距 互擾規則）。
