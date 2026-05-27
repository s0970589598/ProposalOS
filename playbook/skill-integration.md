# Skill Integration — 整合既有 Claude Skills

ProposalOS 不重新發明輪子。
你環境裡已經有的 Claude Skills 可以接到 ProposalOS 各階段。

## 既有可整合的 Skill

### 通用驗證 / 寫作

| Skill | 用途 | 接入 ProposalOS 哪裡 |
|---|---|---|
| **cove-verify** | Chain-of-Verification 驗具體 claim | 提案末段、每個具體數字 / 廠商 / 引用都過 |
| **pair-review** | Fresh-context subagent 第二眼 | 提案完整版送出前、Red Team Review 後 |
| **best-version** | 產 3 版本 → rubric 評分 → 選 winner | 執行摘要、推薦方案說明、客戶 email |
| **verify-pipeline** | 三層 net = best-version + cove-verify + pair-review | 大案 final ship-ready check |
| **grill-with-docs** | 壓力測試計畫 vs 既有 domain model | 階段 9 反方審查前 |
| **learn** | 累積跨 session 學習 | 每案結束 capture learnings |
| **checkpoint** | 儲存中斷點、跨 session 接續 | 長提案中段 |

### 市場 / 商業

| Skill | 用途 | 接入 |
|---|---|---|
| **market-research** | TAM/SAM/SOM、競品分析 | 模組 01 產業 + 模組 02 競品 |
| **business** | Customer success / Sales engineer / RevOps / Contract writer | 模組 10 + 11 |
| **marketing** | 42 個行銷子技能 | 提案中行銷 / 通路相關段 |
| **brand** | 品牌 voice、視覺 | 跟客戶溝通整體調性 |

### 設計 / 視覺

| Skill | 用途 | 接入 |
|---|---|---|
| **design-shotgun** | 多版本設計探索 | 提案中 UI / mockup 部分 |
| **design-html** | 產出 Pretext HTML | 互動式提案網頁 |
| **slides** | HTML 簡報 + Chart.js | 提案說明會 |
| **design-system** | Token / 元件 / 簡報 | 對外文件視覺一致 |
| **ui-styling** | shadcn/ui + Tailwind | 客戶要 UI mockup |
| **ui-ux-pro-max** | UI/UX 深度設計 | 客戶要互動原型 |

### 工程 / 技術

| Skill | 用途 | 接入 |
|---|---|---|
| **goodlinker-lambda** | GoodLinker 新 Lambda 完整流程 | 提案技術架構含 Lambda |
| **goodlinker-mcp** | GoodLinker MCP Gateway | 提案含 MCP |
| **aws-serverless plugin** 內子 skill：`aws-serverless:aws-lambda`、`aws-serverless:api-gateway`、`aws-serverless:aws-lambda-durable-functions`、`aws-serverless:aws-serverless-deployment` | AWS Lambda / API Gateway / SAM / CDK | 提案 AWS 架構 |
| **engineering** | 23 個工程子技能 | 提案技術設計 |
| **health** | code quality dashboard | 維運段引用 |

### GoodLinker 內部專用

| Skill | 用途 | 接入 |
|---|---|---|
| **goodlinker-customer-knowhow-extraction** | 拉客戶 IoT 資料做 cohort 分析 | 既有客戶提案前先跑 |
| **goodlinker-data-lineage-discovery** | 全 stack data lineage | 既有客戶資料盤點 |
| **goodlinker-shadow-sync** | RDS vs shadow 對齊 | 既有 IoT 客戶資料驗證 |
| **goodlinker-verify-api-vs-code** | API 文件 vs 程式驗證 | 客戶 API 整合前 |
| **goodlinker-bulk-verify-apis** | 批次 API 驗證 | 多 API 整合案件 |
| **goodlinker-register-api-to-nexus** | 新 API 註冊 | 新 Lambda 上線案件 |
| **goodlinker-recommend-api-flow** | 依需求推薦 API 串接 | 客戶需求對應現有 API |
| **goodlinker-wiki-lint** | 跨檔深度 lint | 提案文件 lint |

### 安全 / 審計

| Skill | 用途 | 接入 |
|---|---|---|
| **security-check** | 通用資安檢查 | 提案資安章節 |
| **security-research** | 深度資安研究與掃描 | 客戶資安要求高時 |
| **skill-vetting** | 評估第三方 skill | 提案含第三方工具評估 |

### 學習 / 個人

| Skill | 用途 | 接入 |
|---|---|---|
| **sigma** | 個人 1-on-1 tutor | playbook/skill-building.md 個人能力 |

## 推薦整合：提案各階段對應 Skill

### Phase 1：準備期（產業 / 競品 / 訪談）

```
階段 1 產業分析
   ↓
🔌 呼叫 market-research：產業 TAM/SAM/SOM、競品 mapping
   ↓
階段 2 競品分析（前移）
   ↓
🔌 呼叫 market-research：競品 pricing、positioning
   ↓
階段 4 訪談
   ↓
🔌 呼叫 goodlinker-customer-knowhow-extraction（既有客戶）
🔌 呼叫 goodlinker-data-lineage-discovery（既有資料）
```

### Phase 2：分析期

```
階段 5 資料盤點
   ↓
🔌 呼叫 goodlinker-shadow-sync（IoT 客戶）
🔌 呼叫 goodlinker-verify-api-vs-code（既有 API）
```

### Phase 3：設計期

```
階段 7 架構 + 方案
   ↓
🔌 呼叫 goodlinker-lambda（Lambda 部分）
🔌 呼叫 aws-serverless 系列（AWS 架構部分）
🔌 呼叫 engineering（技術深度）
```

### Phase 4：商務期

```
階段 8 提案書產出
   ↓
🔌 呼叫 best-version：執行摘要、推薦方案、客戶 email
🔌 呼叫 design-html / slides：視覺化
   ↓
階段 9 反方審查
   ↓
🔌 呼叫 grill-with-docs：壓力測試
🔌 呼叫 cove-verify：每個具體 claim 驗證
🔌 呼叫 pair-review：第二雙眼
   ↓
階段 10 提案說明會前
   ↓
🔌 呼叫 verify-pipeline：三層 net 最終把關
🔌 呼叫 slides：簡報製作
```

### Phase 5：交付期

```
階段 18 上線後回顧
   ↓
🔌 呼叫 learn：capture learnings
🔌 呼叫 health：code quality 報告
```

## 提案完成後的 ship-ready check

對應 [Shipley](../framework/methodologies/shipley-apmp.md) 的 Pink/Red/Gold Team：

```
Pink Team（早期內審，提案 50%）
   ↓
🔌 grill-with-docs：壓力測試結構與 domain
🔌 best-version：執行摘要選最強版

Red Team（反方審查，提案 90%）
   ↓
跑 playbook/red-team-questions.md
🔌 cove-verify：所有具體 claim
🔌 pair-review：fresh-context 視角

Gold Team（最終，提案 100%）
   ↓
🔌 verify-pipeline：三層 net
🔌 design-html / slides：最終視覺
```

## 何時不要用 Skill

| 情境 | 為什麼別用 |
|---|---|
| 小案件、想快出手 | Skill 啟動 + 流程比自己寫慢 |
| 沒網路、Claude Code 不能呼叫 | 退化到手動 |
| 客戶 機敏資料 | 先確認 Skill 是否會送外部、不確定別用 |

## Skill 限制與注意

- ❌ 不准用 Skill 編造資料（cove-verify 本來就會驗、但其他 skill 不一定）
- ❌ 不准把客戶資料直接餵給通用 skill（如 market-research）— 抽象化後再餵
- ❌ Skill 輸出仍要人工 review、不直接複製到提案
- ✅ Skill 是放大器、不是取代者

## 未來 Skill 規劃（ProposalOS 自製）

| 規劃中 Skill | 用途 |
|---|---|
| `goodlinker-proposal` | 引導完整 ProposalOS 流程（**本 repo `skills/goodlinker-proposal/` 已建檔、待 `cp -r` 到 `~/.claude/skills/` 才會被 Claude Code 識別**）|
| `proposal-review` | 對既有提案做 12 × 8 自查 |
| `competitor-research` | 對指定產業 / 公司做競品分析 |
| `rtm-from-interview` | 訪談逐字稿 → RTM |
| `proposal-red-team` | 對提案自動跑反方審查 |
| `bid-no-bid-evaluator` | Shipley Bid/No-Bid 評分 |
| `capture-plan-builder` | 建 Capture Plan |
| `compliance-matrix-builder` | 政府 RFP 對應 |

## 跟其他 Skill 系統互動

| 系統 | ProposalOS 立場 |
|---|---|
| `~/.claude/skills/` 全域 | 安裝 goodlinker-proposal-skill |
| ClawHub | 用 skill-vetting 評估、再裝 |
| GoodLinker 內部 skill | 直接呼叫 |
| ProposalOS skills/ | 本 repo 提供 |
