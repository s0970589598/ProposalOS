# Case Studies & Real-World Deployments References

> 跨案重用的「真實客戶部署」案例索引。**核心警示**：vendor projected vs customer-deployed verified 一律分清楚（per amafans pitch-deck-builder Pre-Stage 0 antipattern）。
>
> **Hedging convention**：✅ Verified（third-party 報導 + 客戶可驗 evidence）/ ⚠️ Vendor-projected（廠商 self-claim 未驗）/ ❌ Secondary cite only

---

## §1. HVLS / Fan deployment cases

### IKEA Zaragoza + Murcia（Spain）— MacroAir HVLS

- **Type**: Customer deployment case
- **Industry**: 零售 / 大型展示空間
- **Vendor**: MacroAir
- **URL**:
  - IEN press: https://www.ien.com/operations/hvac-r/product/20844484/macroair-case-study-ikea-cuts-operating-costs-with-hvls-fans
  - MacroAir testimonial: https://blogs.macroairfans.com/testimonials/furniture-retailer-in-spain-has-reduced-energy-usage-with-macroair-fans
- **Hedging level**: ⚠️ Vendor-projected（MacroAir 自家 testimonial、可信但非中立）
- **Cited where**:
  - `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
  - `examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md`
- **Notes**:
  - 冬天樓地板 +6°F、夏天 HVAC setpoint 提高 → CO₂ + 能源 降
  - **賣斷 + HVAC 整合**、**無平台訂閱**
  - 可作為「HVLS reduces energy cost」trend 引用、不可作為具體 % saving 斷言

### Coca-Cola Orlando 配送中心 — MacroAir AirSpan

- **Type**: Customer deployment case
- **Industry**: 物流配送
- **Vendor**: MacroAir
- **URL**: (透過 MacroAir 部落格 testimonial 引用、無獨立 third-party press)
- **Hedging level**: ⚠️ Vendor-projected
- **Cited where**: `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - 130,000 sq ft、32 ft 天花板
  - 初裝 2 fan、後追加 10 fan（**自己 expand 代表 ROI 正向**、ROI 的間接 evidence）
  - **未提 cloud 監控**

### Newmarket Warehouse（Canada）— MacroAir AVDX 24-ft

- **Type**: Customer deployment case
- **Industry**: 倉儲
- **Vendor**: MacroAir
- **URL**: https://www.northerndocksystems.com/newmarket-warehouse-hvls-fans/
- **Hedging level**: ✅ Verified（third-party Northern Dock Systems 報導、非 MacroAir 自家）
- **Cited where**: `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - 4 fan
  - **夏天體感 -8°F**（4.4°C）；冬天每呎天花板高度省 1% 能源
  - 一次性 $4,000 能源 rebate
  - **學術 anchor 對齊**：CBE Berkeley downward HVLS 2-4°C、實測 4.4°C 屬上緣可能性合理範圍

### Big Ass Fans Lexington 工廠（自家 pilot）

- **Type**: Vendor's own dogfood
- **Industry**: 工業（自家工廠）
- **Vendor**: Big Ass Fans + Lexmark
- **URL**:
  - https://www.businesswire.com/news/home/20241015428578/en/
  - https://origin-www.lexmark.com/en_us/solutions/iot-solutions/knowledge-hub/big-ass-fans-partners-with-lexmark.html
- **Hedging level**: ⚠️ Vendor-projected（廠商自家 pilot、未上市時的 marketing claim）
- **Cited where**: `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - 10-month pilot at Lexington + Tualatin OR
  - Vendor claim：「up to 60% heat stress ↓、up to 50% productivity ↑、4× less energy than HVAC、5 年省 $1M、**0 起 heat-related 事件**」
  - ⚠️ **這些 60% / 50% / $1M 數字全是 projected vendor claim、不是 customer-deployed 結果**
  - 2024-10 發布時 CommandSense 還沒上市、2025-04 才正式 release
  - **寫進 Amafans deck 時必標 hedging**

---

## §2. HVLS + HVAC 通用 reference

### MacroAir — HVLS + HVAC 配對節能 claim

- **Type**: Vendor self-claim
- **URL**: https://blogs.macroairfans.com/（多 article 散落）
- **Hedging level**: ⚠️ Vendor claim（無 third-party 驗證）
- **Cited where**: `examples/amafans-eaqs/research/03-kpi-benchmark-hvls-energy.md`
- **Notes**: 「HVLS + HVAC 配對可省 20-30% 暖通能源」、用於 proposal 引用必標 hedging

---

## §3. 台灣 EMS 案例（CR-002 用）

### 大同大學 EMS / 30 sensor benchmark

- **Type**: PROD-verified deployment（GoodLinker existing customer）
- **Industry**: 大學校園能源管理
- **Vendor**: GoodLinker（PaaS 提供方）
- **URL**: 內部 PROD API（無公開 URL、屬 GoodLinker 客戶資料）
- **Hedging level**: ✅ Verified（amafans CR-002 PROD API pull 2026-05-28）
- **Cited where**:
  - `examples/amafans-eaqs/research/cr002-tariff-ems-taiwan.md`
  - `examples/amafans-eaqs/research/cr002-goodlinker-electricity-spec.md`
  - `examples/amafans-eaqs/research/09-sensor-placement-consultancy.md §4.3`
- **Notes**:
  - 30 sensor 部署規模（5 個電表）
  - 對應 air quality / 風扇 EMS sensor count 標竿
  - **對外提案不可揭露客戶名「大同大學」、需 anonymize 為「台灣某大學 EMS 案例」**

### Power Lifebook 案例（台灣 EMS）

- **URL**: http://power.lifebook.com.tw/Services/tabid/3099/EntryId/788/.aspx
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/research/cr002-tariff-ems-taiwan.md` reference

### Fetnet 遠傳 — IoT Energy Solution

- **URL**: https://enterprise.fetnet.net/content/ebu/tw/solution/NetZero/transform/iot-energy/iot-energy-intro.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/research/cr002-tariff-ems-taiwan.md` reference

---

## §4. TSMC / 半導體業 case

### TSMC ESG / SEMI E187 公開資料

- **URL**:
  - TSMC ESG: https://esg.tsmc.com/en-US/articles/280
  - SEMI E187（standard、公開可查）
- **Hedging level**: ⚠️ Training-data（TSMC ESG public article、SEMI E187 standard 公開）
- **Cited where**: `framework/industry-addons/manufacturing.md` reference
- **Notes**:
  - **TSMC 內部 EMS / SCADA 細節為機密**、本 library 只索引 ESG public articles + SEMI E187 standard 公開部分
  - **不可作為「TSMC 用 X 技術」斷言依據**（per 翻車 #19 dogfood、業界主張不能憑印象）

---

## §5. Singapore ZEB Plus（學術 + project case）

→ 詳見 `academic-papers.md` §2

---

## §6. EaaS / SaaS 客戶 case

### Customer Gauge B2B SaaS NPS

- **URL**: https://customergauge.com/benchmarks
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/11-驗收與維運.md`

### Hitachi Lumada / 客戶 case stories

- **URL**: https://www.hitachi.com/products/it/lumada/global/en/stories/index.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/02-競品與替代方案.md`

### ASU W. P. Carey Center for Services Leadership

- **URL**: https://wpcarey.asu.edu/center-services-leadership
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/01-產業與市場.md`

---

## §7. Vendor projected vs Customer-deployed — 分類規則（重要）

per amafans pitch-deck-builder Pre-Stage 0 antipattern + Big Ass Fans Lexington pilot 教訓：

| 類型 | 定義 | 範例 | 提案用法 |
|---|---|---|---|
| **✅ Customer-deployed verified** | 客戶實際上線 + third-party 報導 / 政府公告 / 內部 PROD pull | 大同大學 EMS（內部 PROD）、Newmarket Warehouse | 可直接 cite 數字、不必 hedge 數字本身 |
| **⚠️ Customer-deployed via vendor testimonial** | 客戶實際上線、但 evidence 來自廠商自家 testimonial | IKEA × MacroAir、Coca-Cola Orlando | Cite 時必加「per [vendor] testimonial」、不可作為中立 benchmark |
| **⚠️ Vendor-projected pilot** | 廠商自己 pilot、未上市、未上客戶 | Big Ass Fans Lexington CommandSense pre-launch 數字 | 必標「**廠商 projected、非 customer-deployed 結果**」、不可作為 customer ROI 依據 |
| **❌ Vendor claim with no source** | Vendor 主張、無 case 或 pilot 支持 | 「20-30% HVAC 節能」MacroAir 通用 claim | 只能作 trend mention、必加 hedging |

**自檢句**（per amafans CLAUDE.md）：
- 寫 case 引用前自問：「這數字的 evidence chain 是 customer-deployed verified、還是 vendor projected pilot、還是 vendor claim？」
- 三類混在一起、最弱的那層決定整段 hedging level

---

## §8. 對外 deliverable case 引用 protocol

✅ **可以寫**：
- 「per Newmarket Warehouse Canada（third-party 報導）部署 MacroAir AVDX 24-ft、夏天體感 -8°F」
- 「per CBE Berkeley 學術 anchor、HVLS downward 體感降溫 typical 2-4°C」
- 「per GoodLinker existing 客戶 EMS 案例（30 sensor、台灣某大學）」

❌ **不可寫**：
- 「per Big Ass Fans CommandSense 部署、客戶省 50% 能耗」（Lexington 為 pre-launch pilot、數字為 projected）
- 「per TSMC 內部 EMS 規模」（無公開 evidence）
- 「per IKEA × MacroAir 報告」（MacroAir testimonial 不是中立 case study）

---

## §9. 累計 citation 數

| Category | 已索引 | ✅ Verified | ⚠️ Vendor-projected / Training-data |
|---|---|---|---|
| HVLS deployment cases | 4 | 1 | 3 |
| HVLS + HVAC reference | 1 | 0 | 1 |
| 台灣 EMS cases | 3 | 1 | 2 |
| TSMC / 半導體 | 1 | 0 | 1 |
| ZEB Plus | （→ academic-papers.md）| - | - |
| EaaS / SaaS 客戶 | 3 | 0 | 3 |
| **Total** | **12** | **2** | **10** |

**主要狀態**：deployment case 多為 vendor-projected、本 library 對外引用必標 hedging level（不混用 verified 與 projected）。
