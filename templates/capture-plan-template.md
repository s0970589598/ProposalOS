# Capture Plan 範本

⚠️ **Capture Plan = 提案前的情報蒐集與佈局**。
依 [Shipley / APMP](../framework/methodologies/shipley-apmp.md) 方法論。

## 區分「動作」vs「輸出」

⚠️ **動作（查公開資料）每案必做**、**輸出（完整 Capture Plan 檔）依規模決定**。

| | 動作：WebSearch 30 min | 輸出：完整 Capture Plan 檔 |
|---|---|---|
| 小案 < NT$ 50 萬 | ✅ 每案必做 | 🟡 1 頁筆記即可 / 「5 facts 摘要」|
| 中型案 NT$ 100 萬+ | ✅ 必做 | ✅ 完整 10 段 Capture Plan |
| 大案 / 政府案 | ✅ 必做（深度 1-2 hr）| ✅ 完整 + Win Themes + Discriminators + 接觸計畫 |

### 為什麼小案也要 WebSearch

| 不查的風險 | 例子 |
|---|---|
| 不知客戶有沒有現成工具、寫重複的 | 客戶要 dashboard、其實已有 BI |
| 不知客戶用什麼系統、整合做錯 | 客戶要小 API 整合、未知 ERP 規格 |
| 不知客戶業務、講話沒重點 | 顧問 engagement、提案方向偏 |
| 不知競品 / 替代方案 | PoC 規格設計失準 |

→ **WebSearch 30 min 對比後續可能 1-2 週白費**、ROI 永遠正。

### 小案 vs 中案的差別在「輸出格式」

- **小案**：查完寫進腦袋、用 1 頁筆記、不寫正式 Capture Plan 檔
- **中案**：寫成 Capture Plan 檔（10 段）、可被團隊共享、可長期 reference
- **大案**：完整 Capture Plan + Win Themes + Discriminators + 接觸計畫 + 多輪 review

### 真實案例（per AP-NEW-WRITE-1）

祥圃 MES 案、跑 Capture Plan WebSearch 後發現「已用 SAP ERP 2020 升級」、整個 framing 從「零基礎」改為「SAP 互補」、避免 framing 過時。

→ Capture Plan **占成功因素 70%**（per Shipley）、**WebSearch 動作不可省**。

## 工作量分級（依「未知度」、不依金額）

⚠️ **工作量不該綁案件金額、該綁「未知度」**。

### 工作量公式

```
WebSearch 工作量 =
   客戶已知度（公開資料多寡）
   + IT 環境複雜度（用 SAP / Salesforce / 自建？）
   + 競品多寡（同業多寡）
   + 法規 / 認證複雜度（食品 / 金融 / 醫療？）
   + 案件創新度（是否冷門領域？）
```

### 分級對應

| 未知度 | 工作量 | 適用情境 |
|---|---|---|
| **熟客 / 熟業界** | 5-15 min | 補 facts、確認沒變動 |
| **典型新客** | 15-30 min | 中型案、典型產業 |
| **複雜 IT 整合** | 30-60 min | 客戶用多套大型系統、整合多 |
| **冷門 / 創新領域** | 60-90 min | 政府標、跨產業、創新案件 |
| **跨國集團** | 90+ min | 母公司 / 子公司 / 多地、複雜 |

→ 案件金額是**參考、不是決定因素**。30 萬小案若客戶是「跨國集團子公司」也可能要 60 min。

## 三層輸出格式（避免大刀小用、per AP-NEW-WRITE-4）

### Layer 1：5 Facts 摘要（小案 / 個人筆記用）

```markdown
# [客戶] Capture Plan — 5 Facts 摘要

| Fact | 內容 | Source |
|---|---|---|
| 1. 客戶基本 | [年營收 / 員工 / 業務、1 句] | URL |
| 2. 既有 IT | [ERP / 主要工具、1 句] | URL |
| 3. 通路 / 客戶 | [B2B 客戶 / 上市櫃、1 句] | URL |
| 4. 主要競品 | [1-2 個] | URL |
| 5. 為什麼是現在 | [趨勢 / 法規 / 客戶壓力、1 句] | URL |

填寫時間：5-10 min
超過 = 該升級用完整 Capture Plan
```

### Layer 2：完整 Capture Plan（中型案、本檔下方範本）

10 段完整、可被團隊共享、可長期 reference。

### Layer 3：完整 + Win Themes + 接觸計畫（大標 / 政府）

Layer 2 + Win Themes 詳述 + Discriminators 可驗證 + 多輪 Pink/Red/Gold Team Review + Compliance Matrix（政府）。

## WebSearch 結果儲存設計

| 案件規模 | 儲存位置 | 版本控管 |
|---|---|---|
| 小案（5 facts） | 個人 Obsidian / 1 頁 md / 用完即拋 | 不必 git |
| 中案（完整 Capture Plan）| `~/code/[案件名]-proposal/capture-plan.md`（與 proposal 同目錄）| **private** git repo |
| 大案 | 同上 + 多輪更新 git history | private git repo + 多人 review |
| **跨案累積** | `~/code/proposal-intelligence/`（情報庫、見下方）| **private** git repo |

### 跨案件「客戶情報庫」（proposal-intelligence repo）

長期高 ROI 設計、跨案累積：

```
~/code/proposal-intelligence/（private repo、含敏感）
├── clients/
│   ├── [客戶代號]/
│   │   ├── YYYY-MM-DD_facts.md     ← 每次更新加新檔
│   │   └── relationship-history.md ← 跨案接觸紀錄
│   └── ...
├── competitors/                     ← 跨案累積對手情報
│   ├── 鼎新.md
│   ├── 東捷.md
│   └── ...
├── industries/                      ← 跨案累積產業情報
│   ├── food-processing.md
│   ├── manufacturing.md
│   └── ...
└── README.md
```

**累積邏輯**：
- 每案 WebSearch 結果整理進 clients/competitors/industries 對應檔
- 同競品多次遇到 → 競品檔越豐富
- 同產業多次做 → 產業檔越深
- 下次做新案 → 先查情報庫、不重做研究

**ROI**：
- 第 1 個祥圃案：30 min WebSearch
- 第 2 個食品業案：15 min（產業檔已有）
- 第 3 個遇到鼎新對手：5 min（鼎新檔已有）
- → 越累積越快、長期符合飛輪效應

---

# [客戶名稱] [案件名稱] Capture Plan

| 項目 | 內容 |
|---|---|
| 客戶 | |
| 案件名稱 | |
| 預估金額 | |
| 預計 RFP 發布日 | |
| 預計簽約日 | |
| Capture Manager | |
| Proposal Manager | |
| 最後更新 | |

---

## 1. Bid / No-Bid 評分

| 維度 | 1-5 分 | 權重 | 加權 | 說明 |
|---|---|---|---|---|
| 我們能贏的機率 | | 25% | | |
| 我們的能力契合度 | | 20% | | |
| 預算 / 利潤 | | 15% | | |
| 戰略價值 | | 15% | | |
| 客戶關係 / Coach 強度 | | 15% | | |
| 競爭格局 | | 10% | | |
| **加權總分** | | | | |

> ≥ 3.5：Go
> 3.0-3.5：Maybe（需高層決定）
> < 3.0：No-Bid

**決定**：[ ] Bid / [ ] No-Bid / [ ] Pending

---

## 2. 客戶分析

### 2.1 客戶背景

| 項目 | 內容 |
|---|---|
| 公司基本資料 | 產業、規模、營收、員工數 |
| 過去 3 年戰略動作 | 併購、擴張、轉型 |
| 重要事件 | 上市、IPO、人事變動、法規衝擊 |
| 財務狀況 | 是否健全、現金流 |
| 主要客戶 / 通路 | 誰買他們 |

### 2.2 痛點假設（訪談前）

| 痛點 | 來源 | 信心度 |
|---|---|---|
| | | |

### 2.3 經營目標假設

### 2.4 客戶採購流程

| 項目 | 內容 |
|---|---|
| 採購主管 | |
| 採購流程 | 詢價 → 比價 → 議價 → 簽約 |
| 通常合約期 | |
| 付款條件 | |
| 採購合規 | 是否要三家比價 / 政府採購 |

---

## 3. 競爭分析

### 3.1 競品清單

| 競品 | 過去合作？ | 預估報價 | 我方 vs 對方 |
|---|---|---|---|
| | | | |

### 3.2 SWOT 對每個競品

| 競品 | S | W | O | T |
|---|---|---|---|---|
| | | | | |

### 3.3 我方 SWOT（內部）

| | 內部 |
|---|---|
| S（優勢）| |
| W（劣勢）| |

| | 外部 |
|---|---|
| O（機會）| |
| T（威脅）| |

---

## 4. Win Themes / Discriminators

### Win Themes（為什麼客戶要選我們，3-5 個）

1.
2.
3.

### Discriminators（我們有、對手沒有，可驗證）

| Discriminator | 強度 | 證據 |
|---|---|---|
| | Strong / Weak | |

### Ghost Themes（暗示對手弱點，不點名）

| 對手弱點 | 我們的描述方式 |
|---|---|

---

## 5. 關係佈局

### 5.1 利害關係人地圖

| 角色 | 姓名 | 職位 | 對本案立場 | 我方接觸狀態 |
|---|---|---|---|---|
| Economic Buyer（掏錢的） | | | | |
| User Buyer（會用的） | | | | |
| Technical Buyer（評估技術） | | | | |
| Coach（內部支持我們） | | | | |
| Blocker（潛在反對） | | | | |

### 5.2 接觸計畫

| 角色 | 接觸次數目標 | 已接觸 | 下次 | 負責人 |
|---|---|---|---|---|
| | | | | |

---

## 6. 我方能力對應

### 6.1 能力契合矩陣

| 客戶需求 | 我方能力 | 契合度 | 缺口對策 |
|---|---|---|---|
| | | 高 / 中 / 低 | |

### 6.2 缺口補強

| 缺口 | 對策 | 負責 | 完成日 |
|---|---|---|---|

---

## 7. 預估競標時程

| 階段 | 日期 |
|---|---|
| 客戶內部評估 | |
| RFP 發布（預計） | |
| Q&A 期 | |
| 提案截止 | |
| 評選 | |
| 議價 / BAFO | |
| 簽約 | |
| 預計上線 | |

---

## 8. 提案策略

### 8.1 定價策略

| 項目 | 內容 |
|---|---|
| 報價區間 | 下限 ___ ~ 目標 ___ ~ 上限 ___ |
| 競品預估價格 | |
| 我方戰略價（取勝）| |
| Walkaway 價（不簽）| |

### 8.2 三方案設計

| 方案 | 定位 | 預估價 | 適用客戶情境 |
|---|---|---|---|
| 基礎 | | | |
| 標準（推薦）| | | |
| 完整 | | | |

### 8.3 提案內容重點

對應 [模組 09 方案](../framework/12-modules/09-solution-options-phased-rollout.md)：

| 章節 | 重點 | Win Theme 對應 |
|---|---|---|
| | | |

---

## 9. 風險與緩解

| 風險 | 機率 | 影響 | 對策 | Owner |
|---|---|---|---|---|
| | | | | |

---

## 10. Action Items

| 動作 | 負責 | 完成日 | 狀態 |
|---|---|---|---|
| | | | |

---

## 維護

| 版本 | 日期 | 修改 |
|---|---|---|
| v0.1 | | 初稿 |

Capture Plan 應每週 review、case 上線前定版。

---

## 相關文件

- [Shipley / APMP 方法論](../framework/methodologies/shipley-apmp.md)
- [PESTEL + SWOT](../framework/methodologies/pestel-swot.md)
- [Wardley Mapping](../framework/methodologies/wardley-mapping.md)
- [RFP / RFI / RFQ 區分](../framework/methodologies/rfp-rfi-rfq.md)
