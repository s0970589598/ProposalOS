# 產業加掛｜能源 / ESG / 永續

能源管理、碳盤查、ESG 報告、上市櫃永續、供應鏈永續。

## 對應 13 模組的擴充

### 模組 01 產業

- 淨零趨勢、2050 碳中和
- 各國碳稅、CBAM（歐盟碳邊境）
- TCFD、TNFD、SBTi
- RE100、SBTi
- 永續供應鏈（Apple、Microsoft 對供應商要求）

### 模組 03 問題

| 場景 | 痛點 |
|---|---|
| 碳盤查 | Scope 1/2/3 算不出來 |
| 能源管理 | 能耗高、來源不清 |
| 報告產出 | ESG 報告手寫、版本混亂 |
| 評比應對 | DJSI、CDP、MSCI、FTSE 評分低 |
| 投資人壓力 | 機構投資人要 ESG 資料 |
| 客戶要求 | 大客戶要供應商提供碳足跡 |
| 法規應對 | 上市櫃永續報告書、CBAM 申報 |

### 模組 06 資料

| 資料 | 來源 |
|---|---|
| 用電 | 電錶、電力公司、能管系統 |
| 用水 | 水錶、水公司 |
| 用油 / 用氣 | 採購單、加油紀錄 |
| 廢棄物 | 廢棄物清運單 |
| 員工 | HR 系統（差旅、通勤） |
| 物流 | 運輸里程、模式 |
| 採購 | 供應商、品項、量 |
| 產品 | LCA、EPD |

### 模組 07 合規 — ESG 必查

| 標準 | 內容 |
|---|---|
| ISO 14064-1 | 組織型溫室氣體盤查 |
| ISO 14064-2 | 專案減量 |
| ISO 14067 | 產品碳足跡 |
| GHG Protocol | 全球標準 |
| SBTi | 科學基礎減量目標 |
| TCFD | 氣候相關財務揭露 |
| TNFD | 自然相關財務揭露 |
| IFRS S1/S2 | 國際永續準則 |
| GRI | 全球報告倡議 |
| SASB | 永續會計準則 |
| CDP | 碳揭露專案 |
| 台灣金管會永續發展行動方案 | 上市櫃 |
| CBAM | 歐盟碳邊境（鋼、鋁、水泥、肥料、電力、氫） |
| ISO 50001 | 能源管理 |

### 模組 08 架構

碳盤查 / 能管系統典型架構：

```
資料採集層     │ 電錶 / 流量計 / 採購單 / HR / 物流
   ↓
資料治理層     │ 排放係數、單位轉換、活動數據
   ↓
計算引擎       │ Scope 1/2/3、產品碳足跡 LCA
   ↓
報告產出       │ ESG 報告、CDP、GRI、IFRS
   ↓
查證 / 揭露    │ 第三方查證、董事會、投資人
```

### 模組 11 驗收

- 第三方查證（BSI、SGS、TÜV、DNV）
- 排放係數庫（環保署 EFD、IPCC、各國）
- 邊界定義（組織 / 產品）
- 重大性議題分析

## ESG 特有議題

### 排放係數

- 用哪個係數庫（IPCC、環保署 EFD、IEA、UK BEIS）
- 多久更新
- 客戶 / 投資人能否驗證

### Scope 3 挑戰

- 上游採購（往廠商要資料）
- 下游使用（消費者）
- 投資組合（金融業）
- 大多客戶卡在這

### 查證準備

- 內外稽核
- 證據鏈完整
- 系統可重現結果

### 報告產出

- ESG 報告書（年度）
- CDP 問卷（年度）
- 個別評比（DJSI、MSCI）
- 客戶問卷（不定期）

### 與其他系統整合

- ERP（採購、財務、人資）
- 能管系統（EMS）
- 物流系統
- 廢棄物系統

## 反方審查問題

- 你用哪個排放係數庫？多久更新？
- Scope 3 怎麼算？上游 / 下游 / 投資怎麼處理？
- 第三方查證做過嗎？哪家？
- CBAM 申報你支援嗎？
- 客戶要求碳足跡，你能多快回？
- 跟我們既有 ERP 怎麼串？

---

## ⭐ ISO 50001 能源管理系統 — 完整方案模式

> 來源：GoodLinker 平台實作案例（2026-05-28 完整盤點 staging + prod）。
> 詳見 [`docs/integrations/iso50001-emsaas-pattern.md`](../../docs/integrations/iso50001-emsaas-pattern.md)。

### ISO 50001 是什麼

ISO 50001:2018 能源管理系統國際標準（跟 ISO 9001 / 14001 / 45001 同級）、台灣經濟部能源局認可。
取得後可申請節能補助 / 綠色金融融資 / 客戶通路要求（Apple/Walmart/Sony 供應鏈）/ ESG 報告加分（CDP/GRI/TCFD）。

### 對應 EMS 平台 6 大子模組（per GoodLinker 實作）

| EMS 子模組 | ISO 50001 條款 | 必要程度 |
|---|---|---|
| **即時監測 dashboard**（契約 gauge + TOU + 用電結構）| §9 績效評估 | 必要 |
| **SEU treemap**（重大能源設備視覺化）| §6.3 能源審查 / SEU 識別 | 必要 |
| **工單電費模擬器**（時段平移、生產排程節能）| §6.4 EnPI + §10 持續改善 | 製造業必要 |
| **年度契約優化器**（grid search minimize cost）| §6.2 能源績效改善 | 高用電必要 |
| **AI 月報**（KPI / 異常偵測 / PDCA 行動）| §9 績效評估 + §10 PDCA | 必要 |
| **能源異常事件追蹤 + PDCA**（5 類異常規則 + 4 級改善）| §10 持續改善 | 必要 |

### 客戶端 3 套裝定價模型

| 套裝 | 內容 | 典型月費 |
|---|---|---|
| 基本能源 | 即時監測 + 月報 | NT$ 3,000-5,000/客戶 |
| 能源 + ISO 50001 加值 | + SEU PDF export + EnPI 目標 + CO₂ 換算 | NT$ 8,000-12,000/客戶 |
| ISO 認證輔導 | + 顧問人天（文件 + 內審 + 外審）| NT$ 100-300K/案（一次性）|

### 提案 anti-pattern（必避）

| Anti-pattern | 後果 |
|---|---|
| 「我們有平台、客戶自己用就好」 | 客戶拿不到 ISO、blame 平台 |
| 「ISO 認證是顧問業務、平台不管」 | 沒人 own end-to-end ROI、客戶感受兩家公司互推 |
| 「ISO 50001 = 一次性 project」 | ISO 是 ongoing、每年要 surveillance audit、應賣訂閱 |
| 「平台 + 顧問分兩條商務」 | 客戶簽 2 個合約、流程冗、選 1 個切割對手 |

### 提案 good pattern

| Good pattern | 為什麼 |
|---|---|
| **平台 + 認證輔導打包**訂閱（含每年 surveillance）| 客戶 1 個合約、平台跟顧問利益綁定 |
| **SEU PDF / EnPI 報表 / CO₂ 換算**做為「ISO 加值」差異化 | 客戶感受「不只是 dashboard、是 ISO ready」 |
| **PDCA 追蹤自動產出 audit log** | 外審時直接呈、不用客戶手寫 |
| **跟客戶內部品保 / ESG 部門 align Champion** | ISO 是品保 / ESG 的 KPI、找對 stakeholder |

### 配套節能設備廠商的 narrative

如果案件是「賣節能設備」（風扇 / LED / 變頻器 / 廢熱回收）+ EMS 平台：

> 「客戶裝 [節能設備] 後 → 平台 PDCA 自動驗證 kWh 降幅 → 直接成為 ISO 50001 internal audit 加分項目」

→ 同時打到「節能 ROI 量化」+「ISO 認證輔導」雙痛點。

---

## ⭐ 電力管理 SaaS 設計參考（per GoodLinker EMS 實作）

> 給「想做電力 / 能源 SaaS」類客戶 / 競品分析 / 自做 vs 買 評估用。

### Tag-based multi-dimensional 分類設計

電表 sensor 同時掛 4 維度 tag、達到「業務分群 + 角色 + 物理量 + 聚合層」並存：

1. **Business**：學校總電錶 / 廠 A 電表（用戶自命名）
2. **Role**：MAIN vs EQUIPMENT energy meter
3. **Function**：kW / kWh / V / A / Hz / PF / Vn 7 種物理量
4. **Aggregation**：total_* / regional_*

→ 同 sensor 1 個 row、N 個 tag pivot；UI 切換維度只是 tag filter。

### 主電表 / 分路電表 + 費率繼承

- 主電表 = 設了 voltage_type/billing_method 的 energyMeter tag
- 分路電表 = 同 LESI 下其他 energyMeter tag（自動繼承總電表費率）
- 客戶只需設 1 個總電表費率、平台自動套用所有分路電表

### 5 種異常偵測規則（演算法門檻參考）

| 規則 | severe | warning |
|---|---|---|
| 單日突波 | > 50% baseline | > 25% baseline |
| 連續偏高 | 連 3 天 > 30% / 連 5 天 > 15% | 連 2 天 > 15% / 連 5 天 > 10% |
| 間歇偏高 | 累 5 天 > 30% / 累 10 天 > 15% | 累 5 天 > 15% / 累 10 天 > 10% |
| 持續上升趨勢 | N≥14 + R²≥0.6 + monthly_rise≥25% | N≥14 + R²≥0.5 + monthly_rise≥15% |
| 離線 | 連續 ≥ 3 天 | 單日離線 |

每規則獨立執行（不 short-circuit）、可同時多 event 並存。

### PDCA 自動追蹤

- 異常標記已處理 → 系統建 PDCA action（同 row）
- 下月整月後自動算 reduction_rate
- 4 級改善：significant (≥15%) / effective (≥5%) / marginal (≥0%) / no_improvement (<0%)
- baseline = 異常前 30 天日均 / verify = 處理後下月日均

### 年度契約優化（findOptimalContract 模式）

- 2-pass coarse-to-fine grid search
- 5 變數（freq / nonSummer / semi / satSemi / off）
- 目標 = minimize (基本電費 + 超約罰金)
- Pruning 避免 O(N^5)
- 純 deterministic、非 AI

### Polling 機制

- 3 分鐘 polling（與 sensor 上雲頻率對齊）
- 非 WebSocket / SSE
- 即時監測「剩餘安全額度 = 當前時段契約 − 即時需量」（無 safety_coeff、跨時段會跳動）
