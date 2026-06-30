# SI Doc Industry Benchmark Methodology

> **跨案 reuse 用**：SI 接案 FRD / 文件維護 system 對齊業界 standard 的 benchmark methodology + 山虹 case 為 first data point
>
> **Source**: 山虹 2026-06-30 2 fork industry research
> **Status**: First case data point、wait 2nd SI 案確認 pattern generalize 才升 framework-level anti-pattern

---

## 用途

新 SI 接案 / 提案啟動時用本 methodology 評估：
1. **FRD spec 對齊度** vs 5 業界 standard (IEEE 830 / Karl Wiegers / ISO 29148 / Volere / arc42)
2. **Doc maintenance system 對齊度** vs 業界 mature 方案 (Doorstop / OpenFastTrace / Vale / CIA / CODEOWNERS)

避免每案重新 reinvent benchmark 過程、累積 verified standard 對齊度 baseline。

---

## Layer 1: FRD vs 5 業界 SRS Standard 對齊 matrix

### 5 個 standard 一句話 cover

| Standard | Year | 性質 | 跑度 |
|---|---|---|---|
| **IEEE 830-1998 SRS** | 1998 | Classic、widespread legacy | 古典基準、看舊系統用 |
| **Karl Wiegers Software Requirements 3rd ed** | 2013 | Industry bible、Wiegers + Beatty | 業界 SI 顧問必讀、template-rich |
| **ISO/IEC/IEEE 29148:2018** | 2018 | **Current SRS standard** (replaced IEEE 830) | 現行 standard、最 modern |
| **Volere Requirements Specification Template** | 2012 | Robertson、project-mgmt heavy | 含 risk register / open issues / waiting room |
| **arc42** | 2014 | Architecture-leaning | 看 architecture 表達層、部分屬 SA / SD scope |

### 評分 dimension（per standard 必須 cover）

每個 standard 列 mandatory section、評 coverage:
- 100% = section exist + 含 substantive content
- 70-90% = exist but partial / mislocated / shallow
- 30-50% = stub only / scattered fragments
- 0% = absent

### 山虹 case 第一個 data point (2026-06-30)

| Standard | 山虹對齊度 | 評語 |
|---|---|---|
| ISO 29148 | **80%** | 最佳對齊、industry-bible level |
| IEEE 830 | 73% | 缺 interface section depth (2.1.4-2.1.7) |
| Karl Wiegers 3rd ed | 65% | 缺 Assumptions section、缺視覺化 (DFD / state-transition / sequence) |
| Volere | 58% | 缺 risk register P × I、缺開放 issues、缺 waiting room (deferred ideas) |
| arc42 | 52% | 缺 building block view、缺 ADR、部分 defer to SA / SD |

### 山虹 7 critical gap (severity-weighted)

| Gap | Severity | 觀察 | Cost to fix |
|---|---|---|---|
| **G1 Assumptions list** | HIGH | 客戶 sign-off liability boundary、出事合約論點靠 explicit assumptions | 2-3h |
| **G2 Risk register P × I × mitigation × trigger** | HIGH | ISO 9001 §6.1 risk-based thinking 對得起但 sponsor transparency 不夠 | 4-6h |
| **G3 ADRs** | MEDIUM | 3-year 保固期 maintenance protection、特別 tech reversal (e.g., Flutter→WebView) 無 audit trail | 6-8h |
| **G4 State diagram for critical state machine** | HIGH | ★★★★★ critical risk row prose-only、Sprint 0 spike 會 reinvent | 2-3h |
| **G5 System context diagram** | MEDIUM | Sponsor comprehension、何經理 看不到「我買的系統邊界」 | 2h |
| **G6 Verification method T/A/I/D column** | LOW | AC + E2E 已 80% cover、加 column bureaucratic | SKIP |
| **G7 Sequence diagram for killer feature** | MEDIUM | Killer flow performance root-cause 分析需要 | 2h |

### 例外 / 強制 SA / SD scenarios

不能 skip 獨立 SA / SD 的 case:
- 政府標案 / 合約明列 SA / SD 為驗收 deliverable
- 高度複雜 legacy system 改造（數百張表 / 不釐清 ER + 相依性 = 連鎖災難）
- 客戶 audit 嚴格要求文件層 separation (e.g., 國防 / 醫療 / 金融)

---

## Layer 2: Doc Maintenance vs 業界 Mature 方案對齊

### 業界 mature 方案 inventory

| 方案 | Star | 性質 | 適用 |
|---|---|---|---|
| **Doorstop** | 637★ | YAML-per-requirement + git native + parent-child validation + RTM matrix | 100+ component multi-team |
| **OpenFastTrace** | 149★ | Tag-based cross-format coverage、CI gate friendly | Cross-format multi-doc |
| **Vale** (linter) | mature | Cross-doc style + terminology consistency lint、Datadog/GitLab/ING 用 | All doc-as-code |
| **Spectral** | mature | OpenAPI spec consistency lint | API spec only |
| **CIA (Bohner/Arnold 1996 IEEE)** | textbook | Change Impact Analysis methodology、3-step (Analyze → Trace → Implement) | Multi-doc cascade |
| **CODEOWNERS** + branch protection | GitHub native | Cross-team PR gate、required reviewers GA 2026-02 | Multi-author repo |

### 評分 dimension（per 業界 best practice）

30 row matrix 評估、每 row 對齊度 0-100%。

### 山虹 case 第一個 data point (2026-06-30)

**Aggregate**: ~58% 對齊度 (govern / ownership / process 強 ~90% / enforcement / automation 弱 ~10%)

### 山虹 6 真實 gap (severity-weighted)

| Gap | Severity | Cost | 推薦 |
|---|---|---|---|
| **DM-G1 Pre-commit hook (commit-time enforcement)** | HIGH | 1-2h (reuse script) | DO NOW |
| **DM-G2 Vale custom cross-doc lint + CI** | HIGH | 2-4h | DO NEXT |
| **DM-G3 Per-item source-of-truth (Doorstop-style YAML migration)** | MEDIUM | 16-24h | DEFER 2nd SI case |
| **DM-G4 Cascade metric / measurement** | MEDIUM | 2-3h | DO |
| **DM-G5 Stale-claim auto-flag** | MEDIUM | 1-2h (reuse) | DO (bundle G1) |
| **DM-G6 CODEOWNERS + branch protection** | LOW | 30min | DO (cheap) |

---

## 跨案 reuse 用法

### Step 1: 啟動新 SI 案 / 提案

```bash
# 跑本 methodology 對 FRD draft / 既有 doc system 評估
# 結果寫進 case-specific benchmark report
```

### Step 2: 對 5 standard 評分

| Standard | 你案對齊度 | 主要 gap |
|---|---|---|
| ISO 29148 | __% | __ |
| IEEE 830 | __% | __ |
| Wiegers | __% | __ |
| Volere | __% | __ |
| arc42 | __% | __ |

### Step 3: 對業界 mature 方案評分

30 row matrix、aggregate 對齊度、找 4-6 個 real gap。

### Step 4: Severity-weighted recommendation

不要灌水補全、只補 HIGH + MEDIUM、SKIP LOW + DEFER over-engineer。

### Step 5: 累積 data point 比對

| Case | FRD ISO 29148 | Doc maintenance | HIGH gap 數 | Action 完成度 |
|---|---|---|---|---|
| 山虹 2026-06-30 | 80%→88% | 58%→75% | 4 (G1/G2/G4 + DM-G1/G2) | Chunk A done、B + C pending |
| (待第 2 案 data point...) | | | | |

---

## Source citations (山虹案 verified、跨案 reuse 參考)

- [IEEE 830-1998 SRS template](https://www.cse.msu.edu/~cse870/IEEEXplore-SRS-template.pdf)
- [Karl Wiegers SRS Template (modernanalyst.com)](https://www.modernanalyst.com/Resources/Templates/tabid/146/ID/497)
- [ISO/IEC/IEEE 29148:2018 (reqview.com summary)](https://www.reqview.com/doc/iso-iec-ieee-29148-templates/)
- [Volere Requirements Specification Template (volere.org)](https://www.volere.org/templates/volere-requirements-specification-template/)
- [arc42 docs](https://docs.arc42.org/home/)
- [Doorstop GitHub](https://github.com/doorstop-dev/doorstop)
- [OpenFastTrace User Guide](https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md)
- [Vale documentation](https://vale.sh/docs)
- [Bohner & Arnold CIA (IEEE Press, 1996)](https://books.google.com/books/about/Software_change_impact_analysis.html?id=IQFRAAAAMAAJ)
- [GitHub CODEOWNERS](https://docs.github.com/articles/about-code-owners)
- [Datadog Vale blog](https://www.datadoghq.com/blog/engineering/how-we-use-vale-to-improve-our-documentation-editing-process/)

---

## Cross-link

- 山虹 2 fork report 永久保存:
  - `tasks/ac01c5c33368dad54.output` (FRD vs 5 standard 完整)
  - `tasks/a7102b87751cc5865.output` (doc maintenance 完整)
- si-spec-builder skill Rule 28 (FRD 取代 SA/SD canonical Q&A)
- `~/.claude/projects/-Users-ylwu/memory/feedback_si_doc_cr_cascade_workflow.md` (CR cascade SOP)
- `~/.claude/projects/-Users-ylwu/memory/feedback_self_review_blindspot.md` (ship gate)
- `~/.claude/projects/-Users-ylwu/memory/feedback_cascade_hook_design.md` (enforcement hook design)
