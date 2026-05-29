# 產出位置 / 主檔命名規則

> 每案產出該放哪、跨案情報怎麼累積、不同案件類型主檔名稱不同。

## 主檔命名規則（混合架構）

每案 **必有 `proposal.md`**（我方視角 13 模組整理）、再依案件類型加對外 deliverable：

| 案件類型 | 內部主檔（必有）| 對外 deliverable（per 類型）|
|---|---|---|
| **客戶提案**（我方賣 / 客戶買）| `proposal.md`（套 13 模組）| 同 `proposal.md`、直接交付 |
| **投資 pitch**（我方申請 / 投資方給）| `proposal.md`（內部視角）| `docs/pitch_v{N}_final.md`（對外蒸餾版）|
| **聯名 / 合作 RFP**（雙方對等）| `proposal.md`（我方 13 模組 audit view）| `source-documents/RFP_V{N}.md`（對方文件、cross-ref）+ `rfp-audit.md` / `pending-items-tracker.md` |
| **顧問報告** | `proposal.md`（我方分析框架）| `report.md` 或 `consulting-report.md` |
| **政府標案** | `proposal.md`（套 13 模組）| 同 `proposal.md` + `compliance-matrix.md` |
| **內部立案** | `proposal.md`（內部視角）| `business-case.md`（對 leadership 簡化版）|

### proposal.md 的角色（每案統一）

⚠️ **proposal.md 不一定是對外 deliverable**、是**我方思考的整理**：

- **目的**：套 ProposalOS 13 模組 + 8 強制檢查項、確保框架完整
- **誰看**：自己 / 內部 / Claude session（不是客戶 / 投資人 / 合作夥伴）
- **形式**：可寫滿（如 xiangpu）或當 spine/index（cross-ref 既有檔、如聯名 RFP 案）
- **何時寫**：案件 kickoff 後第一個產出、貫穿整個 lifecycle

### proposal.md spine/index 模式（適用既有大量素材的案）

當案件已有大量 source doc（RFP / pitch / audit / tracker）、不要重寫、用 spine 模式：

```markdown
# {Case Name} — Proposal（我方視角、套 13 模組）

> 本檔是我方視角的方法論整理、不是對外 deliverable。
> 對外交付物見 [{deliverable file}]。

## §1. 執行摘要
[Status / metric] — see also: `{source-file} §X`

## §2. 產業與市場現況
See: `proposal-intelligence/industries/{產業}.md`
Key facts:
- ...

## §3. 客戶現況與痛點
See: `{audit-file}` / `relationship-history.md`
...
```

→ 雙寫成本 ≈ 0、proposal.md 變索引、實際內容仍在原檔。

→ Pitch-deck-builder Phase 7 章節 mapping 永遠 work（§X 對應 13 模組固定）。

---

## 4 層產出架構

### Layer 1：每案 deliverable repo（per-project）

```
~/code/{project-slug}/
├── {主檔}.md                ← 依案件類型（見上表）
├── rtm.md                   ← 需求追蹤矩陣（雙向、per 強制檢查項 A）
├── DESIGN.md                ← Deck brand spec（per pitch-deck-builder）
├── outline.md               ← Deck N-slide narrative
├── docs/
│   ├── deck/
│   │   ├── {slug}-deck.html ← 可分享 URL
│   │   ├── {slug}-deck.pdf  ← email 附件 / 留檔
│   │   └── {slug}-deck-v2.* ← 同案多版本
│   └── integrations/        ← 整合方案 / 技術細節（如需）
├── source-documents/        ← 原始素材（RFP / 訪談 / xlsx / PDF）
├── proposal-materials/      ← 配套資料（1-pager / brochure）
├── change-requests/         ← CR-001 / CR-002（per 主檔 §10 變更管理）
├── meeting-minutes/         ← 會議紀錄（YYYY-MM-DD_meeting-minutes.md）
├── archive/                 ← 過時版本歸檔（不刪）
├── exit-plan.md             ← 退出機制（per 強制檢查項 G）
├── risk-register.md         ← 風險登記（per 模組 12）
├── raci.md                  ← RACI 矩陣（per 模組 05）
├── pending-items-tracker.md ← 待確認事項追蹤（聯名 RFP 特用）
└── README.md / CLAUDE.md    ← 案件 metadata + AI 指引
```

**已落地範例**：
- `~/code/xiangpu-mes-proposal/` — 客戶提案、proposal.md（寫滿 1298 行）+ rtm.md
- `~/code/amafans-eaqs-proposal/` — 聯名 RFP、proposal.md（spine 模式）+ RFP_V.06.md + audit + tracker
- `~/code/goodlinker-gcp-pitch/` — 投資 pitch、proposal.md（spine 模式）+ docs/pitch_v3_final.md
- `~/code/ProposalOS/docs/deck/` — ProposalOS 自介 conference talk deck

### Layer 2：跨案情報庫（一個 repo、累積用）

```
~/code/proposal-intelligence/
├── clients/
│   ├── {客戶代號}/
│   │   ├── YYYY-MM-DD_facts.md      ← 不覆蓋、時序紀錄
│   │   ├── relationship-history.md   ← 跨案接觸紀錄
│   │   └── archived/                 ← 過時資料移這
│   ├── amafans/                      ← 已建
│   └── xiangpu/                      ← 已建
├── competitors/                      ← in-place 更新
│   ├── SUNON-建準.md
│   ├── 鼎新.md
│   ├── 東捷.md
│   └── 台塑網.md
└── industries/                       ← in-place 更新
    ├── food-processing.md
    └── hvls-industrial-fan.md
```

→ 規則詳見 `~/code/proposal-intelligence/README.md`。

### Layer 3：Framework / 方法論（OSS、無客戶資料）

```
~/code/ProposalOS/
├── framework/
│   ├── modules/                  ← 13 大模組逐項
│   ├── 8-mandatory-checks/          ← 8 強制檢查項
│   ├── anti-patterns.md             ← 145 條（持續累積、跨案傳承）
│   ├── industry-addons/             ← 產業加掛
│   ├── methodologies/               ← shipley / pyramid / cynefin / kano / ...
│   ├── MATRIX.md                    ← 12 × 8 對應矩陣
│   ├── scoring-rubric.md
│   └── client-perspective.md
├── templates/                       ← 3 版本（short/standard/enterprise）+ rtm/architecture/capture-plan/...
├── playbook/                        ← flow / interview-script / red-team / retrospect
├── examples/
│   └── mingyang-cold-chain/         ← 完整虛構案例
├── skills/proposal-os/SKILL.md      ← Claude skill 引導
└── docs/
    ├── deck/                        ← ProposalOS 自介 conference talk
    └── output-locations.md          ← 本檔
```

### Layer 4：Skills / 工具（跨產業共用）

```
~/.claude/skills/
├── proposal-os/SKILL.md             ← Phase 1-7 引導
├── pitch-deck-builder/              ← 產 deck 完整流程
│   ├── SKILL.md
│   ├── references/
│   │   ├── anti-slop-checklist.md
│   │   ├── design-md-template.md
│   │   └── slide-count-guide.md
│   ├── scripts/export-pdf.js        ← Playwright PDF export
│   └── examples/goodlinker-gcp-pitch/
├── cove-verify / pair-review / best-version / verify-pipeline
└── goodlinker-* (10 個後端 skill)
```

---

## 暫存 / 臨時產出（不入 repo）

```
/tmp/pw-out/                          ← Playwright 腳本暫存
/tmp/{project}-screenshots/           ← Deck 截圖（視覺驗證用）
  ├── xiangpu-screenshots/
  ├── xiangpu-v2-screenshots/
  ├── amafans-screenshots/
  └── proposalos-screenshots/
```

→ 這些是過程驗證用、不該 commit 進 repo。

---

## 跨機器（Mac × 2）sync 規則

| Repo | 路徑 | Sync 方式 | 是否含敏感 |
|---|---|---|---|
| Skills + CLAUDE.md | `~/.claude/` | git push / pull（cc-manager.git）| ❌ 無客戶資料 |
| ProposalOS framework | `~/code/ProposalOS/` | git push / pull | ❌ OSS、無客戶 |
| 跨案情報庫 | `~/code/proposal-intelligence/` | git push / pull（private repo）| ✅ **含敏感** |
| 每案 deliverable | `~/code/{project}-proposal/` | 看是否 git init / 客戶 NDA | ✅ 通常含敏感 |

⚠️ **`~/code/xiangpu-mes-proposal/` 目前不是 git repo**、跨機器需手動 sync。要不要 init 統一管理？

---

## 快速 find 任何產出

```bash
# 找某案 deck
ls ~/code/{案名}/docs/deck/

# 找某案主檔（依案件類型）
ls ~/code/{案名}/*.md                 # 客戶提案
ls ~/code/{案名}/docs/                 # 投資 pitch
ls ~/code/{案名}/source-documents/     # 聯名 RFP

# 找方法論
ls ~/code/ProposalOS/framework/

# 找 anti-patterns（145 條）
cat ~/code/ProposalOS/framework/anti-patterns.md

# 找客戶情報
ls ~/code/proposal-intelligence/clients/{客戶}/

# 找對手 / 產業情報
cat ~/code/proposal-intelligence/competitors/{對手}.md
cat ~/code/proposal-intelligence/industries/{產業}.md

# 找 skill
ls ~/.claude/skills/{skill-name}/

# 找最近 commit
cd ~/code/{repo} && git log --oneline -5
```

---

## Cross-reference

- 完整 ecosystem 架構：[README.md §相關 Repo Ecosystem](../README.md#相關-repo-ecosystem不要混淆)
- 案件類型判斷：[skills/proposal-os/SKILL.md §Step 1](../skills/proposal-os/SKILL.md)
- Deck 產出規則：`~/.claude/skills/pitch-deck-builder/SKILL.md`
- Slide 數 guide：`~/.claude/skills/pitch-deck-builder/references/slide-count-guide.md`
