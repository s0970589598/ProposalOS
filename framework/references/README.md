# ProposalOS — References Library

> ⚠️ **Library purpose**：累積跨案件、跨 session 重用的「外部 authoritative citation」中央索引。避免每次新案 use-and-forget、重新 WebSearch、重新踩雷。
>
> Per Amafans EAQS 2026-05-29 retrospective Part A directive：「framework 應該累積 web / 論文 / 業界資訊 + 內化、不要 use-and-forget」。
>
> 對應 `~/.claude/CLAUDE.md` 的 「外部狀態事實主張 — 驗證 checklist」、Multi-tool verification protocol。
>
> **Library scope as-of 2026-06-01**：基於 amafans-eaqs session（13 module、12 research、8 industry-addon、23 methodology）累積的 200+ 筆引用。未來案件持續累加。

---

## 為什麼要有 references library

| 問題（沒有 library 之前）| 對應翻車模式 |
|---|---|
| 每案重新 WebSearch 同一個 ISO / NIST 標準、產生不同 phrasing | session-retrospective AP-NEW-ANTI-HALLUC-2「業界主張靠印象」 |
| Vendor URL 改版、舊 cite 連結死、新案不知道 | scope drift、citation rot |
| 同一 case 跨 doc 用不同 hedging level（這邊 ✅ verified、那邊 ⚠️ training-data）| AP-NEW-ANTI-HALLUC-4 hedging language not aligned |
| 學術 paper（CBE Berkeley / arXiv）下次案件不知道誰引過 | 重複勞動、二次引用變一次引用導致 hedge level 失準 |
| Gartner / IDC 等 paywalled report、secondary cite 沒標、被誤認 primary | paywall citation antipattern |

**Library 解法**：所有外部 citation 集中索引、每筆標 hedging level / verified-where / cited-where、新案先查 library、library 沒收的才 WebSearch + 回寫 library。

---

## 7 大分類

| 分類 | File | 範圍 |
|---|---|---|
| **1. Regulatory / Standards** | `regulatory-standards.md` | ISO / IEC / NIST / ASHRAE / CNS / OSHA / GDPR / 個資法 / 經濟部公告 / OWASP / RFC |
| **2. Academic Papers** | `academic-papers.md` | arXiv / IEEE / ACM / CBE Berkeley / 大學實驗室 paper |
| **3. Industry Analyst Reports** | `industry-analyst-reports.md` | Gartner / IDC / Forrester / Deloitte / McKinsey / 工研院 / 經濟部產業 report |
| **4. Vendor / Product Docs** | `vendor-product-docs.md` | Big Ass / MacroAir / Magnovent / Hunter / Daikin / HiveMQ / Anthropic / AWS / Robustel / Kaiterra |
| **5. Case Studies** | `case-studies-references.md` | IKEA / Coca-Cola / Newmarket / 大同大學 EMS / TSMC SEMI E187 / Singapore ZEB Plus |
| **6. Standards / Protocols（technical）** | merged into §1 + `vendor-product-docs.md` | Sparkplug B / ISA-95 / OpenAPI / SAML / OIDC |
| **7. Books / Frameworks** | `vendor-product-docs.md` §Methodology references | Klein pre-mortem / Cynefin / Kano / Pyramid Principle / Wardley |

---

## Tagging convention（每筆 citation 必有）

```markdown
### [Source Title or Standard Name]

- **Type**: Regulatory standard | Academic paper | Vendor doc | Case study | ...
- **Authority**: ISO | IEC | NIST | arXiv | Gartner | <vendor> | <author>
- **Year / Revision**: YYYY 或 YYYY-MM-DD（標準 revision 一律標出版本年）
- **URL**: https://...（official source、不引 medium / blog 二次引用 unless 該 blog 自身為 vendor 官方）
- **Hedging level**: ✅ Verified（直接 cite primary source）| ⚠️ Training-data（印象、未 WebSearch）| ❌ Paywall secondary cite
- **Cited where**: `/path/to/framework/file.md §X` + `/path/to/case/file.md §Y` + ...
- **Notes**: scope / latest changes / 注意事項
```

---

## Hedging level 3 等級

| Level | 條件 | 用法 |
|---|---|---|
| **✅ Verified** | 直接 WebFetch 過 official source + 引用 clause / page number 對應 | 對外 deliverable 可直接 cite、無需加 disclaimer |
| **⚠️ Training-data** | 框架建構時引用、印象正確、但本 session 未 WebSearch 重驗 | 對外 deliverable 用前必加 disclaimer「per training data, recommend re-verify」 |
| **❌ Paywall secondary** | Gartner / IDC / Forrester paywall report、引用自第三方 blog / press release | **僅作為「業界趨勢 mention」、不可作為「數字錨點」** |

**自檢句**：寫對外 deliverable 引用本 library 時、必複製 hedging level 進 deliverable 對應位置、避免「library 標 ⚠️、deliverable 寫成 ✅」level 漂移。

---

## Versioning（標準有 revision number）

很多標準會隨時間 revise，本 library 必標 revision year：

| 範例 | 標準完整 ID |
|---|---|
| ISO 27001 | ISO/IEC 27001**:2022**（前版 :2013）|
| ASHRAE 62.1 | ASHRAE 62.1-**2022** |
| NIST SP 800-213A | NIST SP 800-213A（2021、未來可能有 update）|
| 經濟部能源署電力排碳係數 | **2024 公告 0.474 kgCO₂e/kWh**（2025-04-14 公告、屬 2024 全年數字）|

**舊 revision 不刪、加 `_archived` 標籤、註記 supersede**。

---

## 跨檔引用 convention（framework 引 library 的方式）

✅ **建議**：framework / module / case file 引用時用 library 連結、不要 inline 寫 full URL（避免 URL rot 同步修改 50 個檔）。

```markdown
# Bad（inline、URL rot 後痛苦）
per [NIST SP 800-213A](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-213A.pdf)

# Good（指向 library、單點 update）
per [NIST SP 800-213A](../../framework/references/regulatory-standards.md#nist-sp-800-213a-iot-cyber-baseline)
```

**例外**：deliverable 對外 PDF / pitch deck 直接給客戶看的、URL 仍 inline cite 完整（客戶不會去翻 framework）。

---

## 如何新增 reference（簡版）

詳見 `CONTRIBUTING.md`。基本流程：

1. **先 search library** 確認沒收過（grep 標題 / URL）
2. **WebFetch / WebSearch 確認 primary source URL 可解析**（避免引死連結）
3. **加到對應分類 .md 檔**（regulatory / academic / analyst / vendor / case / 7-1 表）
4. **填完整 metadata**（Type / Authority / Year / URL / Hedging / Cited-where / Notes）
5. **加 entry 到 `INDEX.md` 對應 trigger 段**（哪些 module / addon / methodology 會用到）
6. **commit message**：`refs: add <citation-name> per <case-name> §X discovery`

---

## 如何 update 既有 reference（standard revise 了）

1. 找到舊 entry、`_archived` 標起來、保留歷史
2. 新增「Latest revision」段、cite 新 URL + 新 year
3. Grep 全 framework + cases 找出引用舊版的、評估是否要 migrate（同 revision 但 minor / major change）
4. 加 `Migration notes` 段、教未來人怎麼 migrate

---

## 跨 case 重複引用 antipattern

**避免**：
- 同一 case 不同 doc 用不同 hedging（research/03 標 ✅、deliverable/03 標 ⚠️）→ library 統一
- Cite vendor blog 當成 industry consensus（vendor blog = vendor claim、不是中立 source）→ Hedging 必標 ⚠️
- 把 Gartner 二次引用（如 Azure 在 PR 上引 Gartner Magic Quadrant）當 Gartner primary source → 必標 ❌ paywall secondary

---

## Library 範圍 disclaimer

**本 library 是 ship-as-of 2026-06-01、based on amafans-eaqs session（13 module / 12 research / 8 industry-addon / 23 methodology + ProposalOS framework state）的 200+ 筆累積**。

- 未涵蓋：法律全文逐條（只索引）、付費 industry report 全文（只索引 + paywall hedging）
- 未來 case 持續 append、本 library 是 living doc、不是 frozen snapshot
- 對應 `~/.claude/CLAUDE.md` 的 Goodlinker / proposal 通用驗證規則、不取代

---

## 對照表（library 跟既有 framework 的關係）

| 既有 framework | 本 library 補的 gap |
|---|---|
| `methodologies/multi-tool-verification.md` | 提供「驗哪些 source」的清單（標準 / paper / vendor doc / case）|
| `methodologies/phase-0-discovery.md` | Layer 2 domain depth question 引用本 library |
| `industry-addons/*.md` | addon 用到的 vendor / standard 全部指向本 library |
| `modules/0?-*.md` | module 引用具體 vendor / standard 全部指向本 library |
| `8-mandatory-checks/D-secure-sdlc.md` | OWASP / RFC / NIST 全部指向本 library |

---

## Q&A

**Q：本 library 跟 `methodologies/` 有什麼不同？**
- methodologies = 框架方法（怎麼做）
- references = 引用 source（從哪查證）

**Q：本 library 跟 `industry-addons/` 有什麼不同？**
- industry-addons = 特定產業的延伸 module（air quality / hvls / healthcare etc.）
- references = 跨產業共用的 citation index

**Q：每個案件的 case-specific data（PROD query、客戶 onsite 數據）放這嗎？**
- 不放。Case-specific 是 case folder 內的 verified data、不通用。
- 本 library 只收**跨案可重用**的外部 citation。
