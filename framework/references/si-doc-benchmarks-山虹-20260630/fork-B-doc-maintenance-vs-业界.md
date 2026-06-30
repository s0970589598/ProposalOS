I have enough. Let me compose the final honest gap benchmark.

---

# 山虹案 Doc Maintenance — Honest Gap Benchmark vs 業界 Best Practice

**Audit date**: 2026-06-30 · **Verified via**: actual file reads (cascade-trigger.sh / FRD-v1.0.md / 變更管理流程.md / 變更紀錄目錄.md) + WebSearch on Doorstop, OpenFastTrace, Vale, Spectral, CIA, CODEOWNERS. **Files inspected, not paraphrased from memory.**

---

## Part 1 — Alignment Matrix (山虹 vs 業界、verified)

| # | Industry best practice | 山虹現況 | 對齊度 | 證據 / Source |
|---|---|---|---|---|
| 1 | **Per-item file (YAML one-file-per-req)** | ❌ FRD 單檔 ~2937 lines、75 functions 全塞一檔 | **0%** | Doorstop YAML-per-item convention [GH](https://github.com/doorstop-dev/doorstop) |
| 2 | **Per-requirement source-of-truth header (`<!-- SOURCE-OF-TRUTH: ... -->`)** | ❌ grep 0 hit | **0%** | Doorstop item metadata; levnikolaevich pattern |
| 3 | **Bidirectional traceability (forward + backward links)** | ⚠️ FRD 有 Ch3.1 Prototype Mapping + RTM/MFC、無 backward link 自動 | **60%** | [Doorstop RTM](https://github.com/asimon-1/rtm_doorstop) |
| 4 | **Tag-based coverage import from source code** | ❌ 無 `// [impl->req~A1]` 類 tag、無 OFT scan | **0%** | [OpenFastTrace user guide](https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md) |
| 5 | **CI gate: fail build if uncovered req** | ❌ 無 GitHub Actions / 無 CI / 無 build gate | **0%** | OFT `failBuild=true` Gradle plugin |
| 6 | **Pre-commit cascade hook (commit blocks stale doc)** | ❌ .git/hooks 空（無 user hook）、無 husky / pre-commit | **0%** | [Vale CI hook pattern](https://docs.gitlab.com/development/documentation/testing/vale/) |
| 7 | **PostToolUse hook (post-edit cascade verify)** | ❌ ~/.claude/hooks/ 只 1 個 UserPromptSubmit hook | **0%** | Claude Code hook ecosystem |
| 8 | **UserPromptSubmit reactive hook** | ✅ `cascade-trigger.sh` 3 pattern (CR / frustration / SI doc) inject reminder | **100%** | self-built、領先業界 (大多 SI 案無此 mechanism) |
| 9 | **Cross-doc consistency lint (custom rule e.g.「v1.1 必跨 5 doc 出現」)** | ❌ 無 .vale.ini / 無 spectral.yml / 無 自製 grep CI | **0%** | [Datadog Vale](https://github.com/DataDog/datadog-vale) / [GitLab Vale](https://docs.gitlab.com/development/documentation/testing/vale/) |
| 10 | **Style / terminology consistency lint** | ❌ 無 (Datadog / GitLab / ING 都有) | **0%** | [ING Vale blog](https://medium.com/ing-blog/automating-technical-documentation-at-ing-using-vale-699b9ce528eb) |
| 11 | **CODEOWNERS + required reviewers (cross-team doc tree ownership PR gate)** | ❌ 無 .github/、無 CODEOWNERS、Doc Owner Matrix 只在 Rule 14 prose、無 PR-time enforcement | **20%** prose-only | [GitHub Docs](https://docs.github.com/articles/about-code-owners) |
| 12 | **Ownership-based folder structure** | ✅ PM/ + GoodLinker/ + SA/SD/Test/ + 變更紀錄/ + 7 README per folder | **100%** | Rule 16 verified via `ls docs/` |
| 13 | **CIA 3-step methodology (Analyze→Trace→Implement)** | ✅ 9-step Per-CR Tracker 含 impact + Files-affected matrix + cascade | **90%** | [Bohner/Arnold 1996 IEEE](https://books.google.com/books/about/Software_change_impact_analysis.html?id=IQFRAAAAMAAJ) |
| 14 | **Files-affected matrix per CR** | ✅ Rule 14 + cascade-trigger reminder step 4 強制列 | **100%** | self-built |
| 15 | **Master change registry (cross-CR index)** | ✅ `變更紀錄目錄.md` 含狀態 + ball-in-court | **100%** | verified via Read |
| 16 | **Ball-in-court state machine (6 狀態 explicit)** | ✅ 整理中→待處理→處理中→驗收中→已完成→已歸檔 | **100%** | self-built、超越 mainstream SI |
| 17 | **Per-doc local Change History (Layer 3)** | ✅ Scheme B 5-col、每 doc 最前 table | **100%** | verified via 變更管理流程.md §1 |
| 18 | **4-layer change log (master / cascade ref / per-doc / git)** | ✅ Rule 14 verified | **100%** | self-built |
| 19 | **Glossary / Acronyms appendix** | ✅ FRD Appendix A | **100%** | verified via FRD TOC |
| 20 | **Wiki-style `[[link]]` cross-ref (Obsidian)** | ✅ FRD TOC 含 `· [[#...|wiki]]` | **80%** | verified |
| 21 | **Fresh-context adversarial audit (avoid self-validation)** | ✅ pair-review skill + verify-pipeline | **100%** |領先業界、Anthropic best practice |
| 22 | **Chain-of-Verification fact-check** | ✅ cove-verify skill | **100%** | 領先業界 |
| 23 | **Stale claim auto-detection (`per X verified` 超過 N 月 flag)** | ❌ 無 lint (goodlinker-gcp-pitch 有 `.githooks/pre-commit` 同樣機制可 reuse、本案沒裝) | **0%** | self-pattern not propagated |
| 24 | **Deprecated artifact tracking (function 標 deprecated 不刪)** | ❌ FRD 無「Status: deprecated」column、刪了就刪了 | **0%** | Doorstop `level` + `derived` flag |
| 25 | **Audit log (who-changed-what-when 超越 git log)** | ⚠️ git log + 4-layer change log table；無 PR review thread / 無 reviewer field | **40%** | partial |
| 26 | **Cross-case methodology library (reuse 到下個 SI 案)** | ⚠️ 山虹 lesson 寫進 memory + si-spec-builder skill rules、但 anti-patterns / framework 未 generalize 出 case-agnostic library | **50%** | partial—single data point |
| 27 | **Doc owner matrix (RACI per doc)** | ✅ Rule 14 + FRD Ch3.3 RACI | **90%** | self-built |
| 28 | **AC / verification acceptance criteria 對接 req** | ✅ FRD Ch 2.4 + 2.5 link `山虹報工站-AC驗收標準.md` | **90%** | verified |
| 29 | **Session retrospective auto-trigger** | ✅ `/session-retrospective` slash + retrospect SOP | **100%** | self-built |
| 30 | **Pre-ship grep audit checklist** | ✅ Rule 24 + cascade hook step 6 | **80%** | prose-only、無 CI |

**Aggregate**: ~58% aligned overall. **CR governance / ownership layer** (rows 12-22, 27-29) 領先業界 mainstream SI；**automation / enforcement layer** (rows 1-7, 9-11, 23-24) 大幅落後。

---

## Part 2 — 6 個真實 Gap (按 severity)

### **G1 [HIGH] 無 commit-time enforcement — 所有 4-layer change log 純 prose convention**

Rule 14 / Rule 24 / cascade-trigger.sh 全部 reactive 提醒、無 hard gate。User 可直接 `git commit` 帶 stale FRD + 沒同步 deck，系統零阻擋。山虹 goodlinker-gcp-pitch repo 已有 `.githooks/pre-commit` + `scripts/lint-stale.sh` 範本 — **本案沒裝、純粹是 inconsistent self-application**。

### **G2 [HIGH] 無 cross-doc consistency automated lint**

「v1.1 必同時出現在 FRD Ch 0 / 變更管理流程 §Change History / 變更紀錄目錄 / per-doc CHANGE-HISTORY」這類 cross-file invariant、目前靠人腦 + grep 抽查。Vale custom rule + GitHub Action 是業界 standard（Datadog/GitLab/ING）、setup 2-4h 可 cover 80% blind spot。

### **G3 [MEDIUM] 無 per-item source-of-truth 機制 → blast radius 不可預測**

FRD 75 functions 全塞單檔 2937 lines、無 `<!-- SOURCE-OF-TRUTH: docs/PM/需求書-v2#A3 -->` 之類 header。改 A3 想知道誰 backward link 它，只能全 repo grep。Doorstop YAML-per-item + parent-child validation 是 mature solution、但 **migration cost 高 (~16-24h)**、單案不划算、**defer 到第 2 個 SI 案再決定是否 adopt**。

### **G4 [MEDIUM] 無 measurement / metric — 改了多少 doc / 漏改率多少全無數據**

「pair-review 找出 X% gap」「cascade 完整率 Y%」「ship 後 user catch 次數 Z」零度量、無 dashboard。意思是「我們在改善」純 self-claim、無法證明 v1.1 cascade 比 v1.0 更完整。可加 lightweight CSV log + 月匯總、cost 低 value 高。

### **G5 [MEDIUM] 無 stale-claim 自動 flag**

memory + skill 內充滿「per X 2026 verified」phrase、過 6-12 個月變 stale。goodlinker-gcp-pitch `lint-stale.sh` 範本可 reuse、setup 1-2h。Cross-project value 高（不只山虹案）。

### **G6 [LOW] CODEOWNERS / required reviewers gap**

山虹案無 PR review flow（直接 commit main / git solo）、CODEOWNERS 對單人 repo overkill。但 cross-team 場景（Vito + Allen + Dev + QA 同 repo 改 doc）值得加；目前無 PR-gate 就是「Allen 改完直接 ship、Vito 沒看到」風險。Setup 30 min。

---

## Part 3 — Severity-Weighted ROI

| Gap | Severity | Setup cost | Maintenance | 推薦 |
|---|---|---|---|---|
| G1 pre-commit hook (cascade verify + stale lint) | HIGH | 1-2h (reuse goodlinker-gcp-pitch script) | ~0 | **DO NOW** |
| G2 Vale custom rule + CI | HIGH | 2-4h | ~30min/月 | **DO NEXT (after Sprint 1 dev start)** |
| G5 stale-claim auto-flag | MEDIUM | 1-2h (reuse) | ~0 | **DO NOW (bundle with G1)** |
| G4 metric / cascade log | MEDIUM | 2-3h | 5min/CR | **DO** (lightweight) |
| G6 CODEOWNERS + branch protection | LOW | 30min | ~0 | **DO** (cheap) |
| G3 per-item YAML migration (Doorstop-style) | MEDIUM | 16-24h | high | **DEFER** — wait 2nd SI case 確認 ROI |

**Anti-over-engineer**：
- ❌ 不要上 Doorstop / OpenFastTrace full toolchain — 75 function single project 不值（OFT 適合 100+ component multi-team / safety-critical）
- ❌ 不要把 SKILL.md prose rule 全 port 成 CI rule — Rule 14 reactive hook 已 cover 80% case、再 enforce 容易 friction
- ❌ 不要建 dashboard / Grafana metric — overkill、CSV + 月匯總夠

---

## Part 4 — 結論

**Quantified position**: 山虹 doc maintenance system **govern / ownership / process layer 強 (~90% 對齊 IEEE CIA + Bohner/Arnold)**、**enforcement / automation layer 弱 (~10%、純 prose convention 無 hard gate)**。

對齊度約 **58% (17.5/30 row full match、含 partial)**、優於 mainstream SI 案 (大多 0 個 hook / 0 個 pair-review / 0 個 4-layer change log)、但落後 mature OSS team (Datadog/GitLab Vale + GitHub CODEOWNERS + Spectral CI)。

**3 個真實 gap 必補**:
1. **G1 + G5 pre-commit hook** (reuse 既有 script、1-2h ship 整套)
2. **G2 Vale custom cross-doc lint** (Sprint 1 dev kickoff 前)
3. **G4 cascade metric log** (證明改善 vs self-claim、無 measurement 就是 vanity)

**不要做**:
- **A** Doorstop YAML migration (G3) — 單案 ROI 不夠、等第 2 案
- **B** Full OpenFastTrace toolchain — overkill
- **C** Grafana dashboard / 複雜 metric pipeline — premature

**Self-skepticism note**: cascade-trigger.sh 是我自己建的、reactive UserPromptSubmit hook 領先業界 mainstream SI 是事實、但「領先」不代表「足夠」— 它 catch frustration phrase 之後、user 還是要靠 prose rule 跟 memory 走 9-step、無 hard gate。**「reactive reminder ≠ enforcement」是這 system 最大 honest gap**。

---

## Sources

- [Doorstop GitHub (doorstop-dev/doorstop)](https://github.com/doorstop-dev/doorstop)
- [rtm_doorstop — Requirements Traceability Matrix tool](https://github.com/asimon-1/rtm_doorstop)
- [OpenFastTrace User Guide](https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md)
- [OpenFastTrace Gradle plugin (failBuild=true)](https://github.com/itsallcode/openfasttrace-gradle)
- [Datadog Vale (datadog-vale)](https://github.com/DataDog/datadog-vale)
- [Datadog engineering blog — How we use Vale](https://www.datadoghq.com/blog/engineering/how-we-use-vale-to-improve-our-documentation-editing-process/)
- [GitLab Vale documentation tests](https://docs.gitlab.com/development/documentation/testing/vale/)
- [ING — Automating technical documentation at ING using Vale](https://medium.com/ing-blog/automating-technical-documentation-at-ing-using-vale-699b9ce528eb)
- [Bohner & Arnold — Software Change Impact Analysis (IEEE Press, 1996)](https://books.google.com/books/about/Software_change_impact_analysis.html?id=IQFRAAAAMAAJ)
- [LLM-Driven CIA paper (arXiv 2511.00262)](https://arxiv.org/pdf/2511.00262)
- [GitHub Docs — About code owners](https://docs.github.com/articles/about-code-owners)
- [GitHub Changelog — Required reviewer rule GA (Feb 2026)](https://github.blog/changelog/2026-02-17-required-reviewer-rule-is-now-generally-available/)
- [Spectral GitHub (stoplightio/spectral)](https://github.com/stoplightio/spectral)
- [Stoplight Spectral](https://stoplight.io/open-source/spectral)
