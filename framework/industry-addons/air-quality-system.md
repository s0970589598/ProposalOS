# 產業加掛｜Air Quality System（空品監測系統）

> **Meta-framework upgrade**：本檔為 ProposalOS framework Day-1 consultant-question bank for 空品監測案 — PM2.5 / CO₂ / VOC / 溫濕度 / CO 等室內 / 工業空品 system。聚焦 regulatory anchor / breathing zone placement / 工安門檻 alert routing 3 大特殊議題。
>
> **Scope**：B2B 空品監測 / IAQ（Indoor Air Quality）/ 工業職業衛生量測案。包含獨立空品系統 + 整合進更大平台（如 BMS / 智慧建築 / IIoT 空品模組、如 Amafans EAQS 案 PM2.5/CO₂ 部分）。
>
> **使用方式**：作為 [iiot-deployment.md](iiot-deployment.md) 的空品 sub-addon、聚焦法規 + sensor placement + alert routing 3 大空品特殊議題。20 題、4 section。
>
> **Verification status**：台灣《室內空氣品質管理法》+ 標準 verified（全國法規）。ASHRAE / OSHA / ACGIH 具體 clause 編號 ⚠️ training-印象、需 Phase 0 補驗。
>
> **Last updated**：2026-05-29（initial draft v0.1）。

---

## §0 Scope — 何時觸發本 addon

### 0.1 Trigger keyword

| 中文 keyword | 英文 keyword |
|---|---|
| 空品 / 空氣品質 / IAQ | indoor air quality / IAQ |
| PM2.5 / PM10 / 懸浮微粒 / 粉塵 | particulate matter / PM2.5 |
| CO₂ / 二氧化碳 | carbon dioxide / CO₂ |
| VOC / TVOC / 揮發性有機物 / 甲醛 | VOC / formaldehyde / HCHO |
| 室內空氣品質法 / IAQ 法 | IAQ regulation |
| Breathing zone / 呼吸區 | breathing zone |
| 工安門檻 / TLV / PEL / 職業暴露 | OSHA TLV / PEL / occupational exposure |
| ASHRAE 62.1 / CNS 3612 / OSHA 1910.1000 | — |
| Demand-Controlled Ventilation / DCV | DCV |

### 0.2 何時 NOT 用本 addon

- 純戶外空品（大氣監測站、PM2.5 公開資料）→ 不適用（B2B 客戶端 case）
- 純 odor / smell（消費型）→ 不適用 B2C
- 純化工製程氣體（CO / H2S / Cl2 / NH3）→ 用 [manufacturing.md](manufacturing.md) + 化工 ATEX addons

### 0.3 觸發後產出時機

| Phase | 對應段 |
|---|---|
| Phase 0 接案 24 hr | §1 Regulatory anchor（5 題）|
| Phase 0 site survey | §2 Sensor placement（8 題）|
| Phase 1 訪談 | §3 Alert routing（5 題）|
| Phase 2 設計 | §4 Data display（2 題）|

### 0.4 跟 iiot-deployment.md 的關係

| 議題 | 在 iiot-deployment.md | 在本檔 |
|---|---|---|
| sensor scheme 4-layer | ✅ §2 通用版 | ✅ §2 空品 deep dive |
| Gateway / data / NFR | ✅ §3-§5 通用 | — |
| **Regulatory anchor** | ⭕ Q1.10 通用 list | ✅ §1 空品 deep dive |
| **Breathing zone placement** | ⭕ Q2.3 通用 list | ✅ §2 空品 deep dive |
| **工安門檻 alert routing** | ⭕ Q5.4 通用 | ✅ §3 空品 deep dive |

---

## §1 Regulatory anchor（5 題）

**Why**：空品 sensor 部署若違反 regulatory anchor、客戶後期 audit / 第三方驗證 / 工安檢查 必被退、需重做。Day 1 必確認客戶適用哪些 anchor。

### Q1.1 — 工安規範 anchor — 台灣 CNS / 環保署 / 勞動部 OEL？

**為何問**：(a) 室內空品（一般場域、辦公 / 商場 / 學校）→ 環保署《室內空氣品質管理法》 (b) 職業場所（工廠、生產線）→ 勞動部《職業安全衛生設施規則》+《作業場所容許暴露標準》 (c) 兩者規範對象 / 門檻 / sensor 規格 不同。

**WebSearch verified**：per [全國法規資料庫《室內空氣品質標準》§2](https://law.moj.gov.tw/LawClass/LawSingle.aspx?media=print&pcode=O0130005&flno=2)、台灣室內空品 9 項標準：CO₂ 8-hr 1000 ppm / PM2.5 24-hr 35 μg/m³ / PM10 24-hr 75 μg/m³ / HCHO 1-hr 0.08 ppm / TVOC 1-hr 0.56 ppm / O₃ 8-hr 0.06 ppm / CO 8-hr 9 ppm / 細菌 1500 CFU/m³ / 真菌 1000 CFU/m³。

**Trigger**：所有空品案、Phase 0 必填。

**期望答**：(a) 客戶場所屬「公告場所」（圖書館 / 醫院 / 學校 / 政府機關 / 商場 / 大眾運輸）→ 適《IAQ 法》強制公告檢測 (b) 客戶屬一般辦公 / 製造廠 / 倉庫 → 適勞動部規範 + ISO 16000 vol 自願 (c) 客戶內部 EHS 自定標準（通常更嚴）。

**Cross-ref**：[行政院環境保護署主管法規《室內空氣品質管理法》](https://oaout.epa.gov.tw/law/LawContent.aspx?id=FL063143) + [全國法規《室內空氣品質標準》](https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=O0130005)。

### Q1.2 — ASHRAE 62.1 / 55 適用？

**為何問**：(a) ASHRAE 62.1 — 通風 + IAQ（美國 / 國際）(b) ASHRAE 55 — thermal comfort、含風速 + 溫度 + 濕度 (c) 跨國集團子公司常自願套用 ASHRAE (d) 雖然非台灣強制、但 LEED / WELL 認證需符。

**WebSearch verified**：per [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf)、CO₂ sensors ±75 ppm @600/1000/2500 ppm 認證要求、factory calibrated 每 5 年 re-cert。Per [Kaiterra ASHRAE 62.1 DCV 文章](https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv)、DCV ventilation zone 若多 room、each room 各 1 CO₂ sensor。

**Trigger**：客戶申請 LEED / WELL / 跨國集團 / 美國總部要求。

**期望答**：(a) 是否需 LEED / WELL 認證 (b) ASHRAE 62.1 IAQP（Indoor Air Quality Procedure）vs Ventilation Rate Procedure 哪一個 (c) ASHRAE 55 PMV / PPD 計算需求。

### Q1.3 — OSHA / ACGIH PEL / TLV anchor？

**為何問**：(a) 美資 / 跨國 / 出口美國產品廠 → 常自願套 OSHA TLV (b) ACGIH TLV 通常更嚴 (c) 短期 STEL / 長期 TWA / 上限 Ceiling 不同 measurement 規格。

**Trigger**：美資 / 跨國 / 出口美國 case。

**期望答**：(a) 哪些化學物質適 PEL / TLV (b) measurement 規格（TWA / STEL / Ceiling）(c) sensor 量測範圍對齊。

**⚠️ training-data 印象**：OSHA 1910.1000 Table Z-1 CO₂ PEL 5000 ppm 8-hr TWA / CO 50 ppm 8-hr TWA — 具體 Table 編號 + 數字需 [OSHA 官方 PDF](https://www.osha.gov/) verify。

### Q1.4 — 客戶產業 specific（半導體 / 食品 GMP / 製藥 ISO / 醫療）？

**為何問**：產業別決定額外 specific regulation：
- **半導體**：SEMI F-21（cleanroom 氣體 monitoring）+ ISO 14644（cleanroom 等級）
- **食品 GMP**：GMP 廠 IAQ + 細菌真菌計數 + HACCP CCP 點
- **製藥 ISO**：ISO 14644 cleanroom + GMP Annex 1
- **醫療**：ASHRAE 170 醫療設施 + HFAP / Joint Commission 認證

**Trigger**：半導體 / 食品 / 製藥 / 醫療 case。

**期望答**：(a) 客戶產業 (b) 客戶已 / 將取得認證 (c) 額外 specific 規範。

**Cross-ref**：[manufacturing.md §模組 07](manufacturing.md) + [healthcare.md](healthcare.md)。

### Q1.5 — 認證需求 — 台灣優良健康廠房 / ISO 16000 / WELL / LEED？

**為何問**：(a) 台灣優良健康廠房（衛福部）→ 含 IAQ 監測 (b) ISO 16000 vol 系列 — IAQ measurement method (c) WELL Building Standard — 含 Air feature (d) LEED v4 EQ credit — 含 IAQ assessment。

**Trigger**：客戶想申請認證 case。

**期望答**：(a) 目標認證 (b) 認證細項 (c) 我方需符合的 measurement methodology (d) third-party verifier 介入 timing。

---

## §2 Sensor placement — per breathing zone（8 題）

**Why**：sensor placement 是空品 system 對 / 錯的決勝點。Amafans EAQS 案的 §2 sensor placement 4 layer 分類就是回應「為何 PM 不能放 fan 上」這類 placement 失誤。

### Q2.1 — Grid density — per 5000 m² 多少 point？

**為何問**：(a) 過 dense → BOM 推 N× (b) 過 sparse → 死角、PM 異常測不到 → 工安門檻 false negative 風險（per AP-NEW、Amafans EAQS R-23）(c) ASHRAE 62.1 規範 breathing zone representative。

**Trigger**：所有空品案、Phase 0 必填。

**期望答**：
- ⚠️ Rule of thumb（training-印象、需 Phase 0 補驗）：每 5000 m² 3-4 個 PM 點 + 2-3 個 CO₂ 點
- 分區 — 每作業區 ≥ 1 點
- 客戶 EHS 內部標準（通常更嚴）

**Cross-ref**：[research/09 §3 Master placement table](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§3-recommended-placement-scheme) + [研究文獻 Examining IEQ Sensor Placement Strategies (arxiv)](https://arxiv.org/pdf/2504.08237)。

### Q2.2 — 高度 — breathing zone（~1.5 m）vs 天花板 vs 地面？

**為何問**：(a) breathing zone（人類呼吸高度、坐姿 0.6 m / 站姿 1.1-1.5 m）→ ASHRAE 推薦 (b) 天花板 → 偵 CO₂ 普通（CO₂ 比空氣輕）、但偵 PM 不準（粉塵沉降）(c) 地面 → 部分 dust 高、但非呼吸區。

**WebSearch verified**：per [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf)、sensor placement 應 validated 為 breathing zone representative、非 fixed location prescription。

**Trigger**：所有空品案、Phase 0 必填。

**期望答**：(a) 各 sensor 高度規範 (b) 客戶廠樓高 + 作業姿勢（坐 / 站 / 多元）(c) 法規 anchor。

### Q2.3 — 距離影響源（HVAC vent / 出入口 / 製程機台）？

**為何問**：(a) 距 HVAC supply vent 太近 → 量到供應空氣、非 room average (b) 距出入口太近 → 外部空氣 noise (c) 距製程機台 → local emission 干擾 ambient 量。

**Trigger**：Phase 0 site survey。

**期望答**：每 sensor 對 vent / door / source 的最小距離（推薦 ≥ 2-3 m 各方向）⚠️ training-印象。

### Q2.4 — 多 zone / 多區 — independent vs shared sensor？

**為何問**：(a) ASHRAE 62.1 DCV — 每 zone 必 1 個 CO₂ sensor、控制 ventilation 到最 demand 的 room (b) 多 zone shared sensor → 違反 DCV、ventilation 不準 (c) 小辦公 / 開放空間 → 可 shared。

**WebSearch verified**：per [Kaiterra DCV 文章](https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv)、where DCV ventilation zones comprised of more than one room、each room shall have a CO₂ sensor。

**Trigger**：多 zone / 多區 / DCV ventilation case。

**期望答**：(a) zone 劃分 (b) DCV 控制策略 (c) 每 zone sensor 配置。

### Q2.5 — Cross-contamination concern（廚房 vs 辦公 / 化學區 vs 清潔區）？

**為何問**：(a) 不同活動性質區域不應 cross-contaminate（廚房油煙不應進辦公）(b) sensor 必獨立 monitor 各區、不可代表整廠 average (c) 化學廠 / 半導體 → cleanroom 跟 non-cleanroom 嚴格分。

**Trigger**：多功能廠房 / 化學區 / cleanroom case。

**期望答**：(a) 區域劃分 (b) cross-contamination 風險點 (c) sensor 獨立配置。

### Q2.6 — Outdoor vs indoor baseline difference？

**為何問**：(a) PM2.5 室內值通常跟室外連動（建築氣密差）(b) 必含 outdoor reference station 才能算 indoor/outdoor ratio (c) HVAC effectiveness 評估必有 outdoor baseline。

**Trigger**：要評估 HVAC effectiveness / 過濾效率 / I/O ratio case。

**期望答**：(a) 是否需 outdoor reference (b) outdoor station 位置 (c) I/O ratio 計算頻率。

### Q2.7 — Sampling frequency by pollutant type？

**為何問**：(a) PM2.5 / CO₂ → 1-min sampling 通用 (b) HCHO / TVOC（electrochemical sensor）→ slow response、5-15 min OK (c) bacteria / fungi → 點測量、月 / 季頻率 (d) 量測頻率對齊 alert 響應時間。

**Trigger**：所有空品案、Phase 0 必填。

**期望答**：每 pollutant 對應 sampling rate + storage 規劃 + alert response time。

### Q2.8 — Calibration / NIST traceable？

**為何問**：(a) 認證 case（IAQ 法公告場所 / WELL / LEED）→ 必 NIST traceable calibration certificate (b) ISO 14001 / 9001 quality system 要求 calibration log (c) sensor drift detection 對策（per [iiot-deployment.md Q2.13](iiot-deployment.md)）。

**Trigger**：認證 case / ISO 環境管理 case。

**期望答**：(a) calibration interval (b) NIST / 經濟部標準檢驗局 traceable 需求 (c) calibration 期間 sensor 替代 (d) calibration cost band。

---

## §3 Alert routing + threshold（5 題）

**Why**：空品 alert 跟 fan / 設備 alert 不同 — 工安門檻不可漏報（false negative 致工人傷害 / 法律風險）、但 false positive 太多客戶會關掉。Day 1 必定義 alert 邏輯。

### Q3.1 — 工安門檻（instant alert）vs 監控趨勢（long-term）？

**為何問**：(a) instant alert — 超 PEL / TWA / 法規門檻 → 立即通知 + 工安動作（撤離 / 通風 / 工單）(b) long-term trend — rolling baseline / 環比 / 同比 → 慢性問題識別 (c) 兩者 alert 邏輯 / routing / response time 完全不同。

**Trigger**：所有空品案、Phase 0 必填。

**期望答**：(a) 每 pollutant 對應的 instant threshold + long-term threshold (b) 響應時間 SLA (c) escalation 規則。

### Q3.2 — Threshold by occupancy schedule（上班 / 下班 / 假日）？

**為何問**：(a) 上班 occupancy 高 → CO₂ 上升、threshold 對應 occupancy (b) 下班 / 假日 → low occupancy、CO₂ low → 不誤 trigger (c) ventilation schedule 對齊 threshold。

**Trigger**：辦公 / 商場 / 公告場所 case。

**期望答**：(a) occupancy schedule (b) per-schedule threshold (c) ventilation control 聯動。

### Q3.3 — Customer 自定義 threshold 範圍 — full / partial / locked？

**為何問**：(a) full customizable → 客戶可自定、但可能設太鬆漏報 (b) locked at 法規標準 → 法務安全、客戶不爽 (c) partial — 法規門檻 lock、predictive threshold 客戶可調。

**Trigger**：所有空品案、商務段。

**期望答**：(a) customization 範圍 (b) lock 法規門檻清單 (c) 客戶 override 流程（含 audit log）。

### Q3.4 — Anomaly detection rule — rolling baseline + Z-score / ML model / threshold only？

**為何問**：(a) threshold only → 簡單、但漏 trend anomaly (b) rolling baseline + Z-score → 偵 statistical anomaly（如連續上升）(c) ML model → 進階、但需 historical data + tuning。

**Trigger**：訂閱 / 平台案、AI 月報 case。

**期望答**：(a) anomaly detection 策略 (b) 訓練 dataset (c) false positive / negative tuning。

**Cross-ref**：[methodologies/mlops-and-ai-governance.md](../methodologies/mlops-and-ai-governance.md)。

### Q3.5 — Action item — 自動 ventilation 開大 / 通知 / 工單 trigger？

**為何問**：(a) 純通知 → 客戶人工 react、慢 (b) 自動 ventilation 聯動（DCV）→ ASHRAE 62.1 IAQP 標準做法 (c) 自動工單 trigger → 客戶 CMMS / facility management 接入。

**Trigger**：所有 alert 案。

**期望答**：(a) 每 alert 對應 action (b) 自動聯動 vs 人工 (c) 工單平台介接（客戶 CMMS / 我方 platform）。

---

## §4 Data display（2 題）

### Q4.1 — Per-zone or 整廠 aggregate？

**為何問**：(a) per-zone dashboard → 場域管理員看 (b) 整廠 aggregate → 老闆 / EHS 主管看 (c) 報告產出（IAQ 法公告場所必）→ aggregate + per-zone 都需。

**Trigger**：所有空品案。

**期望答**：(a) dashboard 分層 (b) UI hierarchy（L1 整廠 / L2 zone / L3 sensor detail）(c) 報告 export format（PDF / Excel / API）。

**Cross-ref**：[research/09 §9.4 UI mockup L1/L2/L3](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md#§9-open-questions)。

### Q4.2 — History — 1 day / 30 day / 365 day default？

**為何問**：(a) IAQ 法公告場所 → 至少 1 年歷史保存（含 raw + aggregate）(b) 一般 case 30-90 day raw + 1-2 年 hourly aggregate 通用 (c) 客戶報告需求（月報 / 季報 / 年報）對應。

**Trigger**：所有空品案、認證 case 必填。

**期望答**：(a) history retention by tier (b) export 頻率 (c) cold storage 策略。

---

## §5 Trigger conditions table

| 題號 | Critical 觸發條件 | 不 critical |
|---|---|---|
| Q1.1 | 所有空品案、Phase 0 必填 | — |
| Q1.2 | LEED / WELL / 跨國 / 美資 | 純台灣 IAQ 法 |
| Q1.3 | 美資 / 出口美國 | 純台灣 |
| Q1.4 | 半導體 / 食品 / 製藥 / 醫療 | 一般辦公 / 製造 |
| Q1.5 | 認證 case | 一般 case |
| Q2.1-2.4 | 所有空品案、Phase 0 必填 | — |
| Q2.5 | 多功能廠房 / cleanroom | 單一空間 |
| Q2.6 | HVAC effectiveness 評估 | 純 monitor |
| Q2.7-2.8 | 所有空品案 | — |
| Q3.1 | 所有有 alert case | 純 monitor、無 alert |
| Q3.2 | occupancy 變化大 case | 24/7 同 occupancy |
| Q3.3 | 訂閱 / 商務段 | — |
| Q3.4 | 平台 / AI 案 | 純 monitor |
| Q3.5 | 自動聯動 case | 純通知 |
| Q4.1-4.2 | 所有空品案、UI 設計段 | — |

---

## §6 Concrete dogfood references

### 6.1 Amafans EAQS 案 — 空品 sub-system dogfood

**Why dogfood**：本檔 §2 sensor placement 5-layer 邏輯 / §3 alert routing 都源於 Amafans EAQS 案 5 sensor 中的 PM2.5 / CO₂ 部分。

**對應**：
- Q2.1 grid density → research/09 §6 S/M/L preset PM 點數（S=2 / M=3-4 / L=6-10）
- Q2.2 breathing zone → research/09 §2.1 Layer 1
- Q3.1 工安門檻 → research/09 §8.2 R-23 PM grid density 不足 false negative

**Cross-ref**：[research/09 sensor placement consultancy](../../examples/amafans-eaqs/research/09-sensor-placement-consultancy.md)。

### 6.2 IEQ Sensor Placement Study（學術 reference）

**Source**：[arxiv 2504.08237 Examining IEQ Sensor Placement Strategies](https://arxiv.org/pdf/2504.08237)。

**Dogfood**：學術研究示範不同 sensor placement 對 IAQ 量測代表性的影響 — 本檔 Q2.1-Q2.4 placement 邏輯的 academic anchor。

---

## §7 Anti-pattern callouts

| 本檔段 | 對應 anti-pattern | 教訓 |
|---|---|---|
| §1 法規 anchor | AP-13「我們有資安 / 合規」沒細節 | 法規 anchor 必明示 clause + 數字 |
| §2.1 grid density | （AP-NEW、Amafans R-23）PM grid 不足工安門檻 false negative | RFP 必寫最低 density 規範 |
| §3.1 工安門檻 | AP-07 NFR 全寫超嚴 / 沒寫 | threshold 必對齊法規 + 實測可達 |
| §3.4 anomaly detection | AP-16 AI 沒寫評估方式 | accuracy / false rate 必 spec |
| §4.2 history retention | AP-NEW-WRITE 退出機制 | history 退出 export 必明示 |

---

## §8 Cross-ref — 對應 13 模組 / 8 強制檢查 / 其他 addon

### 8.1 對應 13 模組

| 本檔段 | 對應模組 |
|---|---|
| §1 Regulatory | [07 合規](../modules/07-compliance-security-ai-risk.md) |
| §2 Sensor placement | [08 架構](../modules/08-architecture-functional-nfr.md) + [13 系統設計](../modules/13-system-design-mvp.md) |
| §3 Alert routing | [08 架構](../modules/08-architecture-functional-nfr.md) + [11 驗收維運](../modules/11-acceptance-benefits-operations.md) |
| §4 Display | [13 系統設計 MVP](../modules/13-system-design-mvp.md) |

### 8.2 對應 8 強制檢查

| 本檔段 | 強制檢查 |
|---|---|
| §1 法規 anchor | [H 證據包](../8-mandatory-checks/H-evidence-pack.md) |
| §3 alert | [F RTO/RPO/回滾](../8-mandatory-checks/F-rto-rpo-rollback.md) |
| §3.4 anomaly | [E SBOM](../8-mandatory-checks/E-sbom-license-supply-chain.md)（ML 套件審）|
| §4 history retention | [G 退出機制](../8-mandatory-checks/G-exit-plan.md) |

### 8.3 對應其他 addon

| 本檔段 | 相關 addon |
|---|---|
| §1-§4 通用 IIoT | [iiot-deployment.md](iiot-deployment.md) |
| §2 fan-local 互動 | [hvls-fan.md §2 Q2.4](hvls-fan.md) |
| 食品 GMP | [food-logistics.md](food-logistics.md) |
| 醫療 IAQ | [healthcare.md](healthcare.md) |
| 政府公告場所 | [government-education.md](government-education.md) |

---

## §9 結論

### 9.1 解決什麼

1. **空品 system Day 1 question bank** — 20 題、法規 / placement / alert / display 四大空品特殊議題
2. **跨產業 reusable** — 辦公 / 製造 / 半導體 / 食品 / 醫療 case 都適用
3. **Amafans EAQS dogfood 標準化** — PM2.5 / CO₂ scheme 進 framework

### 9.2 用法 SOP

| 階段 | 動作 |
|---|---|
| Phase 0 接案 24 hr | §1 5 題 |
| Phase 0 site survey | §2 8 題 |
| Phase 1 訪談 | §3 5 題 |
| Phase 2 設計 | §4 2 題 |

---

**作者**：ProposalOS framework upgrade（per Amafans EAQS 2026-05-29 retro）
**版本**：v0.1 draft、2026-05-29
**Cite source**：
1. [全國法規《室內空氣品質標準》§2](https://law.moj.gov.tw/LawClass/LawSingle.aspx?media=print&pcode=O0130005&flno=2) — 台灣 9 項 IAQ 標準 ✅ verified
2. [行政院環境保護署主管法規《室內空氣品質管理法》](https://oaout.epa.gov.tw/law/LawContent.aspx?id=FL063143) ✅ verified
3. [ASHRAE 62.1-2022 Addendum ab](https://www.ashrae.org/file%20library/technical%20resources/standards%20and%20guidelines/standards%20addenda/62_1_2022_ab_20231031.pdf) — CO₂ sensor cert / DCV
4. [Kaiterra ASHRAE 62.1 DCV](https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv) — DCV multi-room
5. [arxiv 2504.08237 IEQ Sensor Placement](https://arxiv.org/pdf/2504.08237) — sensor placement strategies academic
6. [台北市環保局 IAQ 法 FAQ](https://www.dep.gov.taipei/News_Content.aspx?n=ACEFA960B5A4ACD7&s=C6AC8143DC6A4257) — 法規 FAQ
7. [Senseair CO₂ ASHRAE Addendum ab](https://senseair.com/senseair-sensors-ready-ashrae-addendum-ab/) — sensor 廠商視角

**驗證狀態**：4 個 verified URL（台灣法規 + ASHRAE 官方）+ 3 個 ⚠️ training-data hedged claim（OSHA Table Z-1 編號 / ACGIH TLV 具體值 / CNS 3612 § 編號 / 業界 rule of thumb grid density / 距 vent 最小距離）。
