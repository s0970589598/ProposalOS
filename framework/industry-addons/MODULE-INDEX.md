# 從模組看 Add-on 反向索引（13 add-on × 13 模組）

正向索引：[add-on 看擴充哪些模組](README.md)。
反向索引（本檔）：**從模組看哪些 add-on 會擴充它**。

13 add-on 分兩類：
- **9 個產業 add-on**（依客戶屬於哪個產業）：製造 / 醫療 / 政府 / 金融 / 零售 / ESG / 食品 / SaaS / 營建
- **4 個場景 add-on**（per 2026-05-29 Amafans EAQS retro 新加、依案件樣態跨產業適用）：IIoT 部署 / HVLS 風扇 / 空品系統 / B2B2B 通路聯名

## 索引表 — 9 產業 add-on

| 模組 | 製造 | 醫療 | 政府 | 金融 | 零售 | ESG | 食品 | SaaS | 營建 |
|---|---|---|---|---|---|---|---|---|---|
| **01 產業市場** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **02 競品替代** | | | ✅ | | | | | ✅ | |
| **03 問題目標** | ✅ | ✅ | | | ✅ | ✅ | ✅ | ✅ | ✅ |
| **04 流程藍圖** | ✅ | | | | | | | | ✅ |
| **05 角色 RACI** | | | ✅ | ✅ | ✅ | | | ✅ | ✅ |
| **06 資料治理** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **07 合規資安** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **08 架構 NFR** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **09 方案分階段** | | | | | | | | | |
| **10 商務報價** | | | ✅ | ✅ | | | | ✅ | ✅ |
| **11 驗收維運** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **12 風險反方** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **13 系統設計 MVP** | ✅ | ⭕ | | | | ✅ | ✅ | ✅ | ⭕ |

## 索引表 — 4 場景 add-on（新加、per Amafans EAQS retro）

| 模組 | IIoT 部署 | HVLS 風扇 | 空品系統 | B2B2B 聯名 |
|---|---|---|---|---|
| **01 產業市場** | ✅ | ✅ | ✅ | ✅ |
| **02 競品替代** | ✅ | ✅ | ⭕ | ✅ |
| **03 問題目標** | ✅ | ✅ | ✅ | ✅ |
| **04 流程藍圖** | ✅ | ⭕ | ⭕ | ⭕ |
| **05 角色 RACI** | ✅ | ⭕ | ⭕ | ✅ |
| **06 資料治理** | ✅ | ✅ | ✅ | ⭕ |
| **07 合規資安** | ✅ | ⭕ | ✅ | ✅ |
| **08 架構 NFR** | ✅ | ✅ | ✅ | ⭕ |
| **09 方案分階段** | ✅ | ⭕ | ⭕ | ⭕ |
| **10 商務報價** | ✅ | ✅ | ⭕ | ✅ |
| **11 驗收維運** | ✅ | ✅ | ✅ | ✅ |
| **12 風險反方** | ✅ | ✅ | ✅ | ✅ |
| **13 系統設計 MVP**（含 §9 Sensor Scheme）| ✅ | ✅ | ✅ | ⭕ |

## 4 個新場景 add-on 觸發條件

| Add-on | 觸發 keyword | 必同步觸發 | 主要 dogfood |
|---|---|---|---|
| [iiot-deployment.md](iiot-deployment.md) | factory / sensor / OT / MQTT / Modbus / OPC UA / gateway / PdM / OEE | 模組 13 §9 + `methodologies/cr-handling-protocol.md` | Amafans EAQS（HVLS × IAQ × power × B2B2B）|
| [hvls-fan.md](hvls-fan.md) | HVLS / 工業風扇 / 大型風扇 / Big Ass / Macroair | iiot-deployment + air-quality-system（若同時收空品）| 同上 |
| [air-quality-system.md](air-quality-system.md) | 空品 / PM2.5 / CO₂ / VOC / IAQ / 室內空氣 | iiot-deployment + 模組 13 §9 Layer 1（ambient）| 同上 |
| [b2b2b-channel-partnership.md](b2b2b-channel-partnership.md) | 聯名 / 通路 / OEM × PaaS × 終端 / channel partner / RFP-style joint | `methodologies/phase-0-discovery.md` Q1.6 B2B/B2B2B scope | Amafans × GoodLinker × 工廠 case |

## 各模組對應的 add-on 內容

### 模組 01 產業市場
所有 add-on 都會擴充 — 各產業 + 4 個場景都有自己的市場規模、趨勢、玩家。

### 模組 02 競品替代
- [政府教育](government-education.md)：政府採購流程造就特殊「競品」生態（限制性招標）
- **IIoT 部署**：MES / SCADA / 雲端 IoT PaaS 三類競品
- **HVLS 風扇**：Big Ass / Macroair / 永磁 / 國內 OEM
- **B2B2B 聯名**：「不聯名 vs 聯名 vs 反向 OEM」三類

### 模組 03 問題目標
- [製造](manufacturing.md)：人機料法環痛點
- [醫療](healthcare.md)：病歷、排班、用藥、長照場景
- [零售](retail-ecommerce.md)：庫存、會員、訂單、金流、物流
- [能源 ESG](energy-esg.md)：碳盤查、能源管理
- [食品物流](food-logistics.md)：溫度、效期、追溯
- **IIoT 部署**：sensor scheme、PdM、OEE
- **HVLS 風扇**：ROI 量化、節能 baseline
- **空品系統**：法規 anchor、breathing zone 量測
- **B2B2B 聯名**：commercial split、liability split

### 模組 04 流程藍圖
- [製造](manufacturing.md)：訂單 → 生管 → 製造 → 品管 → 出貨；班次設計
- **IIoT 部署**：sensor → gateway → edge → cloud → app 5 階段

### 模組 05 角色 RACI
- [政府教育](government-education.md)：機關承辦、採購委員會、主計政風、議會
- [金融](finance.md)：法令遵循、風險管理、內稽內控、CISO
- [零售](retail-ecommerce.md)：營運、行銷、採購、物流、客服
- **IIoT 部署**：客戶 OT / 客戶 IT / 我方工程 / 我方業務 / OEM 三方對接
- **B2B2B 聯名**：誰擁 customer / 誰擁 brand / 誰擁 SLA / 誰擁 P&L

### 模組 06 資料治理
**所有 add-on 都擴充**：
- 製造：PLC / SCADA / OPC UA
- 醫療：HL7 FHIR / DICOM / ICD
- 政府：身分證字號嚴格保護、My Data
- 金融：客戶資料分級、跨境
- 零售：多通路會員拼接
- 能源 ESG：排放係數、活動數據
- 食品：批號、效期、溫度
- **IIoT 部署**：MQTT topic schema、邊緣 buffer、cloud ingest schema
- **空品系統**：sensor calibration / firmware version 追蹤

### 模組 07 合規資安 AI
**所有 add-on 都擴充** — 每個產業 + 場景有專屬法規：
- 製造：IATF 16949、ISO 14001
- 醫療：HIPAA、TFDA、SaMD
- 政府：資通安全責任等級、TWGCB
- 金融：委外辦法、PCI-DSS、AML
- 零售：消保法、PCI-DSS
- 能源 ESG：ISO 14064、CBAM、TCFD
- 食品：HACCP、ISO 22000
- **IIoT 部署**：IEC 62443（OT 資安）、ISA-95
- **空品系統**：ASHRAE 62.1 / CNS 3612 / 台灣《室內空氣品質管理法》
- **B2B2B 聯名**：3 方資料處理 DPA、liability split、商標授權

### 模組 08 架構 NFR
**所有 add-on 都擴充**：
- 製造：Purdue / ISA-95 分層、IT/OT 隔離
- 醫療：24/7 不停機、跨院整合
- 政府：政府雲、TWGCB、國產化
- 金融：99.99% 可用、HSM、雙活
- 零售：高峰擴展、CDN、即時庫存
- 能源 ESG：資料採集 → 計算引擎 → 報告
- 食品：邊緣告警、多溫層
- **IIoT 部署**：edge gateway buffer / store-and-forward / 斷網 resilience
- **HVLS 風扇**：fan-local 振動 / RPM sensor 整合
- **空品系統**：sensor placement grid、breathing zone height

### 模組 09 方案分階段
沒有特定產業差異化擴充 — 但實務上分階段策略受產業特性影響（例：醫療不能 Big Bang）。
**IIoT 部署**：PoC → 1 site pilot → multi-site rollout 三階段。

### 模組 10 商務報價
- [政府教育](government-education.md)：政府採購法、押標金、評選方式
- [金融](finance.md)：母公司核准、第三方供應商風險評估
- **IIoT 部署**：S/M/L BOM tier + variance hedge
- **HVLS 風扇**：fan + sensor + 整合費分開報
- **B2B2B 聯名**：rev share / margin split / referral fee 三種 model

### 模組 11 驗收維運
**所有 add-on 都擴充**：
- 製造：OEE、MTBF/MTTR、稼動率
- 醫療：臨床驗證、平行測試、不良事件通報
- 政府：嚴格 SOW 驗收、違約金、履約保證
- 金融：內稽 / 外稽 / Pen Test、上線需主管機關核准
- 零售：客單價、轉換、留存、ROAS、NPS
- 能源 ESG：第三方查證、報告產出
- 食品：溫度紀錄完整率、追溯時間、召回演練
- **IIoT 部署**：sensor uptime、gateway uptime、cloud ingest 完整率
- **空品系統**：sensor calibration drift、年度校正
- **B2B2B 聯名**：joint review meeting cadence、escalation path

### 模組 12 風險反方
**所有 add-on 都擴充** — 每個產業 + 場景都有專屬反方審查題。
- **IIoT 部署**：R-22 sensor placement / R-23 法規 anchor / R-24 vendor lock-in（per Amafans EAQS dogfood）
- **B2B2B 聯名**：通路衝突、定價衝突、客戶歸屬爭執

### 模組 13 系統設計 MVP（含 §9 Sensor Scheme Decision Matrix）
- **IIoT 部署**：§9 4-layer physical-quantity 分類 + S/M/L tier
- **HVLS 風扇**：Layer 2 asset-local（fan-local 振動 / RPM）
- **空品系統**：Layer 1 ambient（PM2.5 / CO₂ / VOC）

## 使用建議

- 提案開頭先選 add-on（依客戶屬性 + 案件樣態 1-3 個重點）
- 對照本表知道**哪些模組會被擴充**
- 寫對應模組時翻開 add-on 取用內容
- 不在這張表上的 add-on × 模組組合 → 不用擴充，回用模組通用版即可

## 與 dogfood 關係

4 個新場景 add-on 都源自 **Amafans EAQS 2026-05 真實顧問案**（HVLS fan × IAQ × power × B2B2B PaaS 整合）retrospective accumulated lesson。dogfood reference：

- `methodologies/session-retrospective.md` §2.2 Amafans EAQS 19 翻車事件
- `modules/13-system-design-mvp.md` §9.8 dogfood — generalization 範例（含 §9.8.1 Amafans 原 case）
- `anti-patterns.md` AP-NEW-SENSOR-1 ~ 5（per 模組 13 §9）
