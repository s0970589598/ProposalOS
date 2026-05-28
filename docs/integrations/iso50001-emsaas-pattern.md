# ISO 50001 × EMS SaaS — 完整整合 pattern

> 給「賣節能設備 + EMS 平台」案件、或「想做 EMS SaaS」的 founder / PM、或「想拿 ISO 50001 認證的高用電客戶」做提案 reference。
>
> 源自 GoodLinker 平台 2026-05-28 完整盤點（staging + prod + war_room source）+ Amafans EAQS CR-002 真實案例衍生。
>
> 完整內部 spec 在 [proposal-intelligence/products/goodlinker-electricity/](https://github.com/s0970589598/proposal-intelligence)（private）。

---

## 1. ISO 50001 是什麼

**ISO 50001:2018 能源管理系統國際標準**：
- 跟 ISO 9001 / 14001 / 45001 同等級
- 國際通行、台灣經濟部能源局認可
- 取得後可申請：
  - 節能補助（經濟部能源局、地方政府）
  - 綠色金融融資（國發基金、銀行 ESG 貸款）
  - 客戶通路要求（Apple / Walmart / Sony 供應鏈）
  - ESG 報告加分（CDP / GRI / TCFD）

## 2. ISO 50001 核心要求（簡化）

| 條款 | 要求 | 對應 EMS 平台功能 |
|---|---|---|
| §4 組織背景 | 自評組織狀況 | （客戶自填）|
| §5 領導承諾 | 高階主管 commit | （客戶自管）|
| §6.3 能源審查 | 識別 SEU（Significant Energy User）| **SEU treemap / 排行** |
| §6.4 EnPI（能源績效指標）| 制定 + 監測 | **月報 KPI** |
| §6.5 能源基線（EnB）| 設定 + 比較 | **Baseline 自動計算** |
| §9 績效評估 | 持續監測 + 內審 | **即時監測 + 月報** |
| §10 持續改善（PDCA）| Plan-Do-Check-Act | **異常偵測 + PDCA 追蹤** |

## 3. EMS 平台 6 大子模組（per GoodLinker 實作）

### 3.1 即時監測 dashboard
- 契約容量 gauge + 即時需量
- 1 hour 趨勢 chart（3 min interval polling）
- 本月最高需量 3 卡（尖 / 半尖 / 離峰）
- TOU 時段費率分析
- 用電結構 donut（含今日電費）
- 總電表 / 設備電表 tab 切換
- 監測廠區 dropdown

### 3.2 SEU treemap（重大能源設備）
- ECharts treemap 視覺呈現各設備本月 kWh 佔比
- 無 threshold、全顯示（視覺反映重要性）
- 直接對應 ISO 50001 §6.3「Energy Review」要求

### 3.3 工單電費模擬器
- 3-step：參數設定 → 設備選擇 → 模擬結果
- 時段平移 slider（-12H ~ +12H）
- 負載曲線 + 成本結構 donut（原始 vs 模擬）
- 給生產排程主管 quantitative decision

### 3.4 年度契約優化器
- 365 天歷史 daily_max_demand 為輸入
- 安全係數（預設 10%）
- **2-pass coarse-to-fine grid search**（minimize 基本電費 + 超約罰金）
- 5 變數（經常 / 非夏 / 半尖 / 週六半尖 / 離峰）
- 純 deterministic、非 AI

### 3.5 能源管理 AI 月報
- 6 段 S01-S05 + AI 摘要
- 5 種異常偵測：單日突波 / 連續偏高 / 間歇偏高 / 持續上升趨勢 / 離線
- 4 級警示：observation / warning / severe / offline
- PDCA 4 級改善：significant (≥15%) / effective (≥5%) / marginal (≥0%) / no_improvement (<0%)

### 3.6 異常事件 + PDCA 追蹤
- 標記已處理 → 自動建 PDCA action（同 row）
- 下月整月後自動算 reduction_rate
- 順延機制：首次資料不足順延、第二次仍不足 → insufficient_data
- baseline = 異常前 30 天日均 / verify = 處理後下月日均

## 4. 系統 architecture pattern

```
RS485 Modbus 電表（多 slave）
        ↓
LESI / IIoT Gateway（每 3 分鐘上雲）
        ↓
MQTT → Lambda → DDB（raw history）+ S3 cache
        ↓
┌───────────────────┴───────────────────┐
↓                                       ↓
即時 API（reportbyS3）              Cron 00:30
（前端拉、3 min polling）         UpdateElectricityEnergyConsumption
                              寫入 electricity_daily_energy_consumption_records table
                                        ↓
                              ┌─────────┴────────────┐
                              ↓                      ↓
                       EnergyKpiCalc       EnergyAnomalyDetection
                       （baseline / KPI）  （5 規則 + 4 級）
                                        ↓
                              ElectricityAnomalyEvent 寫月報
                                        ↓
                              月報 AI（GenAI 文字摘要）
```

## 5. Tag-based multi-dimensional 設計

每個電表 sensor 同時掛 4 dimension tag：

| Dimension | TagSource | 範例 |
|---|---|---|
| Business（業務分群）| `energyMeter` | 學校總電錶 / 廠 A 電表 |
| Role（角色）| `official` (type=energy meter type) | `main energy meter` / `equipment energy meter` |
| Function（物理量）| `official` (type=energy meter function) | `kW` / `kWh` / `V` / `A` / `Hz` / `PF` / `Vn` |
| Aggregation（聚合層）| `official` (type=energy monitoring and distribution) | `total_*` / `regional_*` |

→ 同 sensor 多 tag pivot、UI 切換維度只是 tag filter；總/設備電表 tab 用 official tag 篩。

## 6. 主電表 / 分路電表費率繼承

- **主電表** = 設了 voltage_type/billing_method 的 energyMeter tag
- **分路電表** = 同 LESI 下其他 energyMeter tag（自動繼承主電表費率）
- 客戶只需設 1 個主電表費率、平台自動套用所有分路電表

**對客戶 onboarding 影響**：簡化（不用每個電表都設費率）。
**對提案影響**：對「多區域場域」客戶（廠房 + 多區段空調）可賣「**多區節能 dashboard + 歸因**」。

## 7. 異常偵測規則（演算法門檻 — 可直接抄）

| 規則 | severe | warning | 設計細節 |
|---|---|---|---|
| 單日突波 | 單日 > 50% baseline | > 25% baseline | 偏離率 = (today - baseline) / baseline |
| 連續偏高 | 連 3 天 > 30% 或連 5 天 > 15% | 連 2 天 > 15% 或連 5 天 > 10% | 連續日期區間 |
| 間歇偏高 | 累 5 天 > 30% 或累 10 天 > 15% | 累 5 天 > 15% 或累 10 天 > 10% | 月內異常日集合（不連續）|
| 持續上升趨勢 | N≥14 + R²≥0.6 + monthly_rise≥25% | N≥14 + R²≥0.5 + monthly_rise≥15% | 一元線性回歸、`monthly_rise = (slope × N) / baseline × 100%` |
| 離線 | 連續 ≥ 3 天 | 單日 | NaN / 全 0 都算 |

**設計細節**：
- 每規則獨立執行、不 short-circuit（避免「單日突波 + 連續偏高」同時發生只看一個）
- 連續偏高的日期不重複進入間歇偏高計算（避免雙重事件）
- baseline = 月份前 3 個月有效日均 kWh
- 有效日 = `daily_kwh > 0`（排除 0 / null）

## 8. PDCA 改善追蹤模式

```
S05 標記已處理（填處理方式）
   ↓
同 row 更新 handled_at / handled_by / action_name
pdca_status: not_handled → awaiting_verification
   ↓
下月整月後 cron 自動計算
   ↓
pdca_baseline_avg = 異常發生日前 30 天日均
pdca_verify_avg = 處理後下月整月日均
pdca_reduction_rate = (baseline - verify) / baseline × 100%
   ↓
pdca_improvement_level: significant(≥15%) / effective(≥5%) / marginal(≥0%) / no_improvement(<0%)
   ↓
驗證結果寫到「驗證月」月報（pdca_verified_in_report_month）
原始月報快照不改
```

**順延機制**：
- pdca_verification_attempts 0/1/2
- 首次驗證時資料不足 → 順延一次
- 第二次仍不足 → 終止為 `insufficient_data`

## 9. 提案 anti-pattern（必避）

| Anti-pattern | 後果 |
|---|---|
| 「我們有平台、客戶自己用就好」 | 客戶拿不到 ISO、blame 平台 |
| 「ISO 認證是顧問業務、平台不管」 | 沒人 own end-to-end ROI、客戶感受兩家公司互推 |
| 「ISO 50001 = 一次性 project」 | ISO 是 ongoing、每年要 surveillance audit、應賣訂閱 |
| 「平台 + 顧問分兩條商務」 | 客戶簽 2 個合約、流程冗、選 1 個切割對手 |
| 「演算法不公開」 | ISO 外審要演算法透明、客戶會被打回 |
| 「PDCA 行動由客戶手動建」 | 沒人會用、ISO §10 條款沒做到 |
| 「Baseline 由客戶設」 | 不一致、外審會挑戰 |

## 10. 提案 good pattern

| Good pattern | 為什麼 |
|---|---|
| **平台 + 認證輔導打包訂閱**（含每年 surveillance）| 客戶 1 個合約、平台跟顧問利益綁定 |
| **SEU PDF / EnPI 報表 / CO₂ 換算**做為「ISO 加值」差異化 | 客戶感受「不只是 dashboard、是 ISO ready」 |
| **PDCA 追蹤自動產出 audit log** | 外審時直接呈、不用客戶手寫 |
| **跟客戶內部品保 / ESG 部門 align Champion** | ISO 是品保 / ESG 的 KPI、找對 stakeholder |
| **演算法門檻文件透明**（spike 50/25、連續 X 天 Y%）| 客戶可帶這份去找外審溝通 |
| **配套節能設備時 narrative：「裝完設備 → PDCA 驗證 → ISO 加分」** | 把節能設備銷售跟 ISO 認證 ROI 綁在一起 |

## 11. 套裝定價建議

| 套裝 | 內容 | 典型月費 |
|---|---|---|
| 基本能源 | 即時監測 + 月報 | NT$ 3,000-5,000/客戶 |
| 能源 + ISO 50001 加值 | + SEU PDF export + EnPI 目標 + CO₂ 換算 | NT$ 8,000-12,000/客戶 |
| ISO 認證輔導 | + 顧問人天（文件 + 內審 + 外審）| NT$ 100-300K/案（一次性）|

## 12. 適用客戶 profile

| 客戶類型 | 套裝建議 | 為什麼 |
|---|---|---|
| 製造業（電子 / 機械 / 食品 / 化工）| 加值 + 認證輔導 | 高用電 + 通路要求 |
| 大型廠房 / 連鎖門市 | 加值 | 多區管理 + 多廠對比 |
| 食品加工 / 冷鏈 | 加值 + 認證輔導 | 食安認證 + 通路要求 |
| 半導體 / 高用電 | 認證輔導 | RE100 / SBTi 壓力 |
| 服務業（飯店 / 醫院 / 學校）| 基本 | 用電結構單純 |
| 配套節能設備廠商（風扇 / LED / 變頻）| 「平台 + 設備 + 驗證」打包 | 共同銷售、雙贏 |

## 13. 參考實作

- **GoodLinker 平台** — Laravel + Vue 3 + Vite + ECharts + Pinia + Modbus RTU
- **典型部署**：LESI Gateway → AWS Tokyo / Singapore（per 客戶區域）
- **DB schema**：`tags` / `sensors` / `sensor_tag` pivot / `tag_settings` / `tag_setting_types` / `electricity_tariff_rules` / `electricity_daily_*_records` / `electricity_monthly_*` / `electricity_anomaly_events`

詳細實作 spec 見 [proposal-intelligence private repo](https://github.com/s0970589598/proposal-intelligence/tree/main/products/goodlinker-electricity)。

## 14. 更新紀錄

- 2026-05-28 v1：初版（基於 GoodLinker 完整 EMS 盤點 + Amafans EAQS CR-002 衍生）
