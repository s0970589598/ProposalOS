# Cynefin Framework

Dave Snowden 1999 提出，IBM、Cognitive Edge 推廣。
**元方法**：決定一個情境該用什麼方法。

威爾斯語 Cynefin（kuh-NEV-in）= 棲息地、所屬感。

## 五個情境

```
                  ┌──────────────────────────┐
                  │  Complex（複雜）         │
                  │  → Probe-Sense-Respond   │
                  │  emerging practice       │
                  │  事先不知對錯、要實驗      │
                  ├──────────────────────────┤
                  │  Complicated（繁雜）     │
                  │  → Sense-Analyze-Respond │
                  │  good practice           │
                  │  專家可分析、有對錯       │
   Chaotic ───────┼──────────────────────────┼─────── Clear / Simple
   → Act-Sense-   │       Disorder           │       → Sense-Categorize-Respond
   Respond        │      (不知屬於哪)         │       best practice
   novel practice │                          │       明顯因果、SOP 解
   立刻止血、別分析│                          │
                  └──────────────────────────┘
```

## 五個情境怎麼判斷

| 情境 | 因果關係 | 判斷方式 | 對應方法 |
|---|---|---|---|
| **Clear / Simple** | 明顯 | 事先看就知道 | Best Practice、SOP、流程化 |
| **Complicated** | 可分析 | 專家分析能找到答案 | Good Practice、顧問 / 專家 / 標準框架 |
| **Complex** | 事後才知 | 跑了才知道 | Emerging Practice、Pilot、實驗、A/B |
| **Chaotic** | 無因果 | 已經失控 | Novel Practice、止血優先、別分析 |
| **Disorder** | — | 不確定屬於哪 | 先想辦法歸到上面 4 個 |

## 提案的核心錯誤：one-size-fits-all

我們的 ProposalOS 默認所有客戶 / 情境用同樣方法、是 **Complicated 思維**（用標準框架解）。

但實務上：

| 情境 | 客戶範例 | 提案策略 |
|---|---|---|
| Simple | 客戶說「就照 A 公司做的」、有 SOP | 用標準 template、報價快 |
| Complicated | 客戶要做 ERP、有專家可問 | 用 12 模組完整跑、用標準框架 |
| Complex | 客戶要做新 AI 應用、誰都不知怎麼弄 | 不要 over-promise、先 PoC 再展開 |
| Chaotic | 客戶剛爆食安事件、要立刻救 | 別寫完整提案、直接動手解 |

## 不同情境的提案策略

### Simple 情境

| 特徵 | 對應 |
|---|---|
| 因果清楚 | 用 Short template |
| 客戶有過經驗 | 不用過度分析 |
| 競品方案類似 | 拼價格 / 服務 |
| 風險低 | 短交期 |

範例：明陽食品要加 1 個倉的溫度監控（已有同款監控）→ Simple

### Complicated 情境

| 特徵 | 對應 |
|---|---|
| 因果可分析 | 用 Standard / Enterprise template |
| 需要專家評估 | 完整 12 模組跑過 |
| 有多選項 | 給三方案 |
| 風險可估算 | 風險登記表 |

範例：明陽食品要從 0 建立 IoT 冷鏈系統 → Complicated（**目前 ProposalOS 主場**）

### Complex 情境

| 特徵 | 對應 |
|---|---|
| 因果事後才知 | 不要 over-promise |
| 沒人做過 | 先 PoC、再展開 |
| 客戶也不確定要什麼 | 用 JTBD + Design Thinking |
| 學費型成本 | 預算分階段、留變更空間 |

範例：明陽要做「AI 配送預測」（業界都沒人成熟做過）→ Complex
**對應策略**：
- 提案先談 PoC 50 萬、3 個月
- PoC 後再決定要不要展開正式系統
- 不要先報 500 萬完整方案

### Chaotic 情境

| 特徵 | 對應 |
|---|---|
| 危機中 | 別寫完整提案 |
| 客戶要立刻動 | 直接派 senior 顧問支援 |
| 預算次要 | 先穩定再算錢 |

範例：明陽剛爆食安事件、要 1 週內弄個追溯系統 → Chaotic
**對應策略**：
- 不要花 2 週寫提案
- 直接派人駐點、用 LOI（Letter of Intent）先動工
- 1 個月後再補正式合約

## 怎麼整合進提案流程

### 階段 0（判斷接不接）後、加一個 Cynefin 判斷

```
線索進來
   ↓
階段 0：判斷接不接
   ↓
⭐ Cynefin 判斷：這案屬於哪個情境？
   ↓
   ├── Simple → 用 Short template、短訪談
   ├── Complicated → 跑完整 ProposalOS（預設）
   ├── Complex → 先 PoC、再展開
   ├── Chaotic → 派人駐點、LOI 先行
   └── Disorder → 先訪談釐清屬於哪個
   ↓
階段 1+...
```

### 客戶情境會跳動

同一個客戶不同部分可能在不同情境：

| 明陽案例 | 情境 |
|---|---|
| 冷鏈監控 | Complicated |
| 食品履歷 | Complicated |
| AI 配送預測 | Complex |
| 食安事件應變 | Chaotic |

→ 提案要**分區處理**、不要全部當 Complicated 寫。

## 跟其他方法論的關係

| 方法論 | 適用情境 |
|---|---|
| Waterfall | Simple、Complicated |
| Agile / Scrum | Complex |
| Lean / Kanban | Complicated、Complex |
| Design Thinking | Complex |
| Crisis Management | Chaotic |

提案如果要用 Agile、要明確跟客戶解釋「為什麼用 Agile」= 因為這案是 Complex。
不要在 Simple 案上硬塞 Agile（顯得在玩花樣）。

## 常見錯誤

- ❌ 把 Complex 案當 Complicated 寫（over-promise、提案太死、後續炸）
- ❌ 把 Simple 案當 Complicated 寫（提案太重、客戶懶得看）
- ❌ Chaotic 還在寫提案（客戶已經氣炸）

## 推薦讀物

- Dave Snowden《Cynefin: Weaving Sense-Making into the Fabric of Our World》
- HBR 文章：A Leader's Framework for Decision Making
- cognitive-edge.com
