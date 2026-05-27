# CLAUDE.md — ProposalOS

給 Claude Code / AI 助手的工作指引。

## 這個專案是什麼

ProposalOS — **跨產業**顧問式系統提案作業系統。
源於 GoodLinker、現開源跨產業適用。
不是寫 code，是寫**可成交、可交付、可驗收的系統提案**。

## 核心框架（必背）

- **12 大模組**：產業 / 競品 / 問題 / 流程 / 角色 / 資料 / 合規 / 架構 / 方案 / 商務 / 驗收 / 風險
- **8 強制檢查項**：RTM / 溝通計畫 / 決策紀錄 / Secure SDLC / SBOM / RTO RPO / 退出機制 / 證據包
- **5 視覺產出**：架構圖 / 前後差異 / 功能表 / 項目表 / 效益頁

## 重要原則

### 1. 競品必須前移
不是寫到最後當銷售比較，而是訪談前就要做。當作需求探索工具。

### 2. AI 雙重角色
AI 可以是被提案物（給客戶的功能），也是提案工具（給我們的助手）。寫 AI 章節時要分清。

### 3. 提案不是技術 dump
- 老闆關心：能不能解問題、花多少錢、多久、有什麼風險
- 工程師關心：架構、資料、整合、運維
- 法務關心：合約、責任邊界、退出機制
- 一份提案要同時打到這三種人

### 4. 外部事實必驗證（從全域 CLAUDE.md 繼承）
- 寫進提案的數字、廠商、技術、案例 → MUST 有可驗 source
- 「業界都這樣做」、「Stripe / AWS 都用 X」 → 不准寫，除非真的查過
- 抄舊提案是高危險源 → 引用前重驗一次
- 示意 vs 事實要明確標註

### 5. GoodLinker 慣例（從全域 CLAUDE.md 繼承）
- 數字一律從 PROD 拉、標 query 日期
- thingName 是 canonical IoT identifier
- 「客戶用 X 技術」沒佐證就標 unverified

## 工作流程

### 當使用者說「我要寫 XX 提案」

1. **不要**直接跳到寫功能 — 先問產業、客戶規模、決策鏈
2. **先做** [framework/12-modules/01-industry-market.md](framework/12-modules/01-industry-market.md) 到 03
3. **產業選擇** [framework/industry-addons/](framework/industry-addons/) 內容
4. **逐項填寫** 12 模組
5. **過 checklist** 8 強制檢查項
6. **反方審查** [playbook/red-team-questions.md](playbook/red-team-questions.md)

### 當使用者說「幫我審查這份提案」

1. 對照 12 模組逐項打分（有 / 部分 / 無）
2. 對照 8 強制檢查項找漏洞
3. 用 [playbook/red-team-questions.md](playbook/red-team-questions.md) 模擬客戶法務 / 工程師 / 老闆會問什麼
4. 列出**沒有可驗 source 的具體主張**（數字、廠商、技術）

### 當使用者說「幫我寫架構圖」

1. 確認是哪一層：業務 / 資料 / 應用 / 技術
2. 看 [templates/architecture-diagram-checklist.md](templates/architecture-diagram-checklist.md)
3. 圖的目的不是炫技，是讓決策者看懂資料怎麼流

## 禁忌

- ❌ 不要編造廠商案例（「某科技大廠用 X 技術」）
- ❌ 不要寫看起來像真實輸出但其實沒跑過的內容（截圖、log、SQL result）
- ❌ 不要省略 RTO/RPO、回滾、退出機制
- ❌ 不要把 AI 寫成「魔法」— 要明確輸入、輸出、評估方式、責任邊界
- ❌ 不要假設客戶會自己想到非功能需求（效能、資安、可靠性）— 要主動列出

## 版本演化備查

V1～V11 在 [archive/version-history/](archive/version-history/)。
不是給人讀的劇本，是「為什麼 V12 長這樣」的根源紀錄。引用前確認還適用。

## 相關專案

- `~/code/goodlinker-gcp-pitch/` — GoodLinker pitch 內容、40 修正紀錄、7 個 ADR
- `~/code/goodlinker-claude-skills/` — Claude Skills 開發
- `~/code/goodlinker-api-nexus/` — API 文件管理
