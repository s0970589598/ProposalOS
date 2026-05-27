# Wardley Mapping

Simon Wardley 提出（2005）。
**戰略定位地圖**：把價值鏈映到技術演化階段。

## 兩個軸

```
價值鏈
（給客戶的價值）
    ↑
    │  使用者需求
    │       │
    │       ▼ 依賴
    │   元件 1
    │       │
    │       ▼
    │   元件 2
    │
    └─────────────────────→ 演化階段
       Genesis  Custom  Product  Commodity
       創造期   客製期  產品期   公用期
```

## 四個演化階段

| 階段 | 特徵 | 範例（雲端歷史） | 戰略 |
|---|---|---|---|
| **Genesis（創造）** | 不確定、實驗、稀少、昂貴 | 2002 年的雲端 | 自建、研究、PoC |
| **Custom（客製）** | 部分知道怎麼做、每個客戶不同 | 2006-2010 雲端 | 顧問、客製化專案 |
| **Product（產品）** | 標準化、SaaS、有替代 | 2010-2018 雲端 | 買產品、選廠商 |
| **Commodity（公用）** | 像水電、規模化、便宜 | 2020+ 雲端 | 用 utility 計費、不要自建 |

每個元件都在某個階段、且**會往右移動**（時間進化）。

## 跟 ProposalOS 整合

### 模組 02 競品分析 + 模組 09 方案

用 Wardley 幫客戶判斷：

| 客戶問 | Wardley 答 |
|---|---|
| 「這個我們該自己做還是外包？」 | 看演化階段。Genesis/Custom → 外包 / 顧問；Product/Commodity → 買產品 |
| 「為什麼選你不選 A 公司？」 | 我們在 Custom 階段、A 公司還在 Genesis、客戶該選成熟方案 |
| 「我們該不該自建雲端？」 | 雲端已 Commodity、別自建（直接用 AWS / Azure） |

### 範例：明陽食品冷鏈

```
明陽價值鏈：
   ↑ 食品零售客戶
   │
   │ 冷鏈履歷可信度          ← Product 期（業界已有方案）
   │     │
   │     ▼
   │ IoT 監控系統             ← Product 期（GoodLinker 可提供）
   │     │
   │     ▼
   │ 溫度感測器               ← Commodity（買現成）
   │     │
   │     ▼
   │ 雲端運算                 ← Commodity（用 AWS）
   │
   └─────────────────────→ 演化階段
```

→ 結論：明陽該**買 Product 期的方案**（不該 Custom 自己組）。

## 戰略 Play（攻略動作）

Wardley 列了 30+ 個戰略動作。常用：

| Play | 意思 | 提案怎麼用 |
|---|---|---|
| **Pioneer-Settler-Town Planner** | 三類人各管不同階段 | 提案說明我方在 Settler/Town Planner 階段（穩） |
| **ILC（Innovate-Leverage-Commoditise）** | 別人創新、我們抄、再變成 commodity | 別跟客戶說 |
| **Co-evolution** | 元件演化會帶動上層演化 | 雲端 commodity 化 → 帶動 IoT 普及 |
| **Inertia** | 客戶會抗拒已熟悉的東西 | 訪談時注意客戶對既有 system 的依戀 |

## 何時用 Wardley

| 情境 | 用 Wardley？ |
|---|---|
| 客戶問「我們該自建還是買？」 | ✅ 必用 |
| 客戶問「這技術未來如何？」 | ✅ |
| 客戶想知道為什麼現在做 | ✅ 演化壓力 |
| 一般中小型功能型提案 | ❌ over-engineering |

## 推薦

- Simon Wardley《Wardley Maps》（Medium / GitHub 上可免費讀）
- onlinewardleymaps.com（線上畫圖工具）
- Wardley 在 GOTO Conferences、InfoQ 的演講（YouTube）
- learnwardleymapping.com（教學）
