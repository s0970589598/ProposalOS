# Cross-Reference Migration TODO

> **Purpose**：列出既有 framework / case files 應該從 inline citation migration 到指向本 library 的待辦清單。**本 session NOT touching 這些檔**、留下次 session 處理（per 本 task spec「Don't actually edit the framework files this session — flag list」）。
>
> **Generated**：2026-06-01 references library 初版建構時
>
> **Migration principle**：framework / methodology / addon / module 內部 citation 改成指向 `framework/references/` library link；deliverable（對外 PDF / pitch deck）保留 inline URL（客戶不會去翻 framework）。

---

## §1. methodologies/ 待 migrate 檔（22 個 + README）

### High priority（多處 cite library 已收的 references）

| File | Inline citation 待 migrate | 對應 library entry |
|---|---|---|
| `methodologies/phase-0-discovery.md` | Gamestorming pre-mortem / Loopio red team / Atlassian scoping / McKinsey 7-step | academic-papers §3 + vendor-product-docs §8 + §10 |
| `methodologies/session-retrospective.md` | arXiv 2508.07407 + PagerDuty blameless + Echometer | academic-papers §1 + §5 + vendor-product-docs §9 |
| `methodologies/cybersecurity-frameworks.md` | ISO 27001 / IEC 62443 / NIST 800-53 / OWASP | regulatory-standards §1, §2, §7 |
| `methodologies/cr-handling-protocol.md` | Joe the IT Guy 5Q / Wibas CMMI | vendor-product-docs §10 |
| `methodologies/mlops-and-ai-governance.md` | Anthropic / Bedrock / GDPR Art. 22 | vendor-product-docs §4 + regulatory-standards §5 |
| `methodologies/ai-codegen-anti-debt.md` | CSA Research Note / 5 個 anti-debt blog | academic-papers §6 + vendor-product-docs §11 |
| `methodologies/multi-tool-verification.md` | （本身是 library 的 meta-methodology、reference 自己即可）| 全 library |

### Medium priority（少數 cite）

| File | Inline citation |
|---|---|
| `methodologies/cynefin.md` | HBR Cynefin article |
| `methodologies/kano-model.md` | HBR Kano article |
| `methodologies/pyramid-principle.md` | HBR Minto |
| `methodologies/wardley-mapping.md` | Simon Wardley learn page |
| `methodologies/jtbd.md` | Strategyn URL |
| `methodologies/bmc-vpc.md` | Strategyzer URL |
| `methodologies/c4-model.md` | c4model.com |
| `methodologies/dora-sre.md` | Google SRE book / DORA report |
| `methodologies/service-design.md` | （TBD）|
| `methodologies/software-architecture-patterns.md` | （TBD）|
| `methodologies/pestel-swot.md` | （TBD）|
| `methodologies/shipley-apmp.md` | （TBD）|
| `methodologies/rfp-rfi-rfq.md` | （TBD）|
| `methodologies/spine-mode-for-large-proposal.md` | （TBD）|

→ 全部 academic-papers §3 框架書段

---

## §2. industry-addons/ 待 migrate 檔（13 個 + INDEX）

### High priority

| File | Inline citation |
|---|---|
| `industry-addons/air-quality-system.md` | arXiv 2504.08237（多處）+ ASHRAE / CNS / OSHA / Senseair / Kaiterra | academic-papers §1 + regulatory-standards §3, §4, §6 + vendor-product-docs §2 |
| `industry-addons/hvls-fan.md` | CBE Berkeley + 全 HVLS 廠 vendor | academic-papers §2 + vendor-product-docs §1 + case-studies-references §1 |
| `industry-addons/iiot-deployment.md` | IEC 62443 + NIST 800-213A + HiveMQ + Robustel | regulatory-standards §1, §2 + vendor-product-docs §3, §6 |
| `industry-addons/healthcare.md` | ASHRAE 170 + USP + HIPAA | regulatory-standards §3, §8, §10 |
| `industry-addons/energy-esg.md` | 經濟部能源署 + TGPF + ASHRAE 90.1 | regulatory-standards §3, §4 + industry-analyst-reports §7 |
| `industry-addons/manufacturing.md` | IEC 62443 + TSMC SEMI E187 | regulatory-standards §1 + case-studies-references §4 |
| `industry-addons/b2b2b-channel-partnership.md` | Ironclad / Kiflo / UpCounsel + QBR template | vendor-product-docs §7, §9 |
| `industry-addons/saas-software.md` | B2B SaaS benchmark | industry-analyst-reports §11 |

### Lower priority（reference 尚未深耕）

| File | Status |
|---|---|
| `industry-addons/construction-realestate.md` | TBD |
| `industry-addons/finance.md` | TBD |
| `industry-addons/food-logistics.md` | TBD |
| `industry-addons/government-education.md` | TBD |
| `industry-addons/retail-ecommerce.md` | TBD |

---

## §3. modules/ 待 migrate 檔（13 個 + README）

各 module 對應 library cluster：

| Module | Inline citation expected | Library cluster |
|---|---|---|
| `01-industry-market.md` | TAM/SAM/SOM 報告 / 政府補助 | industry-analyst-reports §6 + regulatory-standards §4 |
| `02-competitors-alternatives.md` | Vendor product + analyst ranking | vendor-product-docs §1, §5 + industry-analyst-reports §5 |
| `03-problem-business-goals.md` | 學術 anchor + case | academic-papers §2 + case-studies-references §1 |
| `04-as-is-to-be-service-blueprint.md` | minimal |
| `05-stakeholders-raci.md` | Interview template | vendor-product-docs §8 |
| `06-data-integration-governance.md` | Protocol / sensor / IoT gateway | vendor-product-docs §2, §3, §6 |
| `07-compliance-security-ai-risk.md` | 全部合規（**重點 migrate target**）| regulatory-standards §1-7 + vendor-product-docs §3, §4 |
| `08-architecture-functional-nfr.md` | AWS / Azure SLA + edge | vendor-product-docs §3 |
| `09-solution-options-phased-rollout.md` | Discovery template + Klein | vendor-product-docs §8 + academic-papers §3 |
| `10-procurement-pricing.md` | 政府補助 | regulatory-standards §4 |
| `11-acceptance-benefits-operations.md` | NPS / SaaS benchmark + ITIL | industry-analyst-reports §11 + regulatory-standards §9 |
| `12-risk-assumptions-red-team.md` | Pre-mortem / red team | academic-papers §3 + vendor-product-docs §10 |
| `13-system-design-mvp.md` | IoT design + sensor placement | vendor-product-docs §3, §6 + academic-papers §1 |

---

## §4. 8-mandatory-checks/ 待 migrate 檔（9 個 + README）

| Check file | Inline citation | Library cluster |
|---|---|---|
| `A-rtm.md` | minimal |
| `B-communication-plan.md` | Interview template | vendor-product-docs §8 |
| `C-decision-log.md` | minimal |
| `D-secure-sdlc.md` | OWASP / RFC / NIST / GDPR Art. 28 / Anthropic（**重點 migrate target**）| regulatory-standards §2, §5, §7 + vendor-product-docs §4 |
| `E-sbom-license-supply-chain.md` | minimal（TBD）|
| `F-rto-rpo-rollback.md` | AWS DR | vendor-product-docs §3 |
| `G-exit-plan.md` | minimal |
| `H-evidence-pack.md` | 引全 library |
| `I-deployment-model.md` | AWS / Azure region + Robustel | vendor-product-docs §3 |

---

## §5. amafans-eaqs case files（保留 inline、原則上不 migrate）

### Research files（research/）

⚠️ **保留 inline**：research files 是 case-specific deliverable、URL 透明 + 客戶可審。但加 backlink 指向 library 提升 reuse：

```markdown
# Research file footer 加：
**References**: 部分 citation 已收進 [framework/references/](../../../ProposalOS/framework/references/INDEX.md)、可從 library lookup 對應 hedging status。
```

對應 12 個 research file（全部）。

### Deliverable files（deliverable-13pdf-client/）

⚠️ **保留 inline**：對外 PDF、客戶不翻 framework。但 build process 可加 reference appendix（per module）。對應 14 個 deliverable file（全部）。

---

## §6. proposal-intelligence/ 待 migrate

| File | Action |
|---|---|
| `industries/air-quality/README.md` | 改指 air-quality-system addon + library |
| `industries/hvls-fan/README.md` | 同 hvls-fan addon |
| `industries/b2b2b-partnership/README.md` | 同 b2b2b-channel-partnership addon |
| `industries/iiot/README.md` | 同 iiot-deployment addon |
| `competitors/hvls-fan/*.md` | 改指 case-studies-references |
| `competitors/*.md`（SUNON-建準 / 台塑網 / 鼎新 / 東捷）| 同上 |

---

## §7. Migration execution checklist（下次 session 跑時用）

```
For each file in §1-§4 list:

1. Read file
2. Grep inline URL（grep -nE "https?://" file.md）
3. For each URL：
   - Library 已收 → 替換成 markdown link 指向 references library（範例 syntax 見下、`<category>` 部分換成 regulatory-standards / academic-papers / industry-analyst-reports / vendor-product-docs / case-studies-references 五者之一）

   範例 syntax（pseudo、實際使用時 `<category>` + `<anchor>` 須替換）：

   ```
   [Library link] -> ../references/<category>.md#<anchor>
   ```
   - Library 沒收 → 先 follow CONTRIBUTING.md 加進 library、再替換
4. Add library reference footer
5. Commit per file 或 per directory（不要一個大 commit）
```

**預估時間**：~2-4 hr full migration（22 methodology + 13 addon + 13 module + 9 check = 57 files）。

---

## §8. Migration 不適合的情況

❌ **不要 migrate**：

- amafans `deliverable-13pdf-client/` 對外 PDF（保留 inline）
- 客戶 review 中的具體 case 文件（保留 inline、避免客戶看不懂 link）
- 已 frozen 的歷史 case folder（不動）

✅ **適合 migrate**：

- Framework / methodology / addon / module 內部文件（內部 reader = framework user、不是客戶）
- 跨案 reuse 的 reference（library 是 source of truth）

---

## §9. 完成 migration 後 expect 效果

| 指標 | Before | After |
|---|---|---|
| Framework 引用 URL inline 數 | ~200+ | ~10（剩下 unique inline）|
| 跨檔同一 URL 重複 cite 次數 | 平均 5x | 1x（指向 library 單點）|
| URL rot 一次 fix 影響 | 改 50 個 file | 改 1 個 library entry |
| Hedging level 跨檔不一致 | 高 | 低（library 是 single source of truth）|
| 新人 onboarding 找 reference 時間 | ~30 min（搜不同檔）| ~3 min（查 INDEX）|

---

## §10. 本 session 沒做但 follow-up 應做

- [ ] §1-§4 全 file migration
- [ ] proposal-intelligence migration
- [ ] WebFetch verify 所有 ⚠️ Training-data entry、升級成 ✅ Verified（季度跑）
- [ ] arXiv 2509.20497 / 2601.07786 metadata 補完
- [ ] Luo et al. 2021 / Singapore ZEB Plus 2015 primary access
- [ ] Anthropic Commercial Terms / DPA / Trust Center 2026 重 verify
- [ ] 「最常被引用 Top 10」每季 update（INDEX.md §7）
- [ ] 自動化 lint script：CI 跑 grep inline URL 在 framework 內部、提醒應 migrate 進 library
