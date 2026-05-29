# ProposalOS — Conference Talk Outline（10 slide、15 min）

> Source: README.md + CHEAT-SHEET.md + framework/anti-patterns.md + examples/
> 用途: 跨業 conference talk 介紹 ProposalOS 方法論
> Audience: 中小 SI 老闆 / SI 顧問 / PM / 新創 CTO

## Slide 1 — Cover / Hook

不只是 title，要有 punch hook。

- **Hook 大字**：「**寫顧問式提案、為何 8 成都翻車？**」
- Subtitle: ProposalOS — 跨業顧問式系統提案作業系統
- Tagline: 13 模組 + 8 強制檢查項 + 結案 retrospect 累積機制
- Footer meta: 3 案已驗（祥圃 NT$ 620 萬 / Amafans 聯名 / Goodlinker × GCP）· MIT License · 2026

## Slide 2 — Story Opening

個人痛點故事、建立 emotional connection。

**Quote 大字**（中央）：

> 「我寫過 N 份提案、每次都覺得有東西漏。客戶法務一問就破功、工程師說『這怎麼做』、老闆說『這值多少』 — 我答不出來。」

下方小字：
- 不是個人問題、是**沒框架**
- 寫 code 有 design pattern、寫提案沒方法論
- **ProposalOS 就是我自己造的方法論**、開源給有同樣痛的人

Source: README §為什麼需要 + 個人 backstory

## Slide 3 — Problem：4 個經典失敗模式

4 卡 grid（danger themed）：

### ❌ 失敗 1：只寫功能、不寫商業價值
老闆看不懂、不買單。功能 list 5 頁、ROI 算式沒半個。

### ❌ 失敗 2：寫得很完整、但交付會爆炸
沒 RTM、沒回滾、沒退出機制。Phase 0 結束才發現「客戶資料怎麼移轉」沒寫。

### ❌ 失敗 3：競品晚到、失去談判籌碼
等到簽約前才比較競品、已經被客戶套牢。應該訪談前就做。

### ❌ 失敗 4：AI / ISO / 資安 / SBOM 全靠印象寫
「我們用 SOC 2」 — 客戶法務問細節就破功。

Source: README.md §為什麼需要

## Slide 4 — Aha Moment：3 大支柱

ProposalOS 的 3 大支柱（並排顯示、each pillar 高 visual weight）：

### 📚 Pillar 1：13 大模組
產業 / 競品 / 問題 / 流程 / 角色 / 資料 / 合規 / 架構 / 方案 / 商務 / 驗收 / 風險

**不能少任何一個**、少了就是 4 失敗模式之一。

### 🔒 Pillar 2：8 強制檢查項
RTM / 溝通計畫 / 決策紀錄 / Secure SDLC / SBOM / RTO RPO / 退出機制 / 證據包

**容易被埋在模組裡漏掉**、必獨立 check。

### 🔄 Pillar 3：結案 Retrospect 累積
每結案 +1 anti-pattern、6 個月後框架自我演化。

**現有 145 條 anti-patterns**（截至 2026-05-28）。

Source: CLAUDE.md §核心框架

## Slide 5 — How It Works：6 Phase Workflow

水平 phase flow 視覺：

```
Phase 1 準備期      → Phase 2 分析期    → Phase 3 設計期
產業 / 競品 / 訪談      流程 / 角色 / 資料      合規 / 架構 / 方案

Phase 4 商務期      → Phase 5 反方審查  → Phase 6 結案 retrospect
報價 / 驗收 / 風險      法務 / IT / 老闆        anti-pattern +1
```

**Phase 7（外掛）**：用 `pitch-deck-builder` skill 把 proposal 視覺化成 ship-ready deck（HTML + PDF）。

Source: framework/MATRIX.md + skills/proposal-os/SKILL.md

## Slide 6 — Framework Deep Dive：13 模組

3×4 grid（13 模組、each 一個 emoji + 一句話）：

| # | 模組 | 核心問題 |
|---|---|---|
| 1️⃣ | 產業與市場 | 規模、趨勢、典型痛點 |
| 2️⃣ | 競品 / 替代方案 | 不買我們會買誰 |
| 3️⃣ | 問題定義 + 經營目標 | 真痛點、KPI |
| 4️⃣ | 流程 / 服務藍圖 | As-Is / To-Be |
| 5️⃣ | RACI / 決策鏈 | 誰用 / 誰買 / 誰擋 |
| 6️⃣ | 資料治理 / 整合 | 從哪來 / 怎麼串 |
| 7️⃣ | 合規 / 資安 / AI 風險 | 法遵邊界 |
| 8️⃣ | 系統架構 + NFR | 業務 / 資料 / 應用 / 技術 |
| 9️⃣ | 方案選項 + 分階段 | 2-3 方案、分階段 |
| 🔟 | 採購邏輯 + 報價 | 怎麼買 / 怎麼報 |
| 1️⃣1️⃣ | 驗收 + 維運 | 怎麼算完成 |
| 1️⃣2️⃣ | 風險 + 反方審查 | 哪邊會炸 |

**業務功能盤點口訣：產銷人發財**（生產 / 銷售 / 人資 / 研發 / 財務）— 跨產業通用、訪談覆蓋自我檢查。

Source: README.md §框架總覽 + framework/modules/

## Slide 7 — Evidence：3 已驗案例

3 cohort cards + key metric per case：

### 🥩 祥圃 MES（食品加工）
- **NT$ 620 萬 / 9 個月導入**
- 顧問式 proposal、採購委員會、N=10 deck 含 RTM / Security / Risk
- 案件類型：客戶提案（我方賣 / 客戶買）
- Phase 1 MVP 2026-10 上線、2027 CAS 評鑑 ready

### 🤝 Amafans × GoodLinker EAQS（工業 IoT）
- **聯名 RFP、2026-12 上線**
- 開創 ProposalOS「聯名合作 RFP」新案件類型
- 21 待確認事項、7 阻塞項追蹤
- 案件類型：聯名 / 合作（雙方對等）

### ☁️ Goodlinker × GCP（投資 pitch）
- **$350K credit / 2 年**
- Investor pitch 場景、N=7 deck
- 案件類型：投資 / Partnership pitch
- 累積 79 修正 + 9 ADR + 26 維 sweep 方法論

Source: examples/goodlinker-gcp-pitch-retrospective.md + 案例檔

## Slide 8 — Anti-Patterns 累積機制

大字 hero stat：

# **145**

**Anti-patterns 累積條數**（截至 2026-05-28）

3 卡 detail：
- 📈 **每結案 +1**：6 個月後 anti-pattern 庫從 7 條變 15-25 條、本案直線累積
- 🤖 **AI 自我演化**：retrospect 自動引導、不靠人記
- 🔄 **跨案傳承**：個人經驗 → community knowledge

3 個 anti-pattern 範例（small text）：
- **AP-NEW-WRITE-1**：寫提案前必跑 WebSearch（含小案）
- **AP-NEW-WRITE-2**：競品必寫、不可「待補」
- **AP-NEW-WRITE-5**：先判斷案件類型再套框架（客戶 / 投資 / 聯名）

Source: framework/anti-patterns.md（145 條）

## Slide 9 — Why Now × Why ProposalOS

2 col compare：

### Why Now（2026 業界 trend）
- **Vibecoding / AI 寫 code 普及** → 提案品質落差成為 SI 主要 differentiator
- **客戶採購 sophistication ↑** → 法務 / 資安 / 退出機制都會問
- **跨產業需求** → 一份提案要打老闆 + 工程師 + 法務三種人
- **顧問教不會新人**：經驗變成 anti-pattern 條目才能傳承

### Why ProposalOS（跟既有工具不同）
- ❌ **RFP-tool（Loopio / Responsive）**：只管 RFP 回應、不管前期挖痛 / 競品 / 反方審查
- ❌ **SaaS proposal software（Proposify）**：管美編 / 簽核 / 模板、不管方法論
- ❌ **顧問經驗法則**：個人腦袋、教不會、離職就失傳
- ✅ **ProposalOS**：方法論 + 強制檢查 + 累積機制三件事都管、且開源跨產業

Source: README.md §定位 + 業界對比

## Slide 10 — Get Started + Closing Takeaway

### 🎯 Closing Takeaway（大字 quote）

> **「提案不是技術 dump、是同時打到老闆 / 工程師 / 法務三種人的藝術 — ProposalOS 用方法論讓藝術可教、可學、可累積。」**

### 3 ASK cards

#### ⭐ 1. Fork & Try
`github.com/{your-username}/ProposalOS` （如公開）
跑一個 kickoff、用 framework/MATRIX.md 對你下個案做 audit

#### 📝 2. Contribute Anti-Pattern
結案 retrospect 跑完、提 PR 加 anti-pattern
你的失敗教訓 → 別人少踩雷

#### 🤝 3. Community Discussion
跨業 SI / 顧問 community 共用方法論
（待建：Discord / Discourse / GitHub Discussions）

### Speaker contact

- GitHub: @{your-handle}
- Email: {contact}
- Talk slides + code: {URL}

Source: README.md §相關連結 + CONTRIBUTING.md
