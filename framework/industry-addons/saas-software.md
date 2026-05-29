# 產業加掛｜SaaS / 軟體 / 純科技公司

純軟體公司、SaaS 服務商、API 廠商、開發者工具、雲服務商。

## 對應 13 模組的擴充

### 模組 01 產業

- SaaS 市場成熟度（Bessemer Cloud Index、SaaStr）
- 訂閱經濟成熟、PLG（Product-Led Growth）vs Sales-Led
- AI 整合潮（Copilot 化、AI-native 起義）
- 開發者生態（GitHub、開源、社群）
- 全球競爭、台灣 SaaS 對 OpenAI / Anthropic / Stripe / Notion 等

### 模組 03 問題

| 場景 | 痛點 |
|---|---|
| 客戶 churn | 客戶不續約、原因不明 |
| 新功能上線慢 | Time to Market 太長、被對手超車 |
| API 規模化 | 客戶量爆、效能 / 成本失控 |
| 多租戶隔離 | 客戶 A 看到客戶 B 資料的事故 |
| 升級 / Migration | 客戶 stuck on 舊版 |
| AI 整合 | 不導入 AI 怕被取代、導入了又怕成本失控 |
| 開發者體驗 | 文件爛、SDK 不好用、上手難 |

### 模組 05 角色（SaaS 特有）

- CTO / VPE
- Engineering（前端 / 後端 / Infra / SRE / Security / Data）
- Product
- Customer Success
- Developer Relations / DevRel
- Sales Engineering
- Compliance / Legal
- Growth

### 模組 06 資料

| 議題 | 內容 |
|---|---|
| 多租戶資料隔離 | Row-level Security、Schema 隔離、DB 隔離 |
| 跨租戶分析 | 聚合資料、客戶看不到別人 |
| 資料保留 | per-customer 不同、退費需匯出 |
| 客戶資料 vs 平台資料 | 邊界明確 |
| 訓練 AI 是否用客戶資料 | 合約寫死 |

### 模組 07 合規（SaaS 必查）

| 標準 | 觸發 |
|---|---|
| **SOC 2 Type II** | 美國客戶必問 |
| **ISO 27001** | 國際標配 |
| **GDPR** | 歐盟用戶 |
| **CCPA / 各州個資** | 美國 |
| **HIPAA + BAA** | 健康 SaaS |
| **PCI-DSS** | 支付 SaaS |
| **FedRAMP** | 美國聯邦政府客戶 |
| **CSA STAR** | 雲端資安 |
| **C5**（德國 BSI）| 德國政府 |
| **ENS**（西班牙）| 西班牙政府 |

### 模組 08 架構（SaaS 必有）

- **Multi-tenancy 架構**：Shared / Pooled / Siloed 三種模式
- **API-first**：所有功能透過 API（含 GraphQL / REST / gRPC / SDK）
- **Webhooks**：事件外送
- **Rate Limiting**
- **Authentication**：OAuth 2.0 / OIDC / SAML / API Keys / SCIM
- **Audit Logs**：客戶端可查
- **Data Residency**：客戶選擇 region
- **Sandbox / Test Environment**

→ 必看 [C4 Model](../methodologies/c4-model.md) + [Software Architecture Patterns](../methodologies/software-architecture-patterns.md)

### 模組 11 驗收 / 維運（SaaS 必有）

| 指標 | 標準 |
|---|---|
| **DORA Metrics** | 5 metrics（Elite 級）|
| **Uptime / SLA** | 99.9% / 99.95% / 99.99% |
| **Status Page** | 公開 |
| **API Latency** | P95 / P99 |
| **Error Budget** | 公開 |
| **Postmortem** | Blameless、公開（部分）|

→ 必看 [DORA + SRE](../methodologies/dora-sre.md)

### 模組 10 商務（SaaS 特有）

| 商務模式 | 內容 |
|---|---|
| **Subscription** | 月 / 年付、自動續約 |
| **Usage-based** | API call / GB / seat |
| **Tiered** | Free / Pro / Enterprise |
| **PLG（Product-Led）** | 免費試用 → 自助升級 |
| **SLG（Sales-Led）** | 業務簽 Enterprise |
| **PLS（Product-Led Sales）** | 兩者混合 |

### 強制檢查項加深

#### A RTM 加深
- 跨多版本追溯（v1、v2 同時跑）

#### D Secure SDLC 加深
- BSIMM 等級對齊
- **Bug Bounty Program** 是否有
- Responsible Disclosure 流程

#### F RTO / RPO 加深
- 必有 status page
- DORA 5 metrics
- Chaos Engineering / Game Day 頻率

#### G 退出機制 加深
- API 廢棄政策（Deprecation Policy）
- 客戶資料完整匯出 API
- 終止 N 個月後刪除 + 證明

#### H 證據包 加深
- 公開 case studies
- G2 / Capterra 評價
- 客戶 logo wall（事前授權）

## SaaS 特有議題

### Multi-tenancy 設計選擇

| 模式 | 描述 | 優 | 缺 |
|---|---|---|---|
| **Shared / Pooled** | 所有 tenant 共用 DB + schema | 成本低、運維簡單 | 隔離弱、bug 影響大 |
| **Hybrid** | 共用 DB + per-tenant schema | 平衡 | 複雜 |
| **Siloed** | 每 tenant 一套 DB / instance | 隔離強、合規好 | 成本高、運維重 |

→ 大客戶 / 受監管行業常要求 Siloed。

### API Versioning 策略

- URL versioning（/v1/, /v2/）
- Header versioning
- 棄用政策（≥ 12 個月通知）
- 客戶端 migration guide

### Developer Experience（DX）

- 文件（必：getting started、reference、cookbook）
- SDK（≥ 3 種主流語言）
- CLI
- Postman / OpenAPI / Swagger
- 範例 repo
- 社群（Discord / Slack）

### 客戶 onboarding 模式

| 模式 | 適合 |
|---|---|
| **Self-service** | PLG、小 / 中型客戶 |
| **Guided** | 中型客戶、業務 SE 介入 |
| **White-glove** | Enterprise、客製化導入 |

### Pricing Page 戰略

- 3 tier（Bronze/Silver/Gold or Starter/Pro/Enterprise）
- Free tier 抓 PLG 漏斗
- Enterprise tier 通常「聯絡業務」（隱藏定價）
- Add-ons / 加購

## SaaS 特有的反方審查問題

1. SOC 2 Type II 報告？多久 audit 一次？
2. 我們的資料會被用於訓練你方 AI 嗎？合約有寫嗎？
3. Multi-tenancy 模式？我們可以選 Siloed 嗎？
4. API 廢棄政策？多久前通知？
5. 你們的 status page 在哪？最近 90 天 uptime？
6. 客戶資料 export API 有嗎？格式？
7. 我們離開時、你方多久刪資料？怎麼證明？
8. 哪些國家 region 可選？資料是否離境？
9. Penetration test 多久一次？最近一次摘要可給？
10. Bug bounty 有嗎？最近一筆是什麼？

## SaaS 提案 anti-patterns

| AP | 內容 |
|---|---|
| 沒寫 multi-tenancy 模式 | 客戶 IT 必問、答不出來 |
| API 沒有正式版本管理 | Breaking change 客戶炸 |
| 文件殘缺 | DevRel 壓力大、客戶上手難 |
| 沒 status page | 客戶不信任 |
| 「我們符合 SOC 2」沒報告 | 法務退件 |
| 客戶資料用於訓練 AI 沒寫合約 | 客戶法務拒簽 |

## 推薦讀物 / 資源

- SaaStr（David Skok / Jason Lemkin）
- Christoph Janz 《From Zero to $100M ARR》
- Bessemer State of the Cloud Reports
- Open SaaS metrics（Net Revenue Retention、Magic Number 等）
- ChartMogul、Baremetrics（SaaS metrics 工具）
