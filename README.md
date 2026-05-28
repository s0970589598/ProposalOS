# ProposalOS

跨產業顧問式系統提案作業系統

## 定位

ProposalOS 是**跨產業通用、可重複使用的提案作業流程**。
不限產業、不限規模、不限公司。從市場、競品、需求、流程、資料、架構、合規、商務、驗收到維運，產出可成交、可交付、可驗收的系統方案。

源於 GoodLinker 內部 IoT / 製造 / 食品案件實踐，現在開源、跨產業適用：

- ✅ 製造、醫療、政府、金融、零售、能源 ESG、食品物流、SaaS、營建等所有產業
- ✅ 提案規模從 30 萬到 5000 萬+
- ✅ 個人顧問、SI 公司、新創、大企業內部團隊都能用
- ✅ MIT License、Fork 自用、加自己的 case

## 為什麼需要

傳統系統提案常見的 4 個失敗模式：

1. **只寫功能，不寫商業價值** — 老闆看不懂、不買單
2. **寫得很完整，但交付會爆炸** — 沒有 RTM、回滾、退出機制
3. **競品晚到** — 等到簽約前才比較，已經失去談判籌碼
4. **AI、ISO、資安、SBOM 全靠印象寫** — 客戶法務一問就破功

ProposalOS 用 **12 大模組 + 8 強制檢查項** 來防漏，並把競品前移到需求探索階段。

---

## 框架總覽

### 12 大模組（必選骨幹）

**12 字口訣**：市場、競品、問題、流程、角色、資料、合規、架構、方案、商務、落地、風險

**業務功能盤點口訣**：**產銷人發財**（生產 / 銷售 / 人資 / 研發 / 財務）— 跨產業通用，訪談覆蓋自我檢查，避免只挖到一個 function 的痛。詳見 [模組 03](framework/12-modules/03-problem-business-goals.md)

| # | 模組 | 核心問題 |
|---|---|---|
| 1 | 產業與市場 | 規模、趨勢、典型痛點 |
| 2 | 競品、類似產品與替代方案 | 不買我們會買誰、自己做 |
| 3 | 問題定義與經營目標 | 真痛點、KPI |
| 4 | 作業現況、流程與服務藍圖 | As-Is / To-Be |
| 5 | 使用者、決策鏈與 RACI | 誰用、誰買、誰簽、誰擋 |
| 6 | 資料來源、資料治理與系統整合 | 從哪來、怎麼串、誰擁有 |
| 7 | ISO、法規、資安、個資與 AI 風險 | 法遵與風險邊界 |
| 8 | 系統架構、功能需求與非功能需求 | 業務 / 資料 / 應用 / 技術 |
| 9 | 解決方案選項與分階段導入 | 2-3 選項、分階段落地 |
| 10 | 採購邏輯、商務策略與報價拆項 | 怎麼買、怎麼報、怎麼分期 |
| 11 | 驗收、效益追蹤、變革管理與維運 | 怎麼算完成、效益怎麼追 |
| 12 | 風險、假設、限制、責任邊界與反方審查 | 哪邊會炸、誰的責任 |

→ 詳見 [framework/12-modules/](framework/12-modules/)

### 8 強制檢查項（容易被埋在模組裡漏掉）

| 代號 | 項目 |
|---|---|
| A | RTM 需求追蹤矩陣 |
| B | 專案溝通計畫 |
| C | 變更紀錄與決策紀錄 |
| D | Secure SDLC / AppSec 檢查 |
| E | 第三方套件、License、SBOM、供應鏈風險 |
| F | RTO / RPO、備份還原、版本回滾 |
| G | 退出機制：資料匯出、服務終止、移轉協助 |
| H | 提案證據包：案例、PoC、截圖、樣本 |

→ 詳見 [framework/8-mandatory-checks/](framework/8-mandatory-checks/)

### 產業加掛模組（依案件選用）

→ 詳見 [framework/industry-addons/](framework/industry-addons/)

---

## 提案流程順序

```
產業背景
   ↓
競品 / 類似產品 / 替代方案  ← 前移當需求探索工具
   ↓
初步市場功能地圖
   ↓
需求訪談（痛點、目標、決策鏈、RACI）
   ↓
作業流程 + 服務藍圖（As-Is / To-Be）
   ↓
資料盤點 + 系統整合
   ↓
ISO / 法規 / 資安 / AI 風險
   ↓
系統架構 + 功能 / 非功能需求
   ↓
方案選項 + 分階段導入
   ↓
報價 + 商務條款
   ↓
驗收 + 效益追蹤 + 變革管理 + 維運
   ↓
風險 / 假設 / 限制 / 責任邊界 / 反方審查
```

→ 詳見 [playbook/proposal-flow.md](playbook/proposal-flow.md)

---

## 每份提案至少要交付的 5 個視覺產出

1. **系統架構圖** — 業務 / 資料 / 應用 / 技術四層
2. **導入前後差異圖** — As-Is vs To-Be
3. **功能模組表** — 一張表看完所有功能
4. **硬體與軟體項目表** — 採購清單
5. **效益總結頁** — 一頁打中老闆

→ 範本見 [templates/](templates/)

---

## 怎麼用

### 新案開始

```
1. 讀 playbook/proposal-flow.md 確認流程順序
2. 依案件規模從 templates/proposal-template-{short,standard,enterprise}.md 複製骨架
3. 依 framework/12-modules/ 逐項填寫
4. 用 framework/8-mandatory-checks/ 過 checklist
5. 看 framework/industry-addons/ 是否需要加掛
6. 進入 playbook/red-team-questions.md 自我反方審查
```

### AI 輔助

ProposalOS 把 AI 定位成提案顧問，不只是被提案物：

- 訪談前：AI 協助生成行業專屬訪談問題
- 訪談中：AI 幫忙整理客戶語言到 RTM
- 訪談後：AI 對應到 12 模組、識別缺漏
- 提案中：AI 做反方審查、找漏洞
- 提案後：AI 追蹤效益實現度

→ 詳見 [playbook/ai-assistance.md](playbook/ai-assistance.md)

---

## 目錄結構

```
ProposalOS/
├── README.md                    本檔（總覽 + 12 模組）
├── CHEAT-SHEET.md               一頁濃縮版（會議帶著用）
├── DECISION-TREE.md             快速決策樹（這案該用哪些工具）
├── GLOSSARY.md                  術語表（150+ 縮寫對照）
├── CLAUDE.md                    給 AI 助手的工作指引
├── CHANGELOG.md                 版本變更紀錄
├── CONTRIBUTING.md              貢獻指引
├── LICENSE                      MIT
├── framework/
│   ├── README.md                框架入口
│   ├── MATRIX.md                12 × 8 對應矩陣
│   ├── 12-modules/              12 大模組逐項
│   ├── 8-mandatory-checks/      8 強制檢查項
│   ├── industry-addons/         產業加掛模組
│   │   ├── README.md            + 通用議題交叉索引
│   │   └── MODULE-INDEX.md      從模組看 add-on 反向索引
│   ├── client-perspective.md    客戶端視角（從讀提案者反向設計）
│   ├── anti-patterns.md         Anti-Patterns 庫（過去做錯的具體案例）
│   ├── scoring-rubric.md        提案品質評分標準（100 分制）
│   └── methodologies/           跨領域方法論
│       ├── shipley-apmp.md      大標案提案方法論
│       ├── pyramid-principle.md SCQA + MECE 結構化寫作
│       ├── cynefin.md           情境分類元方法
│       ├── kano-model.md        需求分類（取代 P0/P1/P2）
│       ├── c4-model.md          軟體架構圖標準
│       ├── dora-sre.md          DORA Metrics + SRE
│       ├── wardley-mapping.md   戰略地圖
│       ├── jtbd.md              Jobs to be Done
│       ├── service-design.md    服務設計 5 階段
│       ├── bmc-vpc.md           Business Model Canvas + VPC
│       ├── pestel-swot.md       外部 / SWOT 分析
│       ├── mlops-and-ai-governance.md  AI 治理 + RAG
│       ├── cybersecurity-frameworks.md MITRE ATT&CK + Zero Trust + CIS + SLSA
│       ├── software-architecture-patterns.md 12-Factor + DDD + Event Storming
│       └── rfp-rfi-rfq.md       三種詢問形式
├── templates/
│   ├── README.md                3 版本選擇指引
│   ├── proposal-template-short.md       < NT$ 50 萬
│   ├── proposal-template-standard.md    NT$ 50-500 萬
│   ├── proposal-template-enterprise.md  NT$ 500 萬+ / 政府 / 跨國
│   ├── rtm-template.md
│   ├── architecture-diagram-checklist.md
│   ├── before-after-diagram-template.md
│   ├── pricing-breakdown-template.md
│   ├── capture-plan-template.md         Shipley 事前情報
│   ├── compliance-matrix-template.md    政府 RFP 對應
│   └── poc-pilot-pricing-template.md    階梯定價
├── playbook/
│   ├── proposal-flow.md         流程順序（4 大段 ＋ 18 小階段）
│   ├── ai-assistance.md         AI 輔助流程
│   ├── skill-building.md        個人能力建構
│   ├── interview-script.md      訪談腳本
│   ├── red-team-questions.md    反方審查題庫
│   ├── skill-integration.md     整合既有 Claude Skills
│   └── retrospect-past-case.md  過去案件 retrospective 指引
├── examples/
│   └── mingyang-cold-chain/     完整虛構案例（含 RTM、架構、報價、反方審查）
├── skills/
│   └── proposal-os/             Claude Skill：引導完整流程（跨產業）
├── scripts/
│   ├── check-links.sh           驗證所有 markdown link
│   ├── new-proposal.sh          從模板建新案資料夾
│   ├── completeness-check.sh    對照 12 × 8 自查
│   ├── install-skill.sh         安裝 proposal-os Claude Skill
│   └── setup-pre-commit.sh      設定 git pre-commit hook
├── diagrams/                    圖檔來源（Excalidraw / draw.io / Mermaid）
├── archive/
│   └── version-history/         V1～V11 演化紀錄
└── research/
    └── tools-evaluation.md      工具研究框架
```

---

## 相關 Repo Ecosystem（不要混淆）

ProposalOS 不是孤島、跟 3 層 ecosystem 配合運作：

```
┌─ Layer 1：方法論 + 工具（公開 / OSS） ──────────────────┐
│                                                       │
│  📚 ProposalOS（本 repo）                              │
│     • 框架 / template / playbook / anti-patterns       │
│     • 跨產業、不含客戶資料、MIT License                  │
│                                                       │
│  ⚙️ ~/.claude/skills/                                  │
│     • proposal-os skill（引導流程）                     │
│     • pitch-deck-builder（Phase 7 產 deck）             │
│     • cove-verify / pair-review / best-version         │
│                                                       │
└───────────────────────────────────────────────────────┘
                          ↓ 引用 / 規範
┌─ Layer 2：跨案情報庫（private、含敏感資料） ──────────────┐
│                                                       │
│  🔒 ~/code/proposal-intelligence/                      │
│     ├── clients/      每客戶資料夾、時序紀錄（不覆蓋）     │
│     ├── competitors/  對手情報（in-place 更新）           │
│     └── industries/   產業情報（in-place 更新）           │
│                                                       │
│  per Capture Plan template §跨案件客戶情報庫設計          │
│                                                       │
└───────────────────────────────────────────────────────┘
                          ↓ 提供 facts / context
┌─ Layer 3：每案 deliverable repo（per-project） ──────────┐
│                                                       │
│  📦 {project}-proposal/                                │
│     ├── proposal.md / rtm.md                          │
│     ├── DESIGN.md + outline.md（pitch-deck-builder）   │
│     └── docs/deck/{slug}-deck.html + .pdf             │
│                                                       │
│  已驗範例：                                              │
│  • xiangpu-mes-proposal     （食品 MES、NT$ 620 萬）      │
│  • amafans-eaqs-proposal    （聯名 RFP、聯名合作）         │
│  • goodlinker-gcp-pitch     （投資 pitch、$350K credit） │
│                                                       │
└───────────────────────────────────────────────────────┘
                          ↓ 結案後
┌─ Layer 4：累積回流 ────────────────────────────────────┐
│                                                       │
│  • 教訓 → ProposalOS framework/anti-patterns.md       │
│    （去敏感後）                                          │
│  • 新案件類型 → DECISION-TREE.md                        │
│    （e.g. Amafans 案 → 加「聯名 RFP」新類型）             │
│  • 新對手 / 客戶資料 → proposal-intelligence/           │
│  • Skill 改進 → ~/.claude/skills/                      │
│                                                       │
└───────────────────────────────────────────────────────┘
```

### 三層的「不要混淆」原則

| Layer | 內容 | 公開度 | 更新邏輯 |
|---|---|---|---|
| **ProposalOS** | 方法論 / 框架 / template | ✅ Public OSS | 案累積後改進框架 |
| **proposal-intelligence** | 客戶 / 對手 / 產業 raw facts | 🔒 Private | 跨案累積、不覆蓋 |
| **{project}-proposal** | 該案 deliverable | 🔒 看客戶 NDA | 只屬於該案 |

### ❌ 容易混淆的錯誤

1. **客戶名 / 對手價格寫進 ProposalOS** → 違反 OSS、改丟 proposal-intelligence
2. **方法論抽出來放某個 case repo** → 該丟回 ProposalOS framework
3. **每案重新研究 SUNON / 鼎新** → 該先查 proposal-intelligence/competitors/
4. **proposal-intelligence 直接寫進 deck 引用** → 該標 unverified 或 manual cite source

### 主檔命名規則（不是每案都叫 proposal.md）

| 案件類型 | 主檔位置 |
|---|---|
| 客戶提案 | `proposal.md` |
| 投資 pitch | `docs/pitch_v{N}_final.md` |
| 聯名 / 合作 RFP | `source-documents/RFP_V{N}.md`（對方文件）+ 我方 audit / tracker |
| 顧問報告 | `report.md` |
| 政府標案 | `proposal.md` + `compliance-matrix.md` |
| 內部立案 | `business-case.md` |

完整產出位置 / 跨機器 sync 規則：[docs/output-locations.md](docs/output-locations.md)

### 一個案件 lifecycle 怎麼跑

```
新案 kickoff
  ↓
Step 1: 查 proposal-intelligence/clients/{客戶}/ 看現有情報
Step 2: 用 ProposalOS framework 套 12 模組（per case repo 寫 proposal.md）
Step 3: Phase 7 用 pitch-deck-builder 產 deck（per case repo docs/deck/）
Step 4: 結案 retrospect
        ├── 教訓 → ProposalOS framework/anti-patterns.md
        ├── 客戶資料更新 → proposal-intelligence/clients/{客戶}/
        └── 對手 / 產業新情報 → proposal-intelligence/competitors|industries/
```

---

## 演化紀錄

ProposalOS 從 V1 演化到 V12，每版都有獨特貢獻：

- V1 基本系統提案 → 提供視覺產出要求
- V2 智慧製造 / AI → 抽象成通用作業盤點
- V3 AI 輔助提案 → AI 雙重角色定位
- V4 跨產業通用 → 跳出製造業
- V5 ISO / 法規 / 競品 → 合規框架
- V6 30 章完整版 → 深度資料庫備查
- V7 10 大模組 → 收斂骨幹
- V8 工具 / Skill 研究 → 工具評估方法
- V9 能力訓練 → 個人能力獨立出來
- V10 競品前移 → 從銷售比較到需求探索
- V11 落地補強 → 8 強制檢查項

→ 詳見 [archive/version-history/](archive/version-history/)

V12 = V7 骨幹 + V11 落地檢查 + V2/V4/V5 產業 + V3 AI + V9 能力建構（獨立）+ V1 視覺產出
