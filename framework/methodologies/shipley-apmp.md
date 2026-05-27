# Shipley / APMP 提案方法論

業界寫大型 RFP / 政府標案的權威方法論。
**全球 Fortune 500 內部提案部門幾乎都用這套**。

## 兩個來源

- **Shipley Proposal Guide**（Shipley Associates，公司 1972 創立、Proposal Guide 1990s 初版、目前約第 5 版）
- **APMP**（Association of Proposal Management Professionals，提供 CP / PPP / CPP 認證）

我們現在的 ProposalOS 等於部分重新發明這套。本檔把 Shipley 的關鍵概念整合進來。

## 何時必用 Shipley 思維

- 政府採購（招標公告 + 規格書 + 評選）
- 國營事業
- 大型集團採購（含母公司核准、上市櫃 SI 案）
- 標案金額 ≥ 500 萬
- 多家廠商競標

中小型案件可以 cherry-pick 概念、不必整套照搬。

## 7 個關鍵概念

### 1. Bid / No-Bid Decision（正式評分）

不是「老闆想做就做」、是用評分表決策。

| 維度 | 分數（1-5）| 權重 |
|---|---|---|
| 我們能贏的機率 | | 25% |
| 我們的能力契合度 | | 20% |
| 預算 / 利潤 | | 15% |
| 戰略價值（產業、reference） | | 15% |
| 客戶關係 / Coach 強度 | | 15% |
| 競爭格局（對手強弱） | | 10% |

加權後 < 3.0 → No Bid。

⚠️ 沒有 Bid/No-Bid 紀律，會花大量時間寫永遠贏不了的案。

### 2. Capture Plan（搶單計畫）

**提案前的情報蒐集與佈局**。Shipley 認為**提案寫之前的工作占成功因素 70%**。

Capture Plan 必有：

| 項目 | 內容 |
|---|---|
| 客戶分析 | 組織、決策鏈、預算、痛點、戰略 |
| 競爭對手分析 | 誰會競、優劣、過去成績 |
| 我方能力對應 | 我們有什麼、缺什麼、怎麼補 |
| Win Themes | 為什麼客戶要選我們（3-5 個） |
| Discriminators | 我們有、對手沒有（要可驗證）|
| Ghost themes | 對手有但我們攻擊的角度（暗示不點名）|
| 客戶關係佈局 | Coach、Blocker、Sponsor、Champion |
| 訪客計畫 | 訪幾次、誰、什麼時候 |
| 風險與緩解 | 我們會卡在哪 |

→ 用 [templates/capture-plan-template.md](../../templates/capture-plan-template.md)。

### 3. Win Themes / Discriminators

**Win Theme**：客戶為什麼要選我們的論述（3-5 個）。
**Discriminator**：我們有但對手沒有 / 不會做（必須可驗證）。

| 強度 | 描述 | 範例 |
|---|---|---|
| Strong Discriminator | 我們有、對手都沒有、客戶在乎 | 唯一做過該產業 8 個 case |
| Weak Discriminator | 我們有、部分對手沒有 | ISO 27001 認證 |
| Parity | 大家都有 | 7×24 支援 |
| Disadvantage | 對手有、我們沒有 | 上市公司 vs 我們未上市 |

→ Win Theme 要重複出現在提案的執行摘要、各章節結論。

### 4. Ghosting（暗示對手弱點不點名）

不能寫「A 公司沒做過台灣食安」，但可以寫：

> 「本案需要深度貼合台灣食安法的廠商，過去 N 年累積 8 個食品產業 case，這是任何國際大廠在 6 個月時程內難以複製的優勢。」

讀到的人會自己對應到 A 公司。**高端技巧**，要練。

### 5. Pink / Red / Gold Team Reviews（多階段審查）

我們現在只有「反方審查」（= Red Team）、Shipley 是三階段：

| 階段 | 何時 | 焦點 | 角色 |
|---|---|---|---|
| **Pink Team** | 提案完成 50% | 結構、覆蓋度、Win Themes | 內部 + 1 個外部友善視角 |
| **Red Team** | 提案完成 90% | 反方視角、找漏洞、競品比較 | 模擬客戶、找碴 |
| **Gold Team** | 提案完成 100%、送出前 | 高層核可、政策對齊 | 公司高層 |

→ Pink Team 是早期內審，能修；Red Team 是模擬敵人，找碴；Gold Team 是高層拍板。

### 6. Compliance Matrix（政府 RFP 必有）

招標公告通常規定一堆「廠商必須」、「廠商應」、「廠商需」。
Compliance Matrix 是**逐條對應**：

| 招標條款 | 條文 | 我方對應章節 | 對應程度 | 備註 |
|---|---|---|---|---|
| 1.2.3 | 廠商需具備 ISO 27001 | §8.4 | 完全符合 | 證書附錄 A |
| 2.3.1 | 廠商應提供 7×24 支援 | §11.3 | 完全符合 | SLA 等級 Gold |
| 3.1.5 | 廠商需具備 5 年以上經驗 | §1.3 | 部分符合 | 我方 4.5 年、提供同等案件 |

→ 政府評選委員逐條對照、漏 1 條就被扣分或 disqualify。

→ 用 [templates/compliance-matrix-template.md](../../templates/compliance-matrix-template.md)。

### 7. Storyboarding 提案

不是直接寫文件、而是先：

```
每個章節：
- 標題
- 1 句結論
- 3-5 個 bullet 支持點
- 圖 / 表
- 對應的 Win Theme
```

全部章節 storyboard 完、再展開寫內文。
**避免寫完才發現結構失衡**。

## Shipley 提案專案管理角色

大型提案有 6 個角色（小案可一人多角）：

| 角色 | 職責 |
|---|---|
| Capture Manager | 提案前情報、客戶關係、Win 策略 |
| Proposal Manager | 提案過程管理、時程、品質 |
| Solution Architect | 技術方案、架構 |
| Pricing Lead | 報價、商務條款 |
| Production / Editor | 排版、編輯、視覺 |
| Reviewer | Pink / Red / Gold Team |

GoodLinker 中型案件通常**業務 = Capture、PM = Proposal Manager + Production、Tech Lead = Architect**。

## 跟 ProposalOS 12 模組怎麼對應

| ProposalOS 12 模組 | Shipley 對應 |
|---|---|
| 01-02 產業 + 競品 | Capture Plan 的客戶 + 對手分析 |
| 03 問題目標 | 客戶痛點 + KPI（同） |
| 05 角色 RACI | Capture Plan 的關係佈局 |
| 09 方案 | Solution + Win Themes |
| 10 報價 | Pricing |
| 12 風險反方 | Red Team |

→ Shipley 是**提案專案管理**、ProposalOS 是**提案內容架構**。兩者互補不衝突。

## 推薦做法

| 案件規模 | Shipley 採用程度 |
|---|---|
| < 50 萬（Short）| 跳過 Shipley、只用 ProposalOS 12 模組 |
| 50-500 萬（Standard）| 借 Win Themes + Discriminators + Pink/Red Team |
| 500 萬+ / 政府 / 大標 | **整套用**：Capture Plan + Win Themes + Compliance Matrix + Pink/Red/Gold |

## 參考

- Shipley Proposal Guide（書）
- APMP Body of Knowledge
- APMP CP / PPP / CPP 認證
- shipleywins.com
- apmp.org
