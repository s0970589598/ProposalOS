# Protocol A — Person / Role / Actor Attribution Methodology

> 顧問式提案 / consultative engagement / 對外 RFP 中、每個人名 / role / actor / 指動者 claim 必驗、不交集 session 累積「記憶」當 verified — 避免 ghost attribution / cross-company role swap / over-generic「老闆」label / circular fabrication（self-cite session 內部 file 當 evidence）。
>
> **Source**：~/.claude/CLAUDE.md Protocol A (global config) + anti-patterns.md AP-NEW-ANTI-HALLUC-X1/X2 + AP-NEW-DECISION-CHAIN-1
> **起源**：Amafans EAQS 2026-05-29 ~ 2026-06-01 session 累積 5 dogfood + ASR conflation lesson
> **本檔目的**：single summary page、避免 reviewer 需 navigate 3 處（CLAUDE.md / anti-patterns.md / cr-handling-protocol.md）才能拼起完整 protocol

---

## §1. Glossary（人 / role / actor 三個 distinct 概念）

| 概念 | 定義 | 例 |
|---|---|---|
| **Person** | 具體個人、姓名 + 所屬組織 | Ethan、Bruce、Yitsen Liu、李茂碷 |
| **Role** | 該 person 在組織內擔任的職務 / function | 創辦人、業務 GM、PM、補助案承辦、董事長、RD |
| **Actor / 指動者** | 在某個 decision / 流程 / authority chain 內的「執行人」/「決議人」 | CR-003 撤回電力 → 提案 actor = Ethan、confirm actor = Eric、informed actor = Neko/Yitsen |

**三者不可混用**：
- 「Ethan 決議撤回」= 寫 actor、未顯 role authority chain
- 「Ethan GM 決議撤回」= person + role + actor 三維齊全
- 「老闆決議撤回」= over-generic role label 蓋過具體 actor、anti-pattern（per X1）

---

## §2. 3-Tier Authority Table（source 信任 tier）

| Tier | 範例 | 可否 default verified |
|---|---|---|
| **T1: external source-documents** | 對方 PDF（開案文件 / 名片 / 合約 binary）、對方提供 doc、Microsoft Teams transcript binary、LinkedIn profile | ✅ **可 default verified**（仍需內部 cross-check 但 baseline 高） |
| **T2: external 業界 standard** | ISO / NIST / GDPR / IEC / industry whitepaper / 公開法規 | ✅ **可 default verified**（cite source 必含） |
| **T3: session 累積 internal file** | raci.md / meeting-minutes.md / proposal.md spine / 我之前寫的任何 doc / agent ship 的 sub-deck | ❌ **不能 default verified**、可能 fabricated / ghost attribution / circular self-cite、cite 前必 cross-check T1/T2 source |

**Cross-check 順序**：T1 first → T2 second → T3 last。若 only T3 available、寫 `⚠️ T3-only、待 T1 verify` hedge marker、不可寫進對外文件 ship 出去。

---

## §3. 5-Row Decision Chain Template（重大 CR / scope change / 合約 amendment 必過）

per AP-NEW-DECISION-CHAIN-1、所有重大 scope change / CR retraction / 合約 amendment 必含 5 欄結構化 audit trail：

| # | Field | 描述 |
|---|---|---|
| **1** | **WHO initiated** decision | 提案人 + 組織 + role（例：Ethan 創辦人兼 GM、GoodLinker）|
| **2** | **WHEN** finalized | date + time if relevant（例：2026-06-01 上午）|
| **3** | **WHO ↔ WHO sync** before 決定 | phone / meeting / written、含對方 GM（例：Ethan ↔ Eric 業務 GM 電話 phone confirm）— 取得對方 side commitment |
| **4** | **WHO informed AFTER** decision | 雙方各自內部 informed chain（例：GoodLinker 側：Ethan → Bruce + Sara / Amafans 側：Eric → Neko + Yitsen）|
| **5** | **對方 side commitment** also confirmed | phone confirm = 雙方 commitment trace 已完整、可對外正式 cite（例：Eric phone agreement 已取得）|

**5-row dogfood**（CR-003 撤回電力、2026-06-01）：

| Step | When | Who → Who | 形式 | 內容 |
|---|---|---|---|---|
| 1 | 2026-06-01 (before 決定) | **Ethan 創辦人兼 GM ↔ Eric 業務 GM 決策窗口** | **電話 (phone confirm)** | Ethan 提案撤回電力 from Phase 1、Eric 同意（Amafans 側 commitment 取得）|
| 2 | 2026-06-01 (after 1) | Ethan → Bruce + Sara | GoodLinker 內部 informed | 雙方 commitment 確認後、Ethan 知會 GoodLinker 內部 PM / BD 團隊 |
| 3 | 2026-06-01 (after 1) | Eric → Neko + Yitsen | Amafans 內部 informed | Eric 內部 sync Amafans PM (Neko) + 補助案承辦 (Yitsen) |
| 4 | 2026-06-01 14:00 | User → Claude Code | 文字 directive | 「這次的專案跟電力監測我們先拿掉...再串接谷林的能源管理模組」|
| 5 | 2026-06-01 (3 hr later) | User → Claude Code | follow-up | 「AI 月報都要拿掉、因為他本來就跟能源模組綁在一起的」|

**比較**：原本「Ethan 決議撤回」單一 actor naming → 看似單方 push；改 5-row chain → 雙方 GM phone confirm + 雙方內部 informed close、對外正式 cite 不被質疑。

---

## §4. ASR Misrecognition Handling（多變體 ≠ 同人）

Microsoft Teams / Zoom / Google Meet 等會議錄音 ASR transcript 常有 misrecognition、**多個錯字變體可能對應不同人**、不能假設「相似錯字 = 同人」conflate 為單一 attribution。

**規則**：
1. **每 ASR 變體必 cite specific timestamp + context 確認 actual speaker**
2. **不能假設多個變體 = 同人**、可能是不同人 misrecognition
3. **Cross-reference 校正對照表必入 source-documents/ + transcript header**
4. **Role identification round N (N≥2) 即標 verification source**：「per [transcript] [timestamp] 自介 verified」、不是 session-derived 印象

**Dogfood**（Amafans EAQS 5/28 Microsoft Teams transcript ASR、user 2026-06-01 catch）：

| ASR 錯字 | Actual person | Cite | 翻車 history |
|---|---|---|---|
| 「一輪」 | 義倫（GoodLinker RD）| per Bruce 1:15 | — |
| 「一辰」+「義程」+「依晨」 | **Yitsen Liu（Amafans 計畫案補助案承辦）** | per Neko 0:13 + Bruce 1:06 + Yitsen 2:04 自介 | ⚠️ 我 W4 archive 原把「一輪/一辰/義程」全 conflate 為「義倫 同一人」是 ghost attribution conflation 翻車、實為 **2 人** |

**自檢句**：寫 transcript-derived attribution 前自問「這個 ASR 變體跟那個變體真的是同一人嗎？我有 cite specific timestamp 確認 actual speaker 嗎？」沒有 → 假設「可能是 2 人」、cross-reference 每個 timestamp 再下結論。

---

## §5. Cross-Ref Index（不同層 doc 的 Protocol A 入口）

| Doc | Section | Coverage |
|---|---|---|
| [`~/.claude/CLAUDE.md`](../../../../.claude/CLAUDE.md) | Protocol A — Person / Role / Actor attribution | Global config、適用所有 project / repo / session、3-tier authority + 5-row decision chain + ASR handling 完整 |
| [`anti-patterns.md` AP-NEW-ANTI-HALLUC-X1](../anti-patterns.md) | Person / role / actor attribution 必驗、不 default session 記憶 | 5 dogfood (Yitsen / Bruce / Eric / 李茂碷 / Ethan) + Bruce/Sara role swap (W3-A sweep miss 4 places) + ASR conflation reinforcement |
| [`anti-patterns.md` AP-NEW-ANTI-HALLUC-X2](../anti-patterns.md) | Source file 本身可能 fabricated、不能 double-down 當 verified | 3-tier authority table + circular fabrication dogfood (raci.md ↔ meeting-minutes self-cite chain) |
| [`anti-patterns.md` AP-NEW-DECISION-CHAIN-1](../anti-patterns.md) | 重大 scope change / CR retraction 必 explicit 雙向 sync audit trail | 5-row template + CR-003 撤回電力 5-step phone confirm dogfood |
| [`methodologies/cr-handling-protocol.md` §11](cr-handling-protocol.md) | CR Revoke Cascade Methodology | Step 1 內 decision chain 必含 5 欄、cross-party sync chain 不能省 |
| **本檔** | summary page | 整合 3 處 doc 為 single navigation entry |

---

## §6. Dogfood Examples（5 round + ASR + role-swap、Amafans EAQS 5/27 ~ 6/01）

per Amafans EAQS session、5 處 person/role/actor 翻車 + ASR + role swap + over-generic label = 7 distinct dogfood lesson：

| # | 翻車 | Initial mis-attribution | Final verified | Verification source |
|---|---|---|---|---|
| 1 | **Yitsen role round 3** | 「Yitsen 法務」(round 1) → 「Yitsen 商務」(round 2) | **Yitsen Liu = Amafans 計畫案補助案承辦**（114 年經濟部 個案補助 流程承辦）| per 5/28 Microsoft Teams transcript 2:09 自介「我這邊主要是負責計畫案補助案這一部分的一些流程」直接 quote verified（case-specific source: `amafans-eaqs-proposal/source-documents/2026-05-28_meeting-transcript.md`）— round 1/2 靠 session 印象 / generic「商務」label 都錯 |
| 2 | **Bruce 公司 swap** | 「Amafans Bruce」 | **Bruce King = GoodLinker PM / BD**、5/13 PDF p.5 列、5/28 起整合 V0.7/RFP+合約 | 5/13 開案 PDF + 5/28 transcript 直接 cite |
| 3 | **Sara 公司 swap** | 「Amafans Sara」一度 mention | **Sara 張譯云 = GoodLinker 產品經理**、5/28 起接 PM 對 Neko、整理會議記錄 | 5/13 PDF + 5/28 transcript |
| 4 | **Eric over-generic** | 「Eric 老闆」（over-generic role label）| **Eric 李承德 = Amafans 業務 GM、決策窗口** | per user 6/01 explicit confirmation × 2 round |
| 5 | **李茂碷 甲方乙方 confusion** | 「李茂碷 乙方」 | **李茂碷 = 甲方 Amafans 創辦人 / 董事長 / 合約 final sign-off** | 合約 docx binary §1.1 甲方 signing line + 5/13 PDF |
| 6 | **Ethan 創辦人 ≠ 純 GM** | 「Ethan GM」單一 role | **Ethan = GoodLinker 創辦人兼 GM、最終決策**（per user 6/01 authoritative）| user 2026-06-01 explicit 6 round confirmation + Chinese 顧問體「兼」連接（per AP-NEW-WRITE-6）|
| 7 | **Bruce/Sara role swap sweep miss** | W3-A sweep agent 漏 4 處 mis-attribution at uat-signoff L85-86 + acceptance-benefits-ops L38 / L91 / L131 | 4 處互換、user manual catch | sweep agent + grep + Edit replace-all 仍漏 4 處、需 user spot check + Protocol A 必每 mention verify、不可只 sample sweep |

**Generalization rule（cross-case）**：
- Round 1 / 2 attribution **不能** default verified、必標「⚠️ pending T1 source verify」
- Round 3 / N (N≥3) confirm 後標 ✅ + cite specific T1 source（external PDF / transcript / contract binary）
- Sweep agent 跑完 **必 user spot check**、不可只看 sweep agent report 就 ship
- ASR transcript 多變體 **不可假設同人**、每變體 cite specific timestamp + context

---

## §7. 使用情境

| 案件類型 | 何時啟動 Protocol A |
|---|---|
| **聯名 / 對外 RFP** | Phase 0 discovery 起、所有人名 / role 入 raci.md 前必過 T1 verify |
| **顧問式提案 / consultative** | Module 11 / 12 stakeholder mapping 前必確認 person + role + actor 三維 |
| **重大 CR / scope shrink / 合約 amendment** | 5-row decision chain explicit、不可單一 actor naming |
| **5/28 Teams transcript / Zoom recording archive** | Cross-reference 校正對照表必入 source-documents/、ASR 變體必 cite timestamp |
| **任何 sweep agent ship 後** | User spot check 4-5 處 random instance、verify Protocol A 對齊 |

---

**版本**：v0.1、2026-06-02
**起源**：Amafans EAQS 2026-05-29 ~ 2026-06-01 session 累積 5 dogfood + ASR conflation + Bruce/Sara sweep miss 翻車後提煉
**驗證狀態**：6 dogfood 全 verified via T1 external source (5/13 PDF / 5/28 transcript / 合約 binary / user explicit confirmation)
**對應 skill 觸發**：未來 `/protocol-a-attribution` skill（暫無、本 methodology 可被 phase-0-discovery / cr-handling-protocol skill cross-ref）
