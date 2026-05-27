# Service Design

跨領域設計學科。整合設計、商業、技術、社會學。
**服務型客戶提案必看**（餐飲、零售、醫療、政府服務、SaaS）。

我們現在模組 04 只用了「服務藍圖」一個工具、Service Design 是整套體系。

## Service Design 完整 5 階段

```
1. Discover      → 用戶研究、訪談、shadowing
   ↓
2. Define        → Persona、JTBD、Journey
   ↓
3. Develop       → Service Blueprint、Prototype
   ↓
4. Deliver       → Pilot、Iterate、Scale
   ↓
5. Operate       → 監測、改善、持續演化
```

對應 Design Council 的「Double Diamond」模型：

```
Discover ─┐
          ├── Define
Develop ──┤
          ├── Deliver
Operate ──┘
```

## 6 個核心工具

### 1. Stakeholder Mapping

把所有相關人物 / 組織畫成同心圓：

```
       核心
     [使用者]
   [前線員工]
  [中階主管]
 [高層][合作夥伴]
[監理單位][社會大眾]
```

→ 我們的 RACI（模組 05）是一種 stakeholder mapping、但 Service Design 更完整（含社會大眾、監理）。

### 2. Persona

不是抽象「使用者」、而是具象化人物：

```
名字：張阿姨（虛構）
年齡：52
職稱：明陽食品 廠務經理
痛點：
  - 夜班沒人、半夜壓縮機壞 3 次了
  - 不會用太複雜的系統
  - 想 5 年內退休、不想學新東西
目標：
  - 平安做到退休
  - 月底不再加班
科技熟悉度：低（用 LINE、不太用 App）
引述：「我不需要花俏，我需要不要再半夜被叫起來」
```

→ Persona 比 RACI 角色描述更人性、可幫團隊**同理客戶**。

### 3. Customer Journey Map

從**客戶的視角**走一遍流程：

| 階段 | 觸點 | 客戶想 | 客戶做 | 痛點 | 機會 |
|---|---|---|---|---|---|
| 發現 | 看到 LINE 告警 | 「又壞了？」 | 看手機 | 看不清 | 改 UI |
| 評估 | 開系統 dashboard | 「哪個倉？多嚴重？」 | 點開告警 | 載入慢 | CDN |
| 行動 | 通知夜班 | 「找誰處理？」 | 打電話 | 找不到人 | 自動派工 |
| 解決 | 處理完登記 | 「下次能不能避免？」 | 寫紀錄 | 紀錄不全 | 自動產生紀錄 |
| 反思 | 月報看 | 「為什麼這麼多次？」 | 翻 Excel | 看不出 pattern | AI 趨勢 |

→ 跟服務藍圖不同：**Journey 是客戶體驗、Blueprint 是內部運作**。兩個一起用。

### 4. Service Blueprint（我們有）

四層：客戶動作 / 前台 / 後台 / 支援。
跟 Journey Map 對應：Journey 是 row 1、Blueprint 是 row 2-4。

### 5. Experience Prototyping

不只是 UI mockup、是**情境模擬**。

範例：
- 「假裝半夜 2 點壓縮機壞、整個流程跑一次」
- 「假裝客戶來稽核要看履歷、模擬 30 分鐘鎖定批號」

→ 比 Wireframe 更真實。

### 6. Pilot / MVP

不是直接 full rollout、是**先小規模驗證**：

- 1 個倉先上、3 個月後再展開
- 5 個司機試用 App、再給全部 12 個

→ 跟模組 09 分階段導入一致、Service Design 更強調**驗證後再擴**。

## 跟 ProposalOS 整合

### 訪談階段（階段 4）擴充

| 我們有 | Service Design 加 |
|---|---|
| 訪談腳本 | + Shadowing（跟著一天工作）|
| 痛點清單 | + Persona（3-5 個關鍵 persona）|
| 流程訪談 | + Customer Journey Map |

### 模組 04 流程藍圖擴充

- 加 Customer Journey Map（從客戶角度）
- 加 Experience Prototyping 計畫

### 模組 09 方案分階段擴充

- 加 Pilot 設計（時間、範圍、成功條件）
- 加 Iterate 機制（多久回看一次、改什麼）

## 適用客戶

| 客戶類型 | Service Design 適用度 |
|---|---|
| 純內部 IT 系統 | 低（用模組 04 足夠）|
| 客戶有外部使用者（B2C / B2B2C）| 高 |
| 服務型客戶（醫院、餐廳、零售）| 必用 |
| 政府公共服務 | 必用 |
| SaaS / 雲服務 | 高 |

## Service Design 的兩個誤解

❌ **「Service Design = UI 設計」** → 錯，Service Design 是整體服務的設計、含後台
❌ **「Service Design = 用戶研究」** → 錯，研究只是 Discover 階段、後面還有 4 階段

## 推薦讀物 / 工具

- 《This Is Service Design Doing》（Marc Stickdorn）
- 《Service Design Thinking》
- IDEO Design Thinking Toolkit
- Service Design Network（servicedesignnetwork.org）

## 跟其他方法的關係

| 方法 | Service Design 對應 |
|---|---|
| Design Thinking（Stanford 5 階段）| 子集（聚焦 Discover-Define-Develop）|
| Human-Centered Design（IDEO）| 同源 |
| JTBD | Discover 階段工具之一 |
| Lean Startup（MVP）| Pilot / Iterate 階段對應 |
| Agile / Scrum | Deliver / Operate 階段對應 |
