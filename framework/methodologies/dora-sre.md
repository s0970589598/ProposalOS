# DORA Metrics + SRE

軟體型客戶 / 含開發運維的提案的維運段必看。
**Google SRE + DORA 是業界 DevOps / 平台工程事實標準**。

## DORA Metrics（5 個關鍵指標）

DevOps Research and Assessment（Google Cloud 旗下）。每年發《Accelerate State of DevOps Report》。

原本 4 metrics、**2021 加入 Reliability**（第 5 個）、後續報告又調整命名。

| 指標 | 意思 | Elite / High / Medium / Low |
|---|---|---|
| **Deployment Frequency** | 多常部署到 prod | 每天多次 / 每週多次 / 每月 / 每季 |
| **Lead Time for Changes** | commit → prod 多久 | 1hr 內 / 1 週內 / 1 月內 / > 6 月 |
| **Change Failure Rate** | 部署失敗率 | 0-15% / 16-30% / 31-45% / 46%+ |
| **Time to Restore Service**（原 MTTR）| 失敗後復原（DORA 2022 正式更名）| < 1hr / < 1 day / < 1 week / > 6 月 |
| **Reliability**（2021 新加）| 服務可靠度、達 SLO 比例 | 依目標 |

→ 5 個指標一起看、不要單看一個。
→ MTTR 是傳統業界詞、DORA 已改用 **Time to Restore Service**（更精確）。

### 為什麼提案要寫 DORA

提案維運段如果只寫「7×24 支援、4hr 回應」、客戶 IT 會覺得業餘。
寫 DORA Metrics → 顯示我們**用業界共識的方式量化軟體運維**。

範例：

> 「本系統採 CI/CD 自動化部署。預計達成：
> - Deployment Frequency：每週 2-3 次（Elite 級）
> - Lead Time for Changes：commit 後 4hr 內到 prod（Elite 級）
> - Change Failure Rate：< 10%（Elite 級）
> - MTTR：< 1 hr（Elite 級）」

## SRE（Site Reliability Engineering）

Google 2003 發明、書出版 2016。**現代雲端 / SaaS 維運標準**。

### SLO / SLI / SLA 的差別（必懂）

| 縮寫 | 對誰 | 範例 |
|---|---|---|
| **SLI** | 內部測量 | 「API 回應 < 200ms」 |
| **SLO** | 內部目標 | 「99.9% 的 API 回應 < 200ms」（內部目標）|
| **SLA** | 對客戶承諾 | 「99.5% 可用率、違約賠 10%」（合約寫，比 SLO 寬鬆）|

⚠️ **SLA 是合約承諾、SLO 是內部追的目標、SLO 必須比 SLA 嚴**。
例：對客戶承諾 99.5%（SLA）、內部目標 99.9%（SLO）→ 比承諾還早警示、有緩衝。

### Error Budget（誤差預算）

`Error Budget = 100% - SLO`

99.9% SLO → 0.1% error budget = 一個月 43 分鐘 downtime 額度。

| Error Budget 狀態 | 對應動作 |
|---|---|
| 有餘額 | 可以放新版、可以實驗、可以承擔風險 |
| 快用完 | 暫停新功能、優先穩定性 |
| 用完 | Freeze、只做穩定性修補 |

→ Error Budget 是**開發 vs 運維的內部仲裁**：
- 開發想衝新功能、用掉預算
- 運維要穩定、不希望用掉預算
- 預算用完 = 開發必須暫停

### Toil（重複手動工作）

SRE 經典定義：
- 手動的
- 重複的
- 可自動化的
- 戰術性（不是策略性）
- 沒長期價值
- 隨服務 scale 線性增長

→ SRE 團隊應該把 **Toil < 50%** 工作時間。
→ 提案維運段可寫「我方 SRE 自動化 X、客戶端可省 Y 工時」。

### Blameless Postmortem

事故後寫檢討、**不歸咎個人**、聚焦系統性問題。
**Google、Etsy、Netflix 公開的範本**都是 blameless 風格。

提案可寫：「事故 24hr 內提供 blameless postmortem、含 root cause、impact、action items。」

### Game Day / Chaos Engineering

定期模擬故障、驗證 SRE 流程。
**Netflix Chaos Monkey** 是知名實踐。

提案可寫：「每季 game day 一次、驗證 RTO/RPO、客戶可派員觀察。」

## 觀測性三支柱（Three Pillars of Observability）

| 支柱 | 內容 | 工具範例 |
|---|---|---|
| **Logs** | 系統日誌 | CloudWatch Logs、Loki、ELK |
| **Metrics** | 系統指標 | CloudWatch Metrics、Prometheus、Datadog |
| **Traces** | 分散追蹤 | AWS X-Ray、Jaeger、OpenTelemetry |

近年加上 **Events** 變四支柱（OpenTelemetry 標準）。

提案維運段必標：
- 我們提供哪三 / 四支柱
- 保留多久（log 90 天、metric 1 年 等）
- 客戶能不能 access dashboard

## 平台工程（Platform Engineering）

2022 起興起、Internal Developer Platform（IDP）概念。
為**軟體型大客戶**提案時可提：

> 「我方提供 IDP（Internal Developer Platform）讓客戶 IT 自助部署、減少 toil 60%」

## 跟 ProposalOS 整合

### 模組 11 驗收維運 增加

| 子段 | 加什麼 |
|---|---|
| SLA | 加 SLI / SLO / SLA 三層、給內部目標數字 |
| 監控 | 加 三 / 四支柱、保留期 |
| 事故處理 | 加 Blameless Postmortem、MTTR |
| 演練 | 加 Game Day、頻率 |
| 自動化 | 加 Toil 比例、降低多少 |

### 強制檢查項 F（RTO / RPO）增加

- 補 DORA 4 metrics
- 補 Error Budget 概念
- 補 Postmortem 流程

### 適用客戶

| 客戶類型 | DORA / SRE 適用度 |
|---|---|
| 純軟體 SaaS | 必說、客戶會驗 |
| 含軟體開發的 IoT | 寫一部分 |
| 純硬體 / 純報表 | 跳過、會顯得 over-engineering |

## DORA Elite 等級條件（給客戶看的）

| 指標 | Elite |
|---|---|
| Deployment Frequency | On-demand（多次/天）|
| Lead Time for Changes | < 1 hr |
| Change Failure Rate | 0-15% |
| Time to Restore Service | < 1 hr |
| Reliability | 持續達 SLO（依組織目標）|

→ 寫進提案 = 訊號客戶「我們是業界一流水準」（前提：我們真的能做到）。

⚠️ 不要 over-promise。實際做不到 Elite 別寫 Elite、寫實際數字。

## 推薦讀物

- Google SRE 三部曲：
  - 《Site Reliability Engineering》（必讀）
  - 《The Site Reliability Workbook》
  - 《Building Secure & Reliable Systems》
- DORA《Accelerate State of DevOps Report》（年度）
- 《Accelerate》（DORA 創辦人寫的書）
- 《The Phoenix Project》《The Unicorn Project》（DevOps 小說）

## 跟其他框架的關係

| 框架 | 跟 SRE / DORA 關係 |
|---|---|
| ITIL 4 | ITIL 從傳統 IT 演化、SRE 從 Google 演化、近年互相借用 |
| DevOps | SRE 是 DevOps 的具體實作之一 |
| Platform Engineering | SRE 的進化版、聚焦平台 |
| GitOps | SRE 部署模式之一 |
| FinOps | SRE + 雲成本管理 |
