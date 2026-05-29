# I｜部署模型決策（Deployment Model Decision）

🔴 提案 Phase 0 / 簽前必交（per 2026-05-29 Amafans EAQS retrospective 升級加入）

## 為什麼必有

過去案件 Day-1 default「Cloud-only」、後期才發現客戶實際是：
- OT 廠房 air-gap、無對外網路
- 法規要求 on-prem（金融 / 政府 / 醫療）
- 客戶有 edge gateway preference（既有 SCADA / PLC）
- Hybrid（部分 cloud + 部分 edge）才符合 RTO / 法規 / 成本

**Amafans EAQS 2026-05 retrospective 累計 12 HIGH stakes case Day-1 部署模型假設踩雷**（per `methodologies/session-retrospective.md` §2.2、IIoT × 製造 × 醫療 × 金融）— 重新報價、改架構、補 edge gateway BOM、改 SLA、爆預算。

「Cloud-only」**不能 default 假設**、必須在 Phase 0 explicit decided。

## 四種部署模型

| 模型 | 定義 | 典型適用 | 主要 trade-off |
|---|---|---|---|
| **Cloud-only** | 所有 compute / storage / ingest 都在 cloud（AWS / GCP / Azure） | SaaS B2B、純資料分析、非實時、非 OT | 最低 capex、但需可靠網路 + 資料主權合規 |
| **Edge-heavy** | Compute / storage 主要在 site edge gateway、cloud 只收 aggregated metric | 工廠 OT、實時控制、air-gap、頻寬限制 | Capex 高、edge 維運複雜、但 latency / resilience 最佳 |
| **Hybrid** | Edge buffer + cloud aggregation、明確 split（哪些 raw 留 edge / 哪些上 cloud） | 多 site IIoT、ESG 報告、PdM、medical IoT | 最常見、需明確 split rule |
| **On-prem** | 全部 compute / storage 在客戶機房、無 cloud component | 政府機密、軍工、金融核心、特定 jurisdiction | Capex 最高、客戶 IT 負擔、但合規 / data sovereignty 最強 |

## Phase 0 必過 5 問（不准 default）

| Q | 問題 | 期望答 | 不答 → 風險 |
|---|---|---|---|
| **I.1** | 客戶網路狀況？air-gap / 受限 / 一般 / 高速？ | site-by-site map | 假設「都有網路」→ ingest 設計爆 |
| **I.2** | 客戶法規 / 資料主權限制？哪些資料可離境？哪些 must on-prem？ | 明列 data class × allowed location | 簽完才發現某類資料禁雲 → 整套重做 |
| **I.3** | 客戶既有 IT/OT infra？SCADA / PLC / 既有 edge gateway / 既有雲端帳號？ | 列現有元件 + 整合點 | 自家 stack push 進去、客戶不接受 |
| **I.4** | 實時性 / latency SLA 要求？control loop 在哪一層？ | per-data-flow latency budget | Control 跑雲端 → 失效 |
| **I.5** | TCO 3-5 年敏感度？capex vs opex 偏好？ | client preference + budget envelope | 報價型態錯（SaaS vs perpetual licence）|

## 輸出（簽前必交）

### 1. 部署模型決策表

| Component | 部署位置 | 理由 | 替代方案（為何不選）|
|---|---|---|---|
| Sensor data ingest | Edge gateway buffer 5 min → cloud | 斷網 resilience | Cloud direct ingest（網路斷 = 資料漏）|
| Real-time control loop | Edge | <100 ms latency | Cloud（200-500 ms RTT 不可接受）|
| Historical aggregation | Cloud | 跨 site report | Edge（每 site 自己 BI = 工程爆）|
| User UI | Cloud SaaS | 易維運 / 跨 site 統一 | On-prem dashboard |
| Compliance archive | On-prem（客戶機房）| 法規要求 + 7 年 immutable | Cloud（資料離境風險）|

### 2. 網路 / 整合架構圖

- Site-level：sensor → gateway → buffer → upstream link
- Cloud-level：ingest → process → storage → API → UI
- 整合點：既有 SCADA / 客戶帳號 / SSO / 客戶 DC

### 3. 部署模型風險登記

| Risk ID | 描述 | 影響 | 緩解 |
|---|---|---|---|
| R-DM-1 | 網路斷 1 hr | 即時 dashboard 失效 | Edge buffer 24 hr |
| R-DM-2 | 客戶 cloud account 政策變 | ingest stop | Hybrid fallback、2 個 cloud option |
| R-DM-3 | 客戶法規變更（CBAM / PIPL）| 跨境資料禁傳 | Data residency 設計、region 切換 plan |

## 怎麼用

- **Phase 0 必跑 I.1-I.5 5 問**、答案進 [`methodologies/phase-0-discovery.md`](../methodologies/phase-0-discovery.md) Layer 5 output
- **Phase 1-2** 對齊模組 06（資料）+ 模組 07（合規）+ 模組 08（架構）+ 模組 13（系統設計）
- **簽前** 交「部署模型決策表」+「網路架構圖」+「部署模型風險登記」三件

## 對應模組（cross-ref）

| 模組 | 對應內容 |
|---|---|
| 06 資料治理 | 資料分類 × 允許部署位置 |
| 07 合規資安 | 法規 / 資料主權 / on-prem 要求 |
| 08 架構 NFR | latency budget × 部署層 |
| 09 方案分階段 | PoC（單 site）→ pilot（多 site）→ rollout |
| 10 商務報價 | capex（hardware / on-prem）vs opex（cloud SaaS）|
| 13 系統設計 MVP §9 | sensor scheme placement × edge gateway 整合 |

## 對應 add-on

| Add-on | 對應內容 |
|---|---|
| `iiot-deployment.md` | §1 Pre-flight + §3 Gateway + §5 NFR / SLA |
| `b2b2b-channel-partnership.md` | 多方 deployment liability split |
| `finance.md` | 金融委外 + on-prem 要求 |
| `government-education.md` | 政府雲 / 國產化 / TWGCB |
| `healthcare.md` | HIPAA / 病歷不離院 |
| `energy-esg.md` | 資料採集 → 計算引擎 → 報告 三層部署 |

## 反方審查問題

- 你的部署模型為什麼這樣 split？trade-off 寫了嗎？
- 客戶網路斷 1 hr 你的系統怎麼樣？
- 客戶法規變了禁止資料離境，你怎麼救？
- 我能把整套搬到 on-prem 嗎？多少錢？多少時間？
- 你 cloud 廠商 lock-in 嗎？換成另一家要多久？

## 常見地雷

- ❌ Default「Cloud-only」、Phase 0 沒問 → Day-1 大坑
- ❌ 沒寫每個 data class 的允許部署位置 → 客戶法務卡
- ❌ Latency budget 沒分層 → control loop 跑雲端、實時失效
- ❌ Edge gateway 沒考慮維運成本 → opex 爆炸
- ❌ Hybrid split rule 沒明文 → 工程後期亂 split

## Anti-pattern cross-ref

| AP | 內容 |
|---|---|
| AP-NEW-WRITE-1 | 「客戶零基礎」假設 = Cloud-only default 同類錯誤 |
| AP-P0-1 | 跳過 Phase 0 = I.1-I.5 沒問 → Day-1 大坑 |
| AP-NEW-SENSOR-3 | Vendor 默認 sensor scheme copy-paste = vendor 默認部署 model copy-paste 同類 |

完整 anti-pattern 索引 → [`../anti-patterns.md`](../anti-patterns.md)

## 證據要求（搭 H 證據包）

- 過往案件部署模型決策表（去敏感）
- 網路架構圖樣本
- 部署模型 風險登記表 樣本
- Hybrid split rule 文件樣本

---

**Originating dogfood**: Amafans EAQS 2026-05 case — Phase 1 假設「Cloud SaaS」、Phase 5 才發現客戶廠房 OT air-gap、需 edge gateway buffer、整套架構改 + 報價 +30%。
