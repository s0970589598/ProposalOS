# 軟體架構 Patterns（12-Factor + DDD + Event Storming）

純軟體 / SaaS 提案的架構章節必看。

## The Twelve-Factor App

Heroku 2011 提出。**現代 SaaS / 雲原生應用的 de facto 標準**。

12 條：

| # | 原則 | 內容 |
|---|---|---|
| 1 | Codebase | 一個 codebase、多個 deploy |
| 2 | Dependencies | 顯式宣告、隔離 |
| 3 | Config | 環境變數、不在 code |
| 4 | Backing Services | 外部服務視為 attached resource |
| 5 | Build / Release / Run | 嚴格分離 |
| 6 | Processes | 無狀態、shared-nothing |
| 7 | Port Binding | export 服務 via port binding |
| 8 | Concurrency | 透過 process model 擴展 |
| 9 | Disposability | 快速啟動、優雅關閉 |
| 10 | Dev/Prod Parity | 開發、測試、prod 盡量一樣 |
| 11 | Logs | 視為 event stream、不寫檔 |
| 12 | Admin Processes | 一次性管理任務跟 prod 同環境 |

提案應用：

```
本系統符合 12-Factor App 原則：
- 環境變數從 AWS Secrets Manager 注入（#3）
- 後端服務無狀態（#6）
- Blue-Green 部署（#9）
- Dev/Prod parity via Docker（#10）
- 結構化日誌送 CloudWatch（#11）
```

→ 客戶 IT 看到 12-Factor = 知道我們是雲原生。

## Domain-Driven Design（DDD）

Eric Evans 2003 經典。
**複雜系統設計方法**。聚焦業務領域、用 ubiquitous language。

### 核心概念

| 概念 | 意思 |
|---|---|
| **Ubiquitous Language** | 業務 / 技術用同樣詞 |
| **Bounded Context** | 一個領域的邊界 |
| **Entity** | 有唯一 ID 的物件（訂單、客戶）|
| **Value Object** | 沒 ID 的值（金額、日期）|
| **Aggregate** | 一組 entity 的根 |
| **Repository** | 持久化 entity |
| **Domain Event** | 領域發生的事 |
| **Anti-corruption Layer** | 跟外部系統的翻譯層 |

### 戰術 vs 戰略

- **Tactical DDD**：Entity / Aggregate / Repository（程式層）
- **Strategic DDD**：Bounded Context、Context Map（架構層）

提案應用：

```
模組 04 流程藍圖時、用 ubiquitous language 跟客戶對齊：
- 客戶用「批次」、我們也用「批次」、不要混「lot」「batch」
- 客戶用「斷鏈」、我們也用「斷鏈」、不要叫「temperature breach」

模組 08 架構時、畫 Bounded Context Map：
- 冷鏈監控 Context
- 食品履歷 Context
- 配送追蹤 Context
- 報表分析 Context
- 各 Context 透過 Domain Event 通訊
```

## Event Storming

Alberto Brandolini 2013 提出。**集體領域建模工作坊方法**。
跟客戶一起貼便利貼、找出 Domain Events、Commands、Aggregates。

### 流程

```
1. Big Picture Event Storming（1-2 hr）
   貼所有 Domain Events（orange）

2. Process Modeling（半天）
   加 Commands（blue）、Actors（yellow）、Policies（lilac）

3. Software Design Modeling（半天）
   找 Aggregates（pale yellow）、Bounded Contexts
```

提案應用：

| 階段 | 用法 |
|---|---|
| 訪談階段（Phase 1）| Big Picture Event Storming：跟客戶找出所有事件 |
| 設計階段（Phase 3）| Process Modeling：對齊事件、流程、政策 |
| 提案中 | 附 Event Storming 照片、客戶會記得參與過 |

→ 比傳統訪談「投入感」強 10 倍。

## Microservices Patterns（Chris Richardson）

如果提案是 microservices 架構、必引用：

| Pattern | 用途 |
|---|---|
| API Gateway | 入口 |
| Service Discovery | 找服務 |
| Circuit Breaker | 防故障擴散 |
| Saga | 跨服務 transaction |
| CQRS | 命令查詢分離 |
| Event Sourcing | 事件作為 source of truth |
| Strangler Fig | 漸進取代舊系統 |
| Sidecar | 跨切面功能 |

## Hexagonal Architecture（Ports and Adapters）

Alistair Cockburn 2005。**業務邏輯跟外部隔離**。

```
        ┌──────────────────────────┐
        │      外部適配器（驅動）    │
        │   HTTP / CLI / Job        │
        └────────────┬─────────────┘
                     │
                ┌────▼────┐
                │  Ports  │
                ├─────────┤
                │  Domain │  ← 純業務邏輯、不知道外部
                │  Logic  │
                ├─────────┤
                │  Ports  │
                └────┬────┘
                     │
        ┌────────────▼─────────────┐
        │      外部適配器（被驅動）  │
        │   DB / 訊息 / 第三方 API   │
        └──────────────────────────┘
```

→ 提案軟體架構畫這個 = 顯示我們懂解耦 / 可測試。

## 跟 ProposalOS 整合

### 模組 04 流程藍圖 加 DDD ubiquitous language 段

跟客戶對齊用詞、寫進詞彙表（[GLOSSARY.md](../../GLOSSARY.md) 客戶專屬擴充）。

### 模組 08 架構 加軟體架構視角

- TOGAF 4 層（我們有）
- C4 Model（我們有）
- 加 12-Factor 對齊聲明
- 加 Bounded Context Map（DDD）
- 加 Hexagonal（如適用）
- 加 Microservices Patterns（如適用）

### 訪談階段 加 Event Storming 工作坊（可選）

對複雜 / 跨部門案件、Event Storming 比訪談有效。

## 適用客戶

| 客戶類型 | 適用度 |
|---|---|
| 純軟體 / SaaS | 必看 |
| 含開發的 IoT / 系統 | 部分 |
| 純硬體 / 純報表 | 跳過 |

## 常見錯誤

- ❌ 把 12-Factor 當宗教（有些原則不適合 stateful 系統）
- ❌ DDD 概念過度設計（小案根本不需要 Aggregate）
- ❌ Event Storming 沒帶客戶做（自己畫沒意義）
- ❌ Microservices 一律切細（很多案件 monolith 反而好）

## 推薦讀物

- 12factor.net（必讀，免費）
- Eric Evans《Domain-Driven Design》（必讀）
- Vaughn Vernon《Implementing Domain-Driven Design》
- Alberto Brandolini《Introducing EventStorming》
- Chris Richardson《Microservices Patterns》
