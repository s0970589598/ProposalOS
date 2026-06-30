I have everything I need. Producing the gap benchmark now.

---

# 山虹 FRD v1.0 — Honest Gap Benchmark vs 5 Industry SRS Standards

## Part 1: Coverage Matrix

Coverage scoring: **100%** = section exists with substantive content; **70-90%** = exists but partial / mislocated / shallow; **30-50%** = stub only / scattered fragments; **0%** = absent.

### IEEE 830-1998 (cited from [MSU mirror PDF](https://www.cse.msu.edu/~cse870/IEEEXplore-SRS-template.pdf))

| § | Required element | 山虹 FRD location | 完整度 |
|---|---|---|---|
| 1.1 Purpose | Document purpose statement | Ch 1.1 + §1.8 | 100% |
| 1.2 Scope | Product scope | Ch 1.6 + 1.9 | 95% |
| 1.3 Definitions | Glossary | Appendix A.1-A.5 | 100% |
| 1.4 References | External refs | Appendix B | 90% |
| 1.5 Overview | Document overview | §1.8.1 + Appendix C | 90% |
| 2.1.1 System interfaces | Sibling system boundaries | scattered (K1/K2 lesi、M1 hardware) | 50% |
| 2.1.2 User interfaces | UI overview | §4.5 + SCR-NN refs | 70% |
| 2.1.3 Hardware interfaces | HW spec | §1.6 + §4.5 + ref to `部署架構與硬體規格.md` | 80% |
| 2.1.4 Software interfaces | SW dependencies | §1.6 platform line only | 40% |
| 2.1.5 Communications interfaces | Network protocols | §4.2.3 TLS line only | 30% |
| 2.1.6 Memory | Memory constraints | §4.1.2 IndexedDB only | 50% |
| 2.1.7 Operations | Normal/special ops modes | §4.3.1 maintenance window only | 40% |
| 2.1.8 Site adaptation | Per-site config | absent (single-site case) | N/A → 0% |
| 2.2 Product functions | Function summary | §2.1.3 modules + §1.4 Killer | 100% |
| 2.3 User characteristics | User class profiles | §1.7 stakeholders + §4.2.2 RBAC | 70% |
| 2.4 Constraints | Design constraints | §1.6 | 95% |
| **2.5 Assumptions & dependencies** | **explicit list** | **absent** (only per-function Dependency 上游) | **20%** |
| **2.6 Apportioning of requirements** | Future-version split | partial — §1.9 Out of Scope but no v1 vs v2 priority phasing matrix | 60% |
| 3.1 External interface req | (same as 2.1) | (same as above) | 50% |
| 3.2 Functions | Functional req detail | Ch 2.2 (75 functions × 14 dim) | 100% |
| 3.3 Performance | Quantitative perf | §4.1 | 100% |
| 3.4 Logical DB req | Conceptual data model | §3.5 + ref to ER in PM-side catalog | 80% |
| 3.5 Design constraints / Standards compliance | Standards | §4.4 + §1.6 | 95% |
| 3.6 Software system attributes | Reliability / Security / Maintainability / Portability | §4.2-4.6 (Maintainability+Portability absent) | 70% |
| 3.7 Organizing specific req | Organization scheme | §2.1.2 by-feature scheme | 100% |

**IEEE 830 overall: ~73%**

### Karl Wiegers SRS Template ([modernanalyst.com listing](https://www.modernanalyst.com/Resources/Templates/tabid/146/ID/497))

| Section | 山虹 FRD location | 完整度 |
|---|---|---|
| 1. Introduction (Purpose / Conventions / Audience / Scope / Refs) | Ch 0-1 + Appendix C.3 audience-driven | 100% |
| 2.1 Product perspective | Ch 1.1 + 1.2 | 95% |
| 2.2 Product features | §1.4 Killer + §2.1.3 module breakdown | 100% |
| **2.3 User classes & characteristics** | partial — RBAC roles in §4.2.2 but no class profile (frequency / technical level / privilege rationale) | 50% |
| 2.4 Operating environment | §1.6 + §4.5 + 部署 doc | 90% |
| 2.5 Design & implementation constraints | §1.6 + §4.5 | 95% |
| **2.6 User documentation** | absent — §1.8 mentions User Manual as downstream doc but no spec | 20% |
| **2.7 Assumptions & dependencies** | **absent** | **0%** |
| 3. System Features (per-feature Description/Priority/Stimulus-Response/FR) | Ch 2.2 has Description + Priority + Edge case; **no stimulus-response sequence** | 70% |
| **4. Data requirements (logical model / data dict / reports / retention)** | §3.5 summary + retention in §4.2.4 + 9 domain split; **data dictionary** absent at FRD level | 60% |
| 5. External interface req (User / HW / SW / Comms) | scattered §1.6 + §4.5 + K1/K2 lesi; not consolidated | 50% |
| 6. Quality attributes | §4.1-4.6 | 95% |
| 7. Internationalization | §4.6 「繁體中文 only」 explicit | 100% |
| 8. Other req | §4.4 compliance | 80% |
| Appendix A Glossary | Appendix A.1-A.5 | 100% |
| **Appendix B Analysis models (DFD / ER / state-transition / swimlane)** | **0 diagrams in FRD** — refs deferred to SA spec | **15%** |
| **Appendix C Business rules** | scattered into Description / Edge case prose; no consolidated business rule catalog with rule IDs | 30% |
| **(Wiegers ch 8) Use cases** | absent — explicitly deferred to SA spec per §1.8 | 0% |

**Wiegers overall: ~65%**

### ISO/IEC/IEEE 29148:2018 ([reqview.com summary](https://www.reqview.com/doc/iso-iec-ieee-29148-templates/) + [wxinix template](https://github.com/wxinix/IEEE-29148-SRS-LaTeX-Template))

| Clause | 山虹 FRD | 完整度 |
|---|---|---|
| 9.5.1 Introduction | Ch 0-1 | 100% |
| 9.5.2 Overall description | Ch 1 | 90% |
| 9.5.3 Specified requirements | Ch 2 + Ch 4 | 95% |
| **Verification clause (per-requirement T/A/I/D)** | partial — §2.4 E2E + AC link present, but no per-FR verification-method column in MFC | 50% |
| **Per-requirement attributes** (Id/Heading/Text/**Owner**/**Priority**/**Source**/**Rationale**/**Difficulty**/Type/**Status**/Verification) | MFC 14-dim has 10 of 11; **Source / Rationale / Status** missing | 75% |
| **Standards compliance section** (separate clause) | §4.4 | 100% |
| Interface with services | K2 lesi + §3.4 API list | 80% |
| Supporting information / appendix | Appendix A-C | 100% |

**ISO 29148 overall: ~80%** (this is the best-aligned standard)

### Volere ([volere.org template](https://www.volere.org/templates/volere-requirements-specification-template/))

| § | Section | 山虹 FRD | 完整度 |
|---|---|---|---|
| 1 | Purpose | §1.1-1.2 | 100% |
| 2 | Stakeholders | §1.7 | 90% |
| **3** | **Facts & assumptions** | **absent** | **0%** |
| 4 | Naming conventions | Appendix A | 100% |
| 5 | Mandated constraints | §1.6 | 95% |
| 6 | Scope of work | §1.6 + §1.9 | 90% |
| 7 | Business data model & data dictionary | §3.5 summary only | 50% |
| 8 | Product scope | §1.9 + §2.1.3 | 90% |
| 9 | Functional requirements | Ch 2.2 | 100% |
| 10-17 | NFRs (look&feel / usability / perf / ops / maint / sec / cultural / compliance) | §4.1-4.6 — **maintainability + look&feel** absent | 70% |
| 18 | Open issues | absent | 0% |
| 19 | Off-the-shelf solutions | absent (no Nuxt vs alternative / Prisma vs alternative trade-off) | 0% |
| 20 | New problems | absent | 0% |
| 21 | Tasks | §3.2 Sprint plan | 90% |
| 22 | Migration | absent (greenfield case — N/A) | N/A |
| **23** | **Risks register** | partial — §2.3 / §2.1.4 list 6 critical risks but no **probability × impact × mitigation owner × timeline × trigger** register | 40% |
| **24** | **Costs** | explicit OUT-of-scope (§1.6 「另見商務合約」) | N/A |
| 25 | User documentation & training | §1.5 training time only | 50% |
| **26** | **Waiting room** | partial — §1.9 Out of Scope = killed; no "deferred-not-killed" v1.1+ ideas backlog | 40% |
| 27 | Ideas for solutions | absent | 0% |

**Volere overall: ~58%** (Volere is project-mgmt heavy; some sections out-of-scope by design)

### arc42 ([docs.arc42.org](https://docs.arc42.org/home/))

| § | Section | 山虹 FRD | 完整度 |
|---|---|---|---|
| 1 | Intro & goals | Ch 1 | 100% |
| 2 | Constraints | §1.6 | 95% |
| **3** | **Context & scope (system context diagram)** | prose only — no diagram showing 山虹 system ↔ lesi gateway ↔ 平板 ↔ ERP-future ↔ 何經理 PC boundaries | 40% |
| 4 | Solution strategy | §1.8.3 hybrid agile note + §1.6 platform stack | 60% |
| **5** | **Building block view** | absent — no module decomposition diagram (A-M modules listed as text only) | 20% |
| **6** | **Runtime view** (sequence diagrams) | absent — F2 報這盤 killer flow has no sequence diagram | 0% |
| **7** | **Deployment view** | refs `部署架構與硬體規格.md` — exists as separate doc, not in FRD | 70% |
| **8** | **Crosscutting concepts** (logging / sec / i18n as cross-feature patterns) | partial — §4.2 security + §4.3 reliability are scattered, not framed as crosscutting patterns | 60% |
| **9** | **Architecture decisions (ADRs)** | absent — no decision log for "why Nuxt 3 not Next.js / why Prisma not Eloquent / why WebView not Flutter" with date / context / consequence | 10% |
| 10 | Quality requirements | §4 NFR (generic targets) — **no quality scenarios** (per-NFR concrete trigger-response pairs) | 60% |
| **11** | **Risks & technical debt** | §2.3 risks present; **technical debt** absent | 50% |
| 12 | Glossary | Appendix A | 100% |

**arc42 overall: ~52%** (arc42 is architecture-leaning; FRD is correct to defer some to SA/SD)

---

## Part 2: 7 Critical Gaps for 山虹 case

Filtered for **B2B SI brownfield-from-prototype, 75 functions, 6.3-month ship, ISO 9001/RoHS audit-critical** — not academic completeness.

| # | Gap | What's missing concretely |
|---|---|---|
| **G1** | **Explicit Assumptions & Dependencies list** (IEEE 830 §2.5, Wiegers §2.7, Volere §3) | No section listing 「我們假設 lesi gateway API 在保固期不會 breaking change」「假設 山虹 WiFi 涵蓋率 ≥ 95%」「假設 何經理 60h training 投入」「依賴 Lenovo Premier 3 年 SLA」. These are **client sign-off liability boundaries** — when something breaks because the assumption was wrong, the contract argument hinges on whether the assumption was documented |
| **G2** | **Risk register with probability × impact × mitigation owner × timeline × trigger** (Volere §23, arc42 §11) | §2.1.4 + §2.3 list 6 critical risks with Sprint slot + owner + budget — but **no P × I scoring, no mitigation timeline, no monitoring trigger ("at what signal do we escalate?"), no contingency plan**. For ISO 9001 audit it's borderline; for sponsor (何經理) risk transparency it's thin |
| **G3** | **Architecture Decision Records (ADRs)** (arc42 §9) | Why Nuxt 3 over Next.js? Why Prisma over Eloquent? Why WebView wrap over Flutter (v5.7 deprecated Flutter — but no ADR for the reversal)? Why single Lenovo M90t vs HA pair? **For a 6-month SI with 3-year warranty, ADRs are the document that protects future maintainers** (and re-justifies the choices when 何經理 asks「為什麼當時這樣選」) |
| **G4** | **State diagram for J1 製程狀態機** (Wiegers Appendix B, arc42 §6) | J1 spec describes 6 states + transitions + cross-affect + locked derivation + 「重工不鎖回」 in **prose only**. Critical risk ★★★★★ with downstream cascade to J5 / G3 / H6 / F1 — and there's no visual. Sprint 0 spike will reinvent this diagram; better to ship it in FRD as the single source-of-truth |
| **G5** | **System context diagram** (arc42 §3, IEEE 830 §2.1.1) | No 1-page diagram showing 山虹 system boundary ↔ lesi gateway ↔ 3 平板 ↔ 何經理 Web ↔ MySQL ↔ Goodlinker remote monitoring. The 4-tier 部署 doc exists separately but the FRD has no system context — 何經理 cannot see「我買的系統邊界長這樣」at a glance |
| **G6** | **Per-requirement Verification Method column** (ISO 29148) | MFC 14-dim has "Test case" as optional column, but no T/A/I/D classification per requirement. For ISO 9001 §9.2 internal audit it matters: which requirements are verified by Test vs Analysis vs Inspection vs Demonstration? AC doc has BDD scenarios but **no verification-method taxonomy** |
| **G7** | **Sequence diagram for F2 報這盤 killer flow** (Wiegers stimulus-response, arc42 §6) | F2 is the killer feature with < 3s end-to-end target across tablet → IndexedDB → API → MySQL → SSE → Web dashboard. Performance section §4.1 gives the number; no sequence diagram shows the actor/component participants. Without it, P99 latency root-cause analysis post-launch will be slower |

**Honest skip list** (gaps that look real but shouldn't be filled for this case):

- ❌ Use cases (Wiegers Ch 8) — **correctly deferred to SA spec** per §1.8, not a FRD gap
- ❌ Business rules catalog (Wiegers Appendix C) — scattered into Description / Edge case is **acceptable for 75-function single-site case**; consolidating adds maintenance burden without sponsor value
- ❌ Volere §19 Off-the-shelf solutions — fixed-scope SI contract, vendor stack already chosen
- ❌ Volere §27 Ideas for solutions — explicitly OUT (FRD is WHAT not HOW per §1.8.1, IEEE 830 §4.7)
- ❌ Internationalization spec depth — §4.6 「繁體中文 only」is the right level, don't expand

---

## Part 3: Severity-Weighted Recommendations

| Gap | Severity | Why severity | Cost to fix | 推薦 |
|---|---|---|---|---|
| **G1** Assumptions list | **HIGH** | Contract liability boundary; client sign-off depends on it being explicit | 2-3h (1 dedicated §1.10 Assumptions section, 15-20 items) | **DO** |
| **G2** Risk register w/ P×I×mitigation | **HIGH** | ISO 9001 §6.1 risk-based thinking maps to this; sponsor transparency requires it | 4-6h (extend §2.1.4 to add P/I/trigger/contingency columns) | **DO** |
| **G3** ADRs | **MEDIUM** | 3-year warranty maintenance protection; v5.7 Flutter→WebView reversal already has no audit trail | 6-8h (5-8 ADRs in new Appendix D, each 1 page) | **DO** (start with the 5 critical decisions, defer rest) |
| **G4** J1 state diagram | **HIGH** | ★★★★★ critical risk row; visual prevents Sprint 0 spike rework | 2-3h (Mermaid state diagram embed in §2.3 J1) | **DO** |
| **G5** System context diagram | **MEDIUM** | Sponsor comprehension + on-boarding; nice-to-have for 何經理 | 2h (1 Mermaid C4-level-1 diagram in §1.2 or §1.6) | **DO** |
| **G6** Verification method column | **LOW-MEDIUM** | AC doc + §2.4 E2E + §2.5 already give 80% of the value; adding T/A/I/D column is mostly bureaucratic | 4-6h (add column to 75-row MFC) | **SKIP for v1.0**, revisit if ISO 9001 audit explicitly asks |
| **G7** F2 sequence diagram | **MEDIUM** | Killer feature deserves it but SA spec will produce sequence diagrams in Sprint 0-3 | 2h (Mermaid sequence diagram in §2.3 J2 or new §2.6) | **DO** (cheap, high signal for dev + QA) |

**Total "DO" effort**: ~18-24h FRD-extension work. **Total "SKIP"**: G6 (~4-6h saved).

---

## Part 4: 結論

山虹 FRD v1.0 對 5 standard 的對齊：**ISO 29148 80%** / **IEEE 830 73%** / **Wiegers 65%** / **Volere 58%** / **arc42 52%**. ISO 29148 是最佳對齊 standard、這合理、因為它是 current 業界 SRS standard 且山虹 FRD 在功能規格密度 (75 functions × 14 dim) + cross-doc traceability (5-anchor scheme) + NFR depth 上達 industry-bible level。

**真正缺的 3 個 high-severity dimension**：
1. **Assumptions list 完全 absent** (G1) — 客戶 sign-off liability boundary、必補
2. **Risk register 半成品** (G2) — §2.1.4 只列 6 risks 沒 P × I × mitigation timeline、ISO 9001 §6.1 對得起但客戶 transparency 不夠
3. **Critical risk 視覺化 absent** (G4 J1 state diagram + G7 F2 sequence) — ★★★★★ row 跑 prose-only、Sprint 0 spike 會 reinvent

**不要 over-engineer 補的**：use cases (consciously deferred to SA spec、正確)、business rules catalog (scattered acceptable for 75-function 單廠 case)、verification method column (AC + E2E + §2.5 已達 80%)、Volere §27 ideas / §19 off-the-shelf (fixed-scope SI、stack 已選)。

**ADR (G3) 中等 severity 但對 3-year warranty maintenance 高 ROI** — 特別是 v5.7 Flutter→WebView 反轉**沒有 audit trail**、5-8 ADR 補上去 cost 低。

**System context diagram (G5)** 對何經理 comprehension 高、Mermaid C4-L1 圖 2h 內可做、cheap win。

**Effort estimate**: ~18-24h FRD extension = ~3 dev day。對 6.3 個月 ship 600+h 預算來說 < 4%、非常划算。
