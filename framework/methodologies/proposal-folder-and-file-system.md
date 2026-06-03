# Proposal Folder + File System SOP — 完整 inventory、rationale、cascade matrix

> per Amafans EAQS 2026-05-27 → 2026-06-03 七天案例累積：14 root .md + 19 folder（8 canonical + 6 de facto + 3 consolidation + 2 case-specific）整套 codify 成 build SOP + maintenance cascade matrix。本檔回答兩個問題：
>
> 1. **新案啟動**：要建哪些 folder / file、何時建、命名 convention、who owns、cross-ref to what
> 2. **既有案 update**：改一處、cascade 到哪些 file 不漏（核心解 AP-NEW-CASCADE-PHRASING-1 與 AP-NEW-CASCADE-2 banner ≠ body sweep 漏掉）

**對位 framework**：本檔是 `spine-mode-for-large-proposal.md` 的**完整 SOP 版**（spine-mode 提概念、本檔提建檔順序 + cascade 表 + dogfood 例）。CR cascade 相關走 `cr-handling-protocol.md §11`、本檔不重複、只 cross-ref。

---

## §1. 完整 inventory — 14 active root .md + 19 folder

### §1.1 Root .md (14)

| File | Required? | 觸發條件 | 必含 sections | Cross-ref to |
|---|---|---|---|---|
| `proposal.md` | ✅ MUST | 每案 | §0 spine entry / §1-§13 13 模組 / Web Research Bundle table | 所有 sub-folder file |
| `README.md` | ✅ MUST | 每案 | 案件 metadata 與 status / CR table / active TODO / audit score chain | 所有 audit / cascade target |
| `outline.md` | 🟡 若有 deck | deck slide N ≥ 5 | Slide-by-slide map / v.X 歷史 / cite footer per slide | `deck/*.html`、`DESIGN.md` |
| `DESIGN.md` | 🟡 若有 deck | per pitch-deck-builder skill | 8 必填 section（palette / font / layout / 13 anti-slop rule） | `outline.md`、`deck/*.html` |
| `raci.md` | ✅ MUST 顧問式 | 含 multi-stakeholder | 角色定義 / 7 階段 RACI table / Protocol A T1 source 標註 | 所有 stakeholder claim |
| `rtm.md` | ✅ MUST | per 9-check A | requirement traceability 雙向 trace | 所有 CR / sensor scheme |
| `risk-register.md` | ✅ MUST | per 模組 12 | risk inventory R-NN + CLOSED status | `rtm.md` / CR-NN / `exit-plan.md` |
| `exit-plan.md` | ✅ MUST | per 9-check G | exit notice / IP table / data export 流程 | 主合約 §X / IP table |
| `pending-items-tracker.md` | ✅ MUST | per 模組 04 衍生 | pending Q list / CR table / 統計 | 所有 in-flight item |
| `acceptance-benefits-operations.md` | ✅ MUST 顧問式 | per 模組 11 | UAT criteria / KPI / ops handover | `acceptance/`、`operations/` |
| `module-04-as-is-to-be.md` | 🟡 promote | 內容 > 150 行 | as-is / to-be / blueprint | `proposal.md §4` |
| `module-06-data-integration-governance.md` | 🟡 promote | 內容 > 150 行 | 資料整合 + DPA + lineage | `proposal.md §6` |
| `module-10-procurement-pricing.md` | 🟡 promote | 報價 / 商務拆項 > 150 行 | BOM / 訂閱 / 折扣 / Tier | `proposal.md §10` |
| `module-13-system-design-mvp-amafans.md` | 🟡 promote | 系統設計 > 150 行 | 13 §1-§9 含 sensor scheme | `proposal.md §13` / `system-design/` |

⚠️ Promote 規則：spine §N 段落超過 ~150 行、reviewer 一頁滾不完 → promote 進獨立 `module-NN.md` + spine 改放 cross-ref + 5 bullet 摘要（per spine-mode §「cross-ref 不寫 key finding」反 pattern）。

### §1.2 Folder canonical 14 + consolidation 3 + case-specific N

**Tier 1：每案必有（核心 8、per spine-mode）**

| Folder | 觸發條件 | 內檔 naming | Cross-ref from |
|---|---|---|---|
| `source-documents/` | 對方提供 input 任何 doc | `YYYY-MM-DD_<purpose>.{md,pdf,xlsx}` or 原檔名 | `proposal.md`、`research/` |
| `research/` | Web research + 內部 spec | `NN-<topic>.md`（01+ 序號） | `proposal.md` Web Research Bundle table |
| `change-requests/` | CR 出現 | `CR-NN-<purpose>.md` + `README.md` index | `proposal.md` / `pending-items-tracker.md` / `risk-register.md` |
| `system-design/` | 技術 spec 需 isolate（per 模組 13） | `data-flow.md` / `data-schema.md` / `data-fields.md` / `tech-stack.md` / `db-ddl.sql` | `proposal.md §13` / `module-13-*.md` |
| `architecture/` | 含 C4 / 架構圖 | `c4-<context|container|component>.md` etc | `proposal.md §8` |
| `mockup/` | 含 UI wireframe | `wireframe-L1-L2-L3.md` + `index.html` + thumb-*.png | `proposal.md §6` |
| `ai-handoff/` | 交 AI codegen | `spec.md`（含 module / fields / endpoints） | `system-design/` |
| `meeting-minutes/` | 每會議後 | `YYYY-MM-DD_meeting-minutes.md`（含原檔 / 校正版） | `proposal.md` / `raci.md` / `source-documents/` |

**Tier 2：顧問式必有（per 模組 11）**

| Folder | 觸發條件 | 內檔 | Cross-ref from |
|---|---|---|---|
| `acceptance/` | UAT 流程 | `uat-script.md` / `uat-signoff.md` / `uat-defect-template.md` / `README.md` | `acceptance-benefits-operations.md` |
| `operations/` | 客戶 ops handover | `customer-onboarding-playbook.md` 等 | `acceptance-benefits-operations.md` |

**Tier 3：若有 deck（per pitch-deck-builder skill）**

| Folder | 觸發條件 | 內檔 | Cross-ref from |
|---|---|---|---|
| `deck/` | 主 deck N ≥ 5 slide | `<case>-deck.html` / `.pdf` / `gen-screenshots.js` / `screenshots/`（gitignore） | `outline.md` |
| `decks-sub/` | multi-deck（legal / sales / engineering） | `<purpose>/index.html` + per-deck DESIGN | `outline.md` |

**Tier 4：若有 13-module bundle（顧問式 deliverable）**

| Folder | 觸發條件 | 內檔 | Cross-ref from |
|---|---|---|---|
| `deliverable-13pdf/` | internal 版 13 模組 bundle | 14 module .md × NN- prefix + `build-pdf.js` | `proposal.md` |
| `deliverable-13pdf-client/` | 客戶版 bundle（去敏） | 同上 + `build-pdf-client.js` | `proposal.md` |

**Tier 5：consolidation patterns（per Amafans 6/03 retro、3 個觸發）**

| Folder | 觸發條件 | 內檔 |
|---|---|---|
| `rfp/` | ≥ 4 RFP file 散 root | `README.md` / `rfp-audit.md` / `rfp-v0X-deltas.md` / `rfp-section-A-IV.md` / `13-pdf-bundle-index.md` |
| `outbound-drafts/` | 顧問式 + 5+ external owner helper | `README.md` + `NN-<purpose>-for-<owner>.md` × N |
| `archive/retros/` | ≥ 3 session retros | `W?-*.md` / `*-AUDIT-*.md` / `*-GAPS-REPORT.md` |

**Tier 6：case-specific（optional、case-by-case 衍生）**

| Folder | 觸發條件 | 範例 |
|---|---|---|
| `sales/` | 對外 sales kit 需獨立 | `joint-sales-kit.md` |
| `archive/<sub>/` | 階段性 archive | `archive/deck-v1-pre-meeting/` / `archive/change-requests/`（撤回 CR）/ `archive/research/`（moot research）/ `archive/rfp-versions/`（舊版 RFP） |
| `source-documents/<case-X>/` | 特定 customer / partner case 一組檔 | `source-documents/amafans-customer-cases/` |

---

## §2. 每個 entity 的 rationale（脈絡 = 七欄）

每 entity 必能回答：

| 欄位 | 說明 |
|---|---|
| **WHY exists** | framework rationale + 對應 13 模組 / 9 check / 哪個 user pain |
| **WHAT goes inside** | required sections + optional content |
| **WHEN to create** | trigger condition + Phase 0 / kickoff / mid-flight |
| **HOW to name** | naming convention（kebab-case lowercase / NN- prefix / YYYY-MM-DD prefix） |
| **WHO updates** | per RACI ownership |
| **DEPENDS on** | 本檔 reference 哪些 file |
| **REFERENCED by** | 哪些 file reference 本檔（reverse cross-ref） |

### §2.1 範例 — `change-requests/CR-NN-*.md`

| 欄位 | 內容 |
|---|---|
| **WHY** | 案件中途 scope 變動必有 audit trail、防後續糾紛、per `cr-handling-protocol.md` 5 問 lint 入口 |
| **WHAT** | 5 問 5 row table + 5 row decision chain + impact 對應 § + revoke banner（若 retract） |
| **WHEN** | CR 一進來、不等下個會議；fire 條件詳 `cr-handling-protocol.md §2.1` |
| **HOW** | `CR-NN-<purpose>.md`、NN 兩位數從 001 起、`<purpose>` 動詞-名詞如 `add-wind-speed` / `remove-power-from-scope` / `remove-maintenance-scheduling` |
| **WHO** | 提案人 initiated、PM updates、雙方 GM sync confirmed（per AP-NEW-DECISION-CHAIN-1） |
| **DEPENDS on** | `cr-handling-protocol.md` / `protocol-a-attribution.md` |
| **REFERENCED by** | `proposal.md §N` / `pending-items-tracker.md` / `risk-register.md` / `rtm.md` / `outline.md`（若影響 slide）/ `README.md` CR table |

### §2.2 範例 — `research/NN-<topic>.md`

| 欄位 | 內容 |
|---|---|
| **WHY** | Web research / 內部 spec / 對手分析、details 不塞 spine、reviewer drill-down 用 |
| **WHAT** | §1 question / §2 findings / §3 sources cite / §Conclusions / §Open questions（spine-mode 強制末尾兩段） |
| **WHEN** | spine 寫到某 §N 需 reference 外部 evidence 時 spawn research agent |
| **HOW** | `NN-<topic>.md`、NN 02+ 起、`<topic>` 短 kebab-case 如 `02-competitors-hvls-fan-2024-2026` / `09-sensor-placement-consultancy` |
| **WHO** | research agent / Senior 顧問 / PM |
| **DEPENDS on** | `source-documents/`（若內部 spec） |
| **REFERENCED by** | `proposal.md §N` + Web Research Bundle table |

### §2.3 完整 rationale（其他 entity 縮寫）

| Entity | 一行 WHY |
|---|---|
| `proposal.md` | Single source of truth spine、reviewer 5 分鐘 navigate |
| `README.md` | 案件 metadata + 對 reviewer 第一個 landing page |
| `outline.md` | deck 跟 spine 之間的 mapping、slide ↔ §N |
| `DESIGN.md` | deck brand identity + anti-slop rule、不共用其他 project |
| `raci.md` | 多 stakeholder 角色 + 7 階段責任、Protocol A T1 source 必標 |
| `rtm.md` | 需求 ↔ 設計 ↔ 測試雙向 trace（per 9-check A） |
| `risk-register.md` | 風險清單 + 解 / 關閉狀態（per 9-check 風險） |
| `exit-plan.md` | 退出 / IP / data export 流程（per 9-check G） |
| `pending-items-tracker.md` | 待確認事項追蹤、防 question 遺漏 |
| `acceptance-benefits-operations.md` | UAT + KPI + ops handover（per 模組 11） |
| `source-documents/` | T1 external source archive（per Protocol A） |
| `system-design/` | 技術 spec isolation（per 模組 13）、AI codegen ready |
| `architecture/` | C4 各層架構圖、reviewer level-appropriate |
| `mockup/` | UI wireframe + 標 ⚠️ MOCKUP 非真實 |
| `ai-handoff/` | spec for AI codegen handoff |
| `meeting-minutes/` | 會議原檔 + ASR 校正版（per Protocol A T1） |
| `acceptance/` | UAT script / signoff / defect template |
| `operations/` | 客戶 onboarding playbook |
| `deck/` | 主 deck（HTML / PDF / screenshots） |
| `decks-sub/` | 多 audience sub-deck |
| `deliverable-13pdf{,client}/` | 13 模組 bundle internal / 客戶版 |
| `rfp/` | RFP 多 version 集中管理 |
| `outbound-drafts/` | 對 external owner 的腳手架 helper draft |
| `archive/retros/` | session retros 累積 time-capsule |

---

## §3. Update Cascade Matrix（最重要 — 改一處、必 sweep 到下列）

> 核心原則：banner ≠ body sweep done（per AP-NEW-CASCADE-2）。每 event 必跑「cascade target list + verify command」、grep 0 active 才算 close。

| Event | Cascade target files | Verify command |
|---|---|---|
| **新 CR fire** | `change-requests/CR-NN.md` NEW + `raci.md` 加 row + `risk-register.md` +R-NN + `rtm.md` + `pending-items-tracker.md` + `proposal.md §N` + `outline.md` slide（若 deck 影響）+ `README.md` CR table + `mockup/`（若 UI 影響）+ `ai-handoff/spec.md` | `grep -rn "CR-NN" .` ≥ 8 hit |
| **CR revoke / scope cut**（Mode B Full-cut、per `cr-handling-protocol.md §11`）| 7-step sweep：CR 5-row chain → child doc body strike + ❌ N/A → cross-ref typo grep → RACI strike → UAT N/A → audit score chain → README CR table | `grep -rn "<revoked-keyword>" .` 應 0 active or 全 strikethrough |
| **CR revoke Mode A Narrow-keep** | 同 Mode B + 加 Phase 2 forward routing note（不打死） | 同上 + grep「Phase 2 routing」存在 |
| **CR revoke Mode C Archive** | `mv archive/<sub>/<obsolete-file>` + 頂部加 HISTORICAL banner + spine 對應 § cross-ref | `ls archive/<sub>/` 含目標 file |
| **Module-N spec change** | `module-NN.md` + `proposal.md §N` + `deliverable-13pdf{,client}/NN.md`（若 promote）+ 對應 `system-design/` / `mockup/` / `ai-handoff/spec.md` | per module impact |
| **V.X RFP ship** | `rfp/rfp-vX-deltas.md` + `proposal.md` cite + `outbound-drafts/01-rfp-v(X+1)-outline.md` + 主合約 reference | `grep "V.X"` chain |
| **Audit score chain update** | `proposal.md` audit row + `README.md` audit row + `rfp/rfp-audit.md §D.5` | 統一單一數字、跨 3 file sync |
| **Risk register entry add/close** | `risk-register.md` R-NN + `rtm.md` R-NN row + `README.md` count + `rfp/13-pdf-bundle-index.md` count（若 bundle） | 3-file count sync |
| **Role attribution change**（per Protocol A） | `raci.md` role table + `meeting-minutes/` + 所有 person mention 跨檔 | `grep -rn "<person>" .` cross-doc consistency |
| **Deck regen**（per pitch-deck-builder Stage 5） | `deck/*.html` → run `gen-screenshots.js` / `build-pdf*.js` → PDF/PNG out → playwright visual verify | 視覺 Read screenshot 驗 |
| **Session end** | `archive/retros/<W?>-*.md` 新增 + framework `anti-patterns.md` 補 + cascade phrasing sweep | per `session-retrospective.md` |

### §3.1 Verify-zero-match 鐵則（per AP-NEW-CASCADE-2 G2 fix）

每個 cascade target 跑完、**必跑 last-mile grep**：

```bash
# CR revoke / scope cut 後
grep -rn "<revoked-keyword>" . | grep -v "❌\|~~\|archive/\|HISTORICAL"
# 應 0 命中、否則就是 partial sweep 留半身 stale

# Role swap 後
grep -rn "<wrong-attribution>" . 
# 應 0 命中

# Audit score chain
grep -rn "audit score\|score=" . | grep -v archive/
# 跨 file 數字一致
```

### §3.2 Multi-step edit 收尾 commit checkpoint（per CLAUDE.md 第 6 條）

Commit 前必跑：
1. `grep -n "^### " <file>` 驗 header 無重複（防 multi-step edit 留舊段）
2. `git diff --stat` 看 add line vs delete line（add >>> delete 表示舊段沒刪）
3. `grep -rn "⚠️\|可能\|推測\|不一定" .` 回頭 audit hedged claim、看是否後續 verified 後忘記 unhedge

---

## §4. Build SOP（新案啟動 0 → ship 完整流程）

```
STEP 1: Bootstrap
  $ mkdir <case-name>-proposal && cd <case-name>-proposal
  $ git init && git remote add origin <repo>

STEP 2: Phase 0 Discovery（必跑）
  $ /phase-0-discovery
  → 79 Q interrogation、產 Discovery Report + Module trigger map + Open Q + Assumptions

STEP 3: Create canonical 8 folder
  $ mkdir source-documents research change-requests system-design \
          architecture mockup ai-handoff meeting-minutes

STEP 4: spine + metadata（最先寫的 2 個 root .md）
  - proposal.md 13 § structure（per ProposalOS 13 模組）
  - README.md 案件 metadata（含 audit row + CR table 空表）

STEP 5: 6 framework deliverable（顧問式必有）
  - raci.md（per Protocol A）
  - rtm.md（per 9-check A）
  - risk-register.md（per 模組 12）
  - exit-plan.md（per 9-check G）
  - pending-items-tracker.md（per 模組 04 衍生）
  - acceptance-benefits-operations.md（per 模組 11）

STEP 6: 若有 deck → pitch-deck-builder
  - DESIGN.md（8 必填 section、不共用其他 project）
  - outline.md（slide-by-slide map）
  - deck/<case>-deck.html
  - deck/gen-screenshots.js（PDF / PNG export）
  - decks-sub/<purpose>/（多 audience 場景）

STEP 7: 若 13-module bundle → 顧問式 deliverable
  - deliverable-13pdf/（internal 版）
  - deliverable-13pdf-client/（客戶版去敏）

STEP 8: 若顧問式 → 模組 11 衍生
  - acceptance/（uat-script / signoff / defect template）
  - operations/（customer-onboarding-playbook）

STEP 9: CR-fire 觸發 → cascade
  - change-requests/CR-NN.md（過 5 問 lint per cr-handling §3）
  - 同 commit 內跑 §3 Cascade Matrix 對應 row

STEP 10: 若 RFP 多 version → consolidate
  - rfp/（4+ RFP file 出現時觸發、per spine-mode §11.1）

STEP 11: 若 5+ external owner helper → consolidate
  - outbound-drafts/（per spine-mode §11.2）

STEP 12: 若 3+ retros → archive
  - archive/retros/（per spine-mode §11.3）

STEP 13: Session 結束
  - 跑 /session-retrospective
  - 累進 framework/anti-patterns.md
  - 跑 cascade phrasing last-mile sweep（per §3.1）
```

---

## §5. Maintenance SOP（既有案 update workflow）

### §5.1 改一處的標準流程

```
1. 識別 event 類別（per §3 Cascade Matrix）
2. 查對應 row 的 cascade target list
3. 跑 grep verify 找所有 mention
4. 同 commit 內 sweep 全部 target（不分 commit）
5. 跑 §3.1 verify-zero-match 鐵則
6. 跑 §3.2 multi-step edit 收尾 checkpoint
7. Commit 前過 CLAUDE.md 9 條 final checkpoint
```

### §5.2 ROOT audit pattern（per Amafans 6/03 ROOT-26-AUDIT-REPORT 範本）

每 ~5-7 day 跑一次 root file audit：

| 步驟 | 動作 |
|---|---|
| **A.** root file count | `ls -1 *.md \| wc -l`、判斷是否 > 14 該 promote / consolidate |
| **B.** folder count | `ls -1 -d */ \| wc -l`、判斷是否 < 14 該補 / > 22 該 consolidate |
| **C.** cascade phrasing sweep | grep 跨 file 找 stale phrasing（per §3.1） |
| **D.** orphan file 偵測 | 找沒被 cross-ref 的 file（reverse grep） |
| **E.** archive 觸發判斷 | retros ≥ 3 / RFP ≥ 4 / outbound ≥ 5 是否要 consolidate |

### §5.3 Anti-patterns 索引（folder / file 系統相關）

| AP-NEW-* | 描述 | 防範 |
|---|---|---|
| CASCADE-PHRASING-1 | child doc phrasing stale at parent index change | 加 entity 同 commit 必 cascade、不分 commit |
| CASCADE-2 | banner ≠ body sweep done | §3.1 verify-zero-match 鐵則 |
| WRITE-6 | 中文「+/&」混 programming symbol | 用「兼/與/、」 |
| ANTI-HALLUC-X1 | person attribution must verify | Protocol A 跨 file 一致性 |
| ANTI-HALLUC-X2 | source file 本身可能 fabricated | T1/T2/T3 tier 區分、T3 不 default verified |
| DECISION-CHAIN-1 | 重大 CR 必雙向 sync trail | 5 欄 chain table mandatory |

---

## §6. Real-case dogfood — Amafans EAQS 7-day arc

| Day | 動作 | Folder / file 衍生 | Cascade 觸發 |
|---|---|---|---|
| **5/27** | Phase 0 discovery kickoff | proposal.md spine + README + 6 framework deliverable | — |
| **5/28** | 收 5/13 開案 PDF + Teams transcript | `source-documents/2026-05-13_*.pdf` + `2026-05-28_meeting-transcript.md` | meeting-minutes 同步 |
| **5/28** | CR-001 加風速 sensor | `change-requests/CR-001-add-wind-speed.md` | cr-handling §3 5 問 lint |
| **5/29** | 13 research file 平行 spawn | `research/02-* ~ 13-*.md` 跨主題 | proposal.md Web Research Bundle table |
| **5/30** | deck v1 → outline / DESIGN | `outline.md` / `DESIGN.md` / `deck/amafans-eaqs-deck.html` | pitch-deck-builder Stage 1-5 |
| **6/01** | CR-003 撤回電力 + AI 月報 cut | `change-requests/CR-003-remove-power-from-scope.md` + 24 file inline sweep | cr-handling §11 Mode B + AP-NEW-CASCADE-2 dogfood（partial sweep 翻車紀錄） |
| **6/02** | W5/W6/W7/W8 cleanup | `archive/retros/W?-*.md` + `archive/deck-v?-*/` + `archive/rfp-versions/` | spine-mode §11.3 consolidation |
| **6/03** | root cleanup + folder convention audit | `rfp/` + `outbound-drafts/` + `archive/retros/` 3 consolidation | spine-mode §11.1-§11.3 + ROOT-26-AUDIT |

### §6.1 真實 cascade dogfood — CR-003 撤回電力（Mode B Full-cut）

| Step | 動作 | File touched |
|---|---|---|
| 1 | CR record 5-row chain | `change-requests/CR-003-remove-power-from-scope.md` |
| 2 | child doc body strike | `sales/joint-sales-kit.md` / `operations/customer-onboarding-playbook.md` / `acceptance/uat-script.md` / `mockup/index.html` |
| 3 | cross-ref typo sweep | 4 處 broken link 修正 |
| 4 | RACI row strike | `raci.md` L48 / L52 |
| 5 | UAT N/A | `acceptance/uat-script.md` 5 case row |
| 6 | audit score chain | `rfp/rfp-audit.md §D.5` 73→91→98→95→93 non-monotonic 註 |
| 7 | README CR table | `README.md` CR-002→CR-003 routing |
| **W5-B audit caught**: 4 ancillary file 完全 pre-CR-003 + 2 partial sweep banner-only 留 8 inline mention | — | per AP-NEW-CASCADE-2 |

→ 這個 dogfood 直接 fed 進本檔 §3.1 verify-zero-match 鐵則 + §3.2 multi-step edit 收尾 checkpoint。沒這個 methodology、每次 cleanup 都漏。

---

## §7. Cross-ref

- **`spine-mode-for-large-proposal.md`**：本檔概念源頭、14 folder + 3 consolidation 來自 spine-mode、本檔是 SOP 化 + cascade matrix 補完
- **`cr-handling-protocol.md §11`**：CR revoke cascade 3-mode + 7-step 詳細 spec、本檔 §3 Cascade Matrix 為 expanded summary、不重複
- **`multi-tool-verification.md` commit checkpoint #6 / #11**：「Multi-step edit 完無舊段殘留」「parent index add → child cascade sweep」是本檔 §3.1 / §3.2 鐵則的 anti-pattern 源
- **`protocol-a-attribution.md`**：Role attribution change cascade（§3 對應 row）詳細 spec
- **`session-retrospective.md`**：Session end cascade 走該 methodology、本檔 §3 對應 row 為入口
- **`../anti-patterns.md`** AP-NEW-CASCADE-PHRASING-1 / AP-NEW-CASCADE-2 / AP-NEW-WRITE-6 / AP-NEW-ANTI-HALLUC-X1 / AP-NEW-ANTI-HALLUC-X2 / AP-NEW-DECISION-CHAIN-1
- **`../8-mandatory-checks/`** A / G / I：本檔 §1.1 root .md 必有 file 與 9 強制檢查項對應

---

## §8. 版本 + 驗證狀態

**版本**：v0.1 draft、2026-06-03
**起源**：Amafans EAQS 2026-05-27 → 2026-06-03 七天案例 + 6/03 user directive「檢查所有資料夾跟檔案、建立資料夾以及檔案的脈絡」
**驗證狀態**：
- ✅ 14 root .md inventory verified per `ls /Users/ylwu/code/amafans-eaqs-proposal/*.md` 2026-06-03
- ✅ 19 folder inventory verified per `ls -d /Users/ylwu/code/amafans-eaqs-proposal/*/` 2026-06-03
- ✅ Cascade Matrix CR-003 dogfood verified per `cr-handling-protocol.md §11.4` Mode B Full-cut
- ✅ verify-zero-match 鐵則 per W5-B audit 41 finding 9 critical 真實案例
- ⚠️ Hypothetical「新案啟動 STEP 1-13」順序 derived per spine-mode + 9-check + Amafans 7-day arc、未在多案 dogfood verified

**對應 framework gap**：本檔填補 spine-mode（提概念）+ cr-handling §11（提 CR-specific cascade）+ anti-patterns（提 AP-NEW-CASCADE-1/2）之間的 SOP 整合層、原 framework 對「新案啟動 0 → ship 完整 folder/file 建檔順序」+「既有案 update cascade matrix」沒整合 entry、本檔為 single-source SOP。

---

## §9. Future enhancements RFC（不在 v0.1 scope）

當前 framework 是 4-layer net（methodology + skill + grep verify + user catch）、ship 6/03 後實測 Amafans 7-day arc catch rate 高（41+11+17 = 69 issue catch、0 ship-blocker 出 remote）、但未到 100% auto-enforce。

下面是 future enhancement candidate、**defer 到 2-3 case dogfood validated 再 ship**（避免 premature abstraction、per CLAUDE.md anti-pattern guard）：

| Enhancement | 動作 | Effort | 觸發 build 條件 |
|---|---|---|---|
| **Pre-commit hook：stale ref detector** | Hook grep CR-revoked keyword（e.g. 「電力」「AI 月報」without strike）、active mention 則 fail commit | 4-6 hr（含 context exception design）| 2+ case 同 anti-pattern recur、ROI 證實 |
| **`cascade-execute` skill**（generic、非 CR-only）| Take event type → auto cascade target file 改、目前只 cr-handling §11 + Phase X.2 cover CR、其他 6 event 手動 | 6-8 hr | 3+ case 同 event recur（e.g. module change / role swap）|
| **`auto-sweep` linter** for AP-NEW-CASCADE-2 / phrasing drift | grep all stale token + report orphan | 3-4 hr | deck-builder Stage 4 已 cover deck-side、其他 broader sweep 待 case validate |
| **CI integration**（每 commit auto-grep）| GitHub Actions / pre-commit chain run | 2-3 hr | infrastructure ready + 上述 detector ship 後 |

⚠️ **不早做的理由**（per 6/03 user 討論）：
- 1 case Amafans dogfood = insufficient pattern abstraction、寫死 rule false-positive 風險高
- Stale token context-sensitive（archive / source-documents / historical block 可保留 vs active spec 必 strike）— rule design 比看起來複雜
- Pre-commit hook 太嚴會阻 legit work、太鬆又漏 → 需 2-3 case 反覆 tune
- Current 4-layer net 實測夠（69 catch / 0 ship-blocker）— defense in depth 已有

**Trigger 條件 review**：每次新案 ship 後跑 session-retrospective、若發現本 enhancement 對應 anti-pattern recur 2+ 次、即 promote 到 active build queue。

**Cross-ref**：
- `~/.claude/skills/proposal-os/SKILL.md` Phase X.2 CR Cascade Execution（CR-only auto cascade、本 RFC 提 generic 版）
- `~/.claude/skills/pitch-deck-builder/SKILL.md` Stage 4 #7（deck-side cascade phrasing sweep、本 RFC 提 generic 版）
- `anti-patterns.md` AP-NEW-CASCADE-2（banner ≠ body sweep、defense layer 之一）
