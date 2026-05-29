# Session Retrospective — 框架自我演化方法論

> ⚠️ **本框架原創 per Amafans EAQS 2026-05 case** — 業界既有 retrospective / post-mortem 方法（Scrum sprint retro、SRE blameless post-mortem、Lessons Learned）給概念基底、但「sub-agent 跑 session → 每 session 累計 user-push 翻車 → 系統化 feed 回 framework 升級」這個閉環 ProposalOS 自有。
>
> 業界參考（per 2026-05-29 WebSearch）：
> - Scrum sprint retrospective（Agile Manifesto 第 12 條 "At regular intervals, the team reflects on how to become more effective"）— https://www.invensislearning.com/blog/agile-retrospective/
> - SRE blameless post-mortem（Google / Netflix）— https://postmortems.pagerduty.com/culture/blameless/
> - Lessons Learned workshop（PMI / 大型 project closure）— https://echometerapp.com/en/lessons-learned-vs-retrospective-difference/
> - Self-Evolving AI Agents framework（4-component closed-loop: System inputs / Agent / Environment / Optimisers）— https://arxiv.org/pdf/2508.07407
>
> ProposalOS Session Retrospective = 借用「Scrum retro 的節奏 + SRE blameless 的姿態 + Self-Evolving Agents 的閉環」、specifically 對應**顧問式提案 session 的 user-push gap 累計**。

---

## §1 為什麼需要 retrospective

### Anti-pattern：framework 凍結在 v1.0、每案還是 user 推

| Before retrospective process | After retrospective process |
|---|---|
| Framework 寫完 v1.0、每案靠 user 推到才補 | 每案結尾系統化 retro、user-push gap 自動 feed 回 framework |
| 翻車事件分散在 commit history、無法整合 | Anti-patterns 累計表 + cross-case 歸納 |
| 同類 gap 跨 N case 重複出現、framework 沒進步 | Gap pattern 提煉 → framework upgrade ship |
| User 累 = framework 沒長進 | Framework 越用越好、user 推次數遞減 |

### Dogfood — Amafans EAQS 2026-05-29 session 真實累計

本 session 累計 **19+ 次翻車**、user 推 **5+ 次**才浮現 framework gap：
- 翻車 #14：「聯名」+「RFP」是 orthogonal 2 dimension（user push 兩次）
- 翻車 #18：B2B-only scope 沒 explicit 標
- 翻車 #16-17：台灣 B2B 軟體 / 顧問接案 5-stage 流程不在 framework
- 翻車 #11+12：Module 01-02 對聯名 RFP「N/A」過度簡化 / 漏 Intelligence 維度
- A.18-A.21（4 個 pending items）：sensor placement mixed strategy 顧問位置論述 user push 才浮現

→ **每次 user push = framework gap signal**。
→ **不做 retrospective = user 累 + framework 沒長進 = unscaleable**。

### Framework 應該 self-evolve、不該每案 user 推

per Self-Evolving Agents 4-component 閉環概念（arxiv 2508.07407）：

| Component | 對應 ProposalOS |
|---|---|
| **System inputs** | RFP / case brief / interview transcript |
| **Agent System** | ProposalOS framework（13 modules / 8 checks / methodologies / industry-addons）|
| **Environment** | 真實 case session、user-push events |
| **Optimisers** | **Session retrospective**（本檔）→ framework upgrade |

Retrospective = 缺了 Optimiser、framework 凍結。

---

## §2 Retrospective 觸發條件

### 自動 trigger

| Trigger | 描述 | 範例 |
|---|---|---|
| **Session end**（natural）| Deliverable ship 完 / case milestone 到 / 連續 work 段落結束 | RFP V0.7 ship、deck v2 ship |
| **5+ 翻車累計** | 同 session 累積 5 個以上 anti-pattern 觸發 | Amafans 2026-05-29 累 19+ 翻車 |
| **User push 5+** | 同 session user 主動推「為什麼一開始沒想到」5+ 次 | 聯名 vs RFP、B2B vs B2C、sensor 等 |
| **Pending items 翻倍** | Day 1 list vs final list 翻倍以上 | Amafans 17 → 25 = +47% |
| **Cross-doc 不一致 3+** | wiki-lint 跑出 3+ 處 contradiction | proposal vs rfp-v07 vs research/ |

### 手動 trigger

| 場景 | 動作 |
|---|---|
| User 問「為什麼一開始沒想到 X」| 立即記下 → session 結尾 retro |
| User 問「框架有想到 X 嗎」| Same |
| User catch「這應該預設處理」| Same |
| Pair-review subagent 標 systematic gap | Spawn retro 處理 gap |
| `/retrospect` 手動 invoke | Run full 5-step retro |

---

## §3 Retrospective 流程（5 step）

### Step 1：Gather raw signal

從 session 撈以下類型 evidence：

| 來源 | 抓什麼 |
|---|---|
| **User push events** | 每次「user 推 → 我們補 → fix」流程、紀錄 user 原句 + framework miss 點 |
| **Pending items 差異** | Day 1 pending list vs final list、新增的條目 |
| **翻車 events** | 對照 `anti-patterns.md` 既有 # 編號、cite 哪幾個 trigger |
| **Cross-doc 不一致** | wiki-lint / pair-review 跑出的 contradiction |
| **⚠️ Hedged claim 結果** | 早期 hedge 對 → 維持；hedge 錯（後 verify 反證）→ 算 gap |
| **Git commit history** | 同 session commit message 找「修正 / fix / per user feedback」signals |

### Step 2：Classify gap by framework layer

每 gap 標 layer：

| Layer | 描述 | 修法 |
|---|---|---|
| **modules/**（結構）| 13 模組哪個漏 / 不適用本案類型 | 加 sub-section / case type 分支 |
| **8-mandatory-checks/** | 強制檢查項漏一條 | 加新 check 或補既有 check 內容 |
| **industry-addons/** | 該產業 add-on 漏內容 | 加產業 specific clause |
| **methodologies/** | 方法論層面 gap | 加新 methodology 或補既有 |
| **anti-patterns.md** | 翻車 pattern 未記錄 | 加新 AP 編號 + dogfood case |
| **skill design** | proposal-os skill 觸發 / step 漏 | 升級 SKILL.md |
| **Cross-cutting** | 多 layer 同時 | 多 file edit |

### Step 3：Root cause analysis

每 gap 問：

| Question | 目的 |
|---|---|
| **為何 framework 沒 auto-surface？** | 找 framework 結構性 miss |
| **什麼問題會 Day 1 catch 到？** | 補進 question bank / lint rule |
| **歸到哪？** | question bank / lint rule / mandatory check / AP / methodology |
| **跨 case 還會發生？** | 判斷 gap scope（this case only / industry-wide / framework-wide）|

### Step 4：Propose framework upgrade

每 gap 一行：

```markdown
| # | Gap | Layer | Upgrade action | File | Effort | Priority | Cross-dep |
|---|---|---|---|---|---|---|---|
| FW#1 | xxx | industry-addons | add §X to manufacturing.md | manufacturing.md | 30min | high | none |
```

**Priority 分**：
- **High-leverage**：framework-wide、跨多 case、上游
- **Medium**：industry-wide、跨同產業 case
- **Low**：this case only、後續可手動處理

### Step 5：Execute or schedule

| Status | 動作 |
|---|---|
| **Immediate**（this session）| Spawn agent 立即執行 upgrade、commit 進 framework |
| **Near-term**（next case）| 開 issue / TODO、下案 kickoff 時補 |
| **Long-term**（v2）| 累計到 framework v2 release |

**配套**：
- 每筆 upgrade 寫 commit message 帶「per <case-name> retrospective」
- AP-NEW-X 加 anti-patterns.md 同時 cross-ref retrospective file
- Framework upgrade 跑完跑 wiki-lint 驗 cross-doc 一致

---

## §4 輸出格式 — Retrospective report template

```markdown
# Session Retrospective: {project name} {date}

## §1 Session summary
- Duration / scope / deliverables
- Anti-patterns triggered (cite #)
- User push count
- Pending items 差異（day 1 → final）

## §2 User-push gap list
| # | What user pushed | What framework missed | Framework layer | Severity |
|---|---|---|---|---|
| 1 | ... | ... | industry-addons | high |
| 2 | ... | ... | modules | medium |

## §3 Root cause per gap
（每個 gap 1-2 段、含「為何 framework 沒 auto-surface」+「Day 1 catch question」+「歸哪 layer」）

## §4 Framework upgrade proposal
| # | Upgrade | File | Effort | Priority | Status |
|---|---|---|---|---|---|
| FW#1 | ... | industry-addons/manufacturing.md | 30min | high | scheduled |

## §5 Anti-patterns accumulated to framework
| # | New AP | File | Cross-ref |
|---|---|---|---|
| AP-NEW-XX-1 | ... | anti-patterns.md | retrospective file §X.Y |

## §6 Cross-case generalization
| Gap | Scope | Generalization |
|---|---|---|
| 1 | case-specific | Amafans only |
| 2 | industry-wide | 任何 IIoT case |
| 3 | framework-wide | 任何 case |

## §7 Action items
- **Immediate**（this session）
  - [ ] FW#1 upgrade（owner / deadline）
- **Near-term**（next case）
  - [ ] FW#2 add to backlog
- **Long-term**（framework v2）
  - [ ] FW#3 入 v2 RFC
```

---

## §5 Integration with skills（未來 /retrospective-framework-gap skill）

### Skill spec（draft）

| Aspect | 設計 |
|---|---|
| **Skill name** | `retrospective-framework-gap` |
| **Trigger** | Session end + 手動 `/retrospect` invoke |
| **Input** | Session transcript / pending tracker / anti-patterns / commit history |
| **Process** | Run §3 5-step process automatically |
| **Output** | Retrospective report + framework upgrade proposal（§4 format）|
| **Side effect** | Spawn sub-agent execute upgrade（per user confirm）+ update anti-patterns.md |

### 串接點

- **proposal-os skill 結案 retrospect**：proposal-os Phase 6 後 → 自動 trigger retrospective
- **verify-pipeline 結束**：跑完 best-version + cove-verify + pair-review 後、capture gap
- **wiki-lint 跑出 contradiction**：goodlinker-wiki-lint 找到 3+ contradiction trigger retrospective

### 暫時手動 procedure（skill 未實作前）

User 手動發起時：
1. 列 session 的 user-push events（user 抄回給 assistant）
2. Assistant 跑 §3 5-step
3. 產 §4 報告 template
4. User 確認 upgrade 範圍
5. Spawn agent 跑 framework upgrade

---

## §6 Cross-ref

- [methodologies/multi-tool-verification.md](multi-tool-verification.md)（cite verification protocol）
- [methodologies/spine-mode-for-large-proposal.md](spine-mode-for-large-proposal.md)（cite spine 模式）
- [modules/](../modules/) 13 模組
- [industry-addons/](../industry-addons/)
- [anti-patterns.md](../anti-patterns.md)（AP 累計表）
- [8-mandatory-checks/](../8-mandatory-checks/)

---

## §7 Dogfood — Amafans EAQS full retrospective

⚠️ **本 § = 把本方法論套用 TO Amafans case 自身、作為 proof-of-concept**。

### §7.1 Session summary

| 項目 | 內容 |
|---|---|
| **Project** | Amafans × GoodLinker EAQS 聯名 RFP V0.7 |
| **Duration** | 2026-05-27 → 2026-05-29（3-day session）|
| **Scope** | 從 RFP V0.6 audit → V0.7 整合 → 顧問建議 → deck v2 → ship 對外材料 |
| **Deliverables ship** | 13 個（proposal.md spine / rfp-v07 / 9 個 research / mockup / deck v2 HTML+PDF / pending-tracker / rtm / risk-register / exit-plan / raci / acceptance / etc）|
| **Anti-patterns triggered** | 翻車 #14 ~ #19（聯名/RFP/B2B/SI/RFP procurement def/jargon hedge）+ AP-NEW-ANTI-HALLUC-1 ~ -4 全部 trigger 各 1+ 次 |
| **User push count** | **5+** 次主動 catch（聯名 vs RFP / B2B vs B2C / SI scope / sensor placement / audience deck / 13 modules）|
| **Pending items 差異** | Day 1: 17 → Final: 25 (**+47%**)、其中 A.18-A.21 全 user push 浮現 |

### §7.2 User-push gap list

| # | What user pushed | What framework missed | Layer | Severity |
|---|---|---|---|---|
| **1** | 「聯名 + RFP 是 orthogonal 2 dimension、不要 collapse」（兩次推、第 1 次 catch 全砍 → 第 2 次 catch 過度 correction） | Framework 沒區分「商業關係 × 文件類型」2D matrix、case type 用「聯名 RFP」一個 term collapse | anti-patterns + skill design | high |
| **2** | 「B2B 跟 B2C 你的 framework 能用嗎？」 | Framework 沒 explicit 標 B2B-only scope、缺 B2C 對照 | README + modules + methodologies | high |
| **3** | 「不一定是 SI 啦、你指的 SI 是什麼」 | Framework 用「台灣 SI」label 太狹窄、誤導 readership | methodologies | medium |
| **4** | 「業界當用 RFP 嗎？我接案流程是初步提案 → 需求訪談 → 完整提案 → 簽約 → 施工 → 驗收」 | Framework 過度 emphasize US-centric RFP、忽略台灣 B2B 軟體 / 顧問接案 5-stage 慣用流程 | methodologies + skill design | high |
| **5** | 「sensor 不是 1 fan 1 組 vs 1 場域 1 組 binary、應 mixed strategy」 | industry-addons/manufacturing 沒 IIoT sensor placement matrix | industry-addons | medium |
| **6** | 「同類型公司 / 客戶工廠 / 監控 / 產品分析 / 文章報導這些算不算 module 01-02？」 | Module 01-02「聯名 RFP N/A」過度簡化、漏 Marketing 外向 vs Intelligence 內向 2 重任務 | modules + anti-patterns | high |
| **7** | 「audience deck 應該對齊 proposal X 段」 | Skill design 沒 explicit 標 deck source footer 該對齊 proposal §X | skill design（pitch-deck-builder）| medium |
| **8** | 「13 模組對聯名 RFP 全部都要過一次嗎？」 | Skill design 沒 case-type-conditional matrix（13×8 矩陣依 case type 開關）| skill design + MATRIX | high |

### §7.3 Root cause per gap

**Gap #1（聯名 vs RFP）**：
- 為何 framework 沒 auto-surface：Framework 把「客戶提案 / 投資 pitch / 聯名 RFP / 顧問報告 / 政府標案」當 5 個獨立 case type、沒進一步分「商業關係 × 文件類型」2D matrix
- Day 1 catch question：「這個案件、商業關係是什麼（賣家→客戶 / 雙方對等 / 內部）？文件類型是什麼（RFP / Pitch / ADR / Joint Spec）？兩 dimension 都答了再選 framework 子集」
- 歸：anti-patterns.md AP-NEW-WRITE-5.e 升級（2D matrix）+ skill design SKILL.md 案件類型判斷段升級

**Gap #2（B2B vs B2C）**：
- 為何沒 auto-surface：Framework README 沒 explicit 標 scope、預設「all B2B」但沒寫明
- Day 1 catch question：「這個 framework 適用什麼類型 client？B2B 企業 / 政府 / NGO 提案 = 適用、B2C 消費品 mass-market = 不適用」
- 歸：README explicit B2B scope tag

**Gap #3（SI label）**：
- 為何沒 auto-surface：Framework 借用「台灣 SI」一詞描述 readership、實際 SI 嚴格 def 不涵蓋 SaaS+接案 / 顧問 / 產品公司
- Day 1 catch question：「目標使用者是『System Integrator only』還是『所有台灣 B2B 軟體 / 顧問接案』？後者廣義、不限 SI」
- 歸：sweep 全 framework「台灣 SI」→「台灣 B2B 軟體 / 顧問接案」

**Gap #4（台灣 5-stage 接案）**：
- 為何沒 auto-surface：Framework 以「RFP / Proposal」US-centric vocabulary 為主、沒對應台灣中小企業實際慣用「初步提案 → 需求訪談 → 完整提案 → 簽約 → 施工 → 驗收」5-stage 流程
- Day 1 catch question：「這個 case 用什麼 procurement 流程？西式 RFP / 大企業 procurement / 政府標案 → 用完整 framework；台灣中小企業 → 用 5-stage 慣用流程、RFP 只是 sub-stage doc」
- 歸：新增 methodologies/taiwan-b2b-5-stage.md（或併入 shipley-apmp.md sub-section）

**Gap #5（sensor placement）**：
- 為何沒 auto-surface：industry-addons/manufacturing.md 沒 IIoT 細項、sensor placement 不在 module 06（data integration）也不在 module 08（NFR）
- Day 1 catch question：「IIoT 案件、sensor 數量 / 位置 / 採樣率 / 1:1 vs sampled / 法規 anchor（ASHRAE / CNS）是 Day 1 必問」
- 歸：industry-addons/manufacturing.md 加 §IIoT sensor placement matrix

**Gap #6（module 01-02 Marketing vs Intelligence）**：
- 為何沒 auto-surface：modules/01 + 02 沒 explicit 標「Marketing 外向 / Intelligence 內向」2 重任務、聯名 RFP 預設「對外 N/A」就忽略內向 Intelligence
- Day 1 catch question：「module 01-02 兩重任務：Marketing（外向、說服客戶）vs Intelligence（內向、產業/競品/客戶 deployment 作為規格設計輸入）— 哪一重對本 case 適用？」
- 歸：modules/01 + 02 加 2 重任務 explicit 段 + anti-patterns AP-NEW-WRITE-5.d

**Gap #7（deck source footer 對齊 proposal §）**：
- 為何沒 auto-surface：pitch-deck-builder skill 沒 explicit 規範 deck source footer 對齊 proposal §X 規則
- Day 1 catch question：「deck 每 slide 的 source footer 必對齊 proposal.md 對應 §X、format `[per proposal.md §X / research/YY.md]`」
- 歸：pitch-deck-builder SKILL.md 加 source footer 對齊規則

**Gap #8（13×8 matrix case-type-conditional）**：
- 為何沒 auto-surface：MATRIX.md 13×8 矩陣是「all-on」、沒對應 case type 開關（聯名 RFP 哪些必、哪些 skip）
- Day 1 catch question：「依 case type（客戶提案 / 投資 pitch / 聯名 RFP / 顧問 / 政府）→ 13×8 矩陣哪些 cell on / off？」
- 歸：MATRIX.md 加 case-type-conditional 視圖

### §7.4 Framework upgrade proposal

per 本 retrospective 提出的 5+ upgrades（為 Amafans EAQS 真實 ship 的）：

| # | Upgrade | File | Effort | Priority | Status |
|---|---|---|---|---|---|
| **FW#1** | industry-addons/manufacturing 加 IIoT sensor placement matrix | industry-addons/manufacturing.md | 90 min | high | in-progress |
| **FW#2** | methodologies 加 CR handling protocol（CR-001/002 dogfood） | methodologies/cr-handling-protocol.md (new) | 60 min | high | in-progress |
| **FW#3** | methodologies 加 Phase 0 discovery onboarding | methodologies/phase-0-discovery.md (new) | 60 min | high | in-progress |
| **FW#4** | modules 加 13 sensor scheme matrix（依本案 pending A.18 衍生） | modules/13-system-design-mvp.md 升級 | 45 min | medium | in-progress |
| **FW#5** | methodologies 加 session-retrospective（本檔！） | methodologies/session-retrospective.md（本檔）| 90 min | high | **doing now** |

→ 5 個 upgrade 都 cross-dep 較低、可平行 spawn agent 跑、commit 進 framework。

### §7.5 Anti-patterns accumulated（cite anti-patterns.md）

per 本 case 已累計到 anti-patterns.md：
- **AP-NEW-WRITE-5.d**（module 01-02 拆 2 重任務 Marketing / Intelligence）— 翻車 #12
- **AP-NEW-WRITE-5.e**（聯名 ≠ RFP、2D matrix、orthogonal、generalization warning）— 翻車 #13 + #14
- **AP-NEW-ANTI-HALLUC-4 翻車 #16-19**（台灣 B2B 軟體 / 顧問接案 / SI scope / RFP procurement / jargon hedge / B2B-only scope）
- **本 §7 retrospective 衍生 AP-NEW-SESSION-RETRO**（見 anti-patterns.md 新加段）— 5 個 anti-pattern 關於 retrospective process 本身

### §7.6 Cross-case generalization

| Gap | Scope | 適用範圍 |
|---|---|---|
| #1 聯名 vs RFP 2D matrix | **framework-wide** | 任何案件、都該分商業關係 × 文件類型 |
| #2 B2B-only scope | **framework-wide** | Framework 整體 scope tag |
| #3 SI 不限 | **framework-wide** | 所有 readership |
| #4 台灣 5-stage | **regional**（台灣 / 中小企業 / 顧問接案）| 台灣 + 部分東亞 SI 場景 |
| #5 sensor placement | **industry-wide**（IIoT / smart farm / smart factory）| 任何 IIoT 案 |
| #6 module 01-02 2 重任務 | **framework-wide** | 任何案件 module 01-02 預設都該分 |
| #7 deck source footer | **case-specific tool**（pitch-deck-builder skill）| pitch-deck-builder 跨 case |
| #8 13×8 case-type-conditional | **framework-wide** | MATRIX.md core |

→ **8 個 gap 中 6 個 framework-wide、1 個 industry-wide、1 個 tool-specific** — 本 case retrospective 高 leverage。

### §7.7 Action items（committed）

**Immediate**（this session）：
- [x] AP-NEW-WRITE-5.d/e 已加 anti-patterns.md
- [x] 翻車 #12 ~ #19 已 dogfood 加 anti-patterns.md AP-NEW-ANTI-HALLUC-4
- [ ] FW#1（manufacturing IIoT sensor matrix）— spawn agent 跑中
- [ ] FW#2（CR handling protocol）— spawn agent 跑中
- [ ] FW#3（phase-0 discovery）— spawn agent 跑中
- [ ] FW#4（modules 13 sensor scheme matrix）— spawn agent 跑中
- [x] FW#5（本檔 session-retrospective）— **本 commit ship**

**Near-term**（next case）：
- [ ] README explicit B2B-only scope tag（FW#6、新案 kickoff 前補）
- [ ] sweep 「台灣 SI」→「台灣 B2B 軟體 / 顧問接案」（FW#7）
- [ ] MATRIX.md case-type-conditional view（FW#8）
- [ ] pitch-deck-builder SKILL.md source footer rule（FW#9）

**Long-term**（framework v2）：
- [ ] `/retrospect` skill 實作（automate §3 5-step）
- [ ] modules/01 + 02 加 Marketing vs Intelligence 2 重任務 explicit 段
- [ ] methodologies/taiwan-b2b-5-stage.md 新加 file

---

## §8 Anti-patterns（本方法論自身的 anti-patterns）

### AP-RETRO-1：Retro 報告寫完不執行

- **發生**：跑完 retrospective、寫了 framework upgrade proposal、但沒 spawn agent 執行、報告變 dead doc
- **後果**：framework 沒進步、下次 same gap 又出現、retro 變形式主義
- **教訓**：retrospective §4 upgrade proposal **必含 Status 欄**、Immediate 項必 spawn agent 同 session 跑完、Near-term 開 issue 進 backlog、Long-term 入 v2 RFC
- **對應**：[強制檢查項 C 決策紀錄](../8-mandatory-checks/C-decision-log.md)

### AP-RETRO-2：Retro 只看翻車不看 validated approach

- **發生**：retrospective 只 list user-push gap、不 capture 「**框架對的部分 / 本案 validated framework decision**」
- **後果**：framework 上下游修改時不知哪些是 hardened 不能動 / 哪些是 hypothesis 可改、變脆弱
- **教訓**：retrospective 必含「**validated framework approach**」段、cite「per case X 真實 ship 證實 framework Y approach work」
- **範例**：Amafans EAQS spine mode（proposal.md 312 行 + research/ 9 file）= validated approach、不要動

### AP-RETRO-3：Retro 不分 layer、所有 gap 雜在一起

- **發生**：retrospective 把 modules / methodologies / anti-patterns / skill design 的 gap 混在一個 list、修法時不知該動哪個 file
- **後果**：framework upgrade 散、cross-dep 沒 check、修一處 cascade 多處
- **教訓**：每個 gap 必標 layer（per §3 Step 2 表）、§4 upgrade proposal 必含 File 欄、跨 layer 標 Cross-dep

### AP-RETRO-4：Framework upgrade 沒 dogfood example

- **發生**：升級 framework 加新 methodology / module / AP、但沒 cite 真實 case dogfood、變抽象規範
- **後果**：framework reader 不知 「為何加這條」、抽象、難內化
- **教訓**：每 framework upgrade **必含 dogfood case cite**（commit hash + case name + 日期）、無 dogfood → 標 hypothesis / draft、不入 main framework
- **範例**：本檔 §7 dogfood Amafans = 必含 example、不要寫純抽象「retro process should do X」

### AP-RETRO-5：Pendulum over-correction（per Amafans 翻車 #14）

- **發生**：retrospective catch 第 1 個 gap、過度 correction reverse 走另一極端、產生新 gap
- **後果**：correction loop 跑兩次以上、user 累、framework upgrade 來回擺盪
- **教訓**：correction 後尋找 **middle ground**、不要 reverse 走另一極端、保留 user 第 1 次 correction 對的部分
- **範例**：Amafans 翻車 #14：user catch「聯名 ≠ RFP」第一次 → 我全砍「聯名」改「對等合作 RFP」第二次 catch 才發現「本案 actually 是聯名」、middle ground 是「保留聯名 RFP 描述 + 加 2D matrix note + 標 generalization warning」
- **對應**：[methodologies/multi-tool-verification.md commit checkpoint #10](multi-tool-verification.md)

### AP-RETRO-6：Cross-session learning 散落、無 consolidation

- **發生**：每個 case retrospective 自己跑、anti-patterns / framework upgrade 沒跨 case consolidation、N case 後 anti-patterns.md 600 條雜亂、reviewer / new author 找不到
- **後果**：framework 名義上有 retrospective、實際上每案重新學
- **教訓**：每 N case（如每 5 case 或每季）跑一次 **cross-case consolidation retrospective**、把零散 AP 歸納成 pattern、framework 整體升級
- **配套**：未來 `/cross-case-consolidate` skill（draft）

---

## §9 配套工具（future）

- **`/retrospect` skill**（draft）— 自動 §3 5-step
- **`/cross-case-consolidate`**（draft）— 跨 N case 歸納 pattern
- **`wiki-lint` + retro hook**（existing）— wiki-lint 跑出 contradiction trigger retro
- **`anti-patterns.md` AP-NEW-X auto-numbering**（draft）— sub-agent 加 AP 時自動編號

---

## §10 Glossary

- **Session**：一次連續 work 段落（typical 1-3 day、ship 1+ deliverable）
- **User push**：user 主動 catch framework 沒 auto-surface 的 gap（每次 push = gap signal）
- **Framework gap**：framework 應該 handle 但 v1 沒 handle 的事
- **Framework upgrade**：把 gap 補進 framework（加 module / methodology / AP / skill rule）
- **Dogfood case**：用真實 case session 跑 framework + 紀錄反饋
- **Validated approach**：framework 對的部分、真實 case 證實 work、後續維持
- **Cross-case generalization**：判斷 gap scope（case-only / industry-wide / framework-wide）

---

## §11 References

業界參考（per 2026-05-29 WebSearch、citations）：

1. **Scrum sprint retrospective** — Agile Manifesto 第 12 條 + Scrum framework retro ceremony  
   https://www.invensislearning.com/blog/agile-retrospective/

2. **SRE blameless post-mortem** — Google / Netflix 原型、Curiosity over criticism / commitment to learning  
   https://postmortems.pagerduty.com/culture/blameless/

3. **Lessons Learned vs Retrospective** — project closure 一次性 vs 持續 routine 對照  
   https://echometerapp.com/en/lessons-learned-vs-retrospective-difference/

4. **Self-Evolving AI Agents framework** — 4-component closed-loop（System inputs / Agent / Environment / Optimisers）  
   https://arxiv.org/pdf/2508.07407

5. **FLAP retrospective** — Future / Lessons / Accomplishments / Problems 四象限  
   https://www.teamretro.com/retrospectives/flap-retrospective-activity/

⚠️ **本框架原創 per Amafans 2026-05 case** — 上述業界參考只給概念基底、ProposalOS Session Retrospective 的「session 端到端 + user-push gap signal + 自動 feed framework upgrade」閉環是本 case dogfood 累計產出、未在業界 retrospective methodology 文獻找到等同的 specifically-for-consultative-proposal-OS 設計。
