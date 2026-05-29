# AI Codegen 反技術債（Anti-Debt）方法論

> 給「規格 → AI codegen → MVP / production」流程使用。
> 對應 Phase 7（系統設計 + MVP 交付）+ ai-handoff/spec.md 寫法。
> 防 **vibe coding** 在「第 3 月 Spaghetti Point」前崩潰、不讓 spec-driven dev 變 prompt-and-pray。

---

## 1. 為什麼這份重要

per 2026 業界研究：
- **85% dev 每週用 AI codegen 工具**（Karpathy 2025 提出 "vibe coding"、現已主流）
- AI 產 code 量是人類 **3-4 倍**、技術債也以 3-4 倍速累積
- 「**Spaghetti Point**」典型 **第 3 個月**出現：velocity 從超快掉到趨近 0、團隊全在救火
- 35 CVEs 一個月（2026-03）**直接歸因 AI codegen 工具**（per Georgia Tech Vibe Security Radar）
- 近**半數 AI 生 code 含安全漏洞**（多個研究 confirm）

→ 不寫好 spec、AI codegen 必崩。

---

## 2. AI Codegen 8 大技術債類型

| # | 類型 | 症狀 | 為什麼 AI 容易產生 |
|---|---|---|---|
| 1 | **過度抽象**（over-abstraction）| 莫名 factory / strategy / abstract base class | AI 訓練資料含大量 enterprise pattern、套用不分場合 |
| 2 | **Boilerplate 爆炸**（boilerplate sprawl）| 過多 null check / try-catch / getter/setter / 命名重複 | AI「填滿空間」偏好、verbose > terse |
| 3 | **Pattern 不一致**（inconsistent conventions）| 不同 session 不同 style、混 camelCase / snake_case | AI 沒長期記憶、每次重新「決定」style |
| 4 | **依賴爆炸**（dependency creep）| 為 trivial task 引入 popular lib | AI 偏好「業界常用」、不考慮 std lib 可解 |
| 5 | **Test 戲（test theater）** | 寫 test 但只測 structure / mock 自己 | AI 偏「有 test」表象、不深究 test 含金量 |
| 6 | **安全盲點**（security blind spots）| Tenant 隔離 / SQL 注入 / 越權 edge case | AI 不認得業務上 trust boundary |
| 7 | **過早優化**（premature optimization）| 還沒 profile 就 cache / memoize / index 滿天 | AI 偏「最佳實踐」、不問是否必要 |
| 8 | **理解債**（comprehension debt）| Code 看起來 work、但無人能解釋為何這樣寫 | AI 跳過解釋、直接給 code、後人看不懂改不動 |

⚠️ 額外**「Self-Admitted Tech Debt」**：AI 喜歡留 `// TODO: implement X` 然後跳過、變成永久 marker。

---

## 3. 10 個 Anti-Pattern（給 spec 寫法 + review 用、必避）

### 🚫 Anti-pattern 1：Accept-without-read（最高 severity、業界 #1 雷）

開發者沒看 AI 生的 code 就 commit / approve。

**症狀**：PR description「LGTM」、實際沒人讀過 200 行 diff。

**對策**：
- **Spec 段強標：每個 AI-authored PR 必經人類 code review**、寫進工程紀律
- **PR template** 含「I have read every line」checkbox（強制 user 勾）
- CI fail 若 commit message 含 `Generated-by: AI` 但無 reviewer signoff

### 🚫 Anti-pattern 2：Copy-paste sprawl（agent never saw）

AI 在不同 session 對同問題給不同答案、各 component 重複實作。

**對策**：
- Spec 段列「**Reusable utilities**」庫、強制用既有 helper
- AI prompt 必先 read existing utils 才 generate
- Lint rule 禁 hardcoded 重複（e.g. duplicate string > 3 次必 const）

### 🚫 Anti-pattern 3：Spec 太抽象、給 AI 自由發揮

「實作一個 dashboard」→ AI 給 1000 行 React 含 lottie 動畫。

**對策**：
- Spec 必含 **out of scope** 列表（per Phase 7 Phase A.4）
- 每個 component **明列 props / events / 不該做什麼**
- 給 mock data fixture、AI 不可自行造資料

### 🚫 Anti-pattern 4：未限定 tech stack、AI 自己選

Spec 沒寫「用 Vue 3」→ AI 隨意給 React / Svelte / Next.js 混用。

**對策**：
- Spec §「Tech stack（必用、不可換）」段
- 每層**精確版本**：Vue 3.x / Vite x.y / Element Plus x.y
- 明列「不選 X 因為 Y」（per [tech-stack template](../modules/13-system-design-mvp.md)）

### 🚫 Anti-pattern 5：未限抽象層級

AI 為 5 個用戶的內部工具加 micro-services / k8s。

**對策**：
- Spec 強標 **scale 假設**（e.g. 「< 100 客戶 / 5 年內 < 10k req/min」）
- 明列 **不要的 pattern**（e.g.「不要 microservice / 不要 EventSourcing / 不要 DDD aggregate」）
- 抽象層 max 2 層（function 內 / service 內 / 不要再有 base class）

### 🚫 Anti-pattern 6：沒給 domain model、AI 用 generic naming

AI 命名 `Manager` / `Service` / `Handler` / `Processor` → 業務語意全沒。

**對策**：
- Spec §「**Domain glossary**」明列業務名詞
- e.g. amafans 案：`Fan` / `Sensor` / `Site` / `Area` / `ModeProfile` / `Alert` / `EnergyMeter`
- 禁 generic 命名 list（`Manager` / `Service` / `Util` / `Helper` / `Data`）

### 🚫 Anti-pattern 7：沒寫 test 期望

AI 寫的 test 只測「function 存在」、不測 business rule。

**對策**：
- Spec §「**Test cases must cover**」明列必驗 scenario
- 每 entity 至少 1 個 happy / 1 個 edge / 1 個 unhappy
- Test 必 assert business outcome（不是 mock 的回呼次數）

### 🚫 Anti-pattern 8：未限 file 大小 / function 長度

AI 不分檔、單檔 2000 行。

**對策**：
- Spec §「**Code size limits**」：
  - File ≤ 300 行
  - Function ≤ 50 行
  - Class ≤ 10 method
- 超過 → AI 必拆檔、不可塞同檔

### 🚫 Anti-pattern 9：跨 session 不一致

不同 AI session 對同 codebase 做不同 style 改動。

**對策**：
- **單一 source of truth**：CLAUDE.md / AGENTS.md / `.cursorrules` / spec.md 必 commit + 每次 prompt 先載入
- Lint + format（prettier / eslint / phpstan）強制統一
- 第一次寫好的 pattern 必 document、後續 follow

### 🚫 Anti-pattern 10：依賴 AI 「自己決定」security

AI 不認得 tenant 隔離 / SQL 注入 / 越權 edge case。

**對策**：
- Spec §「**Security boundaries**」必明列：
  - 每個 query 必 `WHERE company_id = ?`
  - 每個 endpoint 必過 `BelongsToCompany` middleware
  - 不可直接拼 SQL（必用 ORM / prepared statement）
  - 不可在 frontend 做權限判斷（per warroom CLAUDE convention）
- 過 SAST（static analysis）自動 scan、AI commit 必跑

---

## 4. Spec 寫法 checklist（給 ai-handoff/spec.md 用）

寫 spec 時逐項勾、防 AI 自由發揮：

### 必含段落
- [ ] §「Tech stack（必用、不可換）」+ 精確版本
- [ ] §「Out of scope」明列 N 項不該做
- [ ] §「Domain glossary」業務名詞 + 英文 mapping
- [ ] §「Code size limits」 file / function / class 上限
- [ ] §「Security boundaries」tenant / SQL / 越權 / SAST
- [ ] §「Naming conventions」（禁用 generic name list）
- [ ] §「Mock data fixture」AI 不可造資料
- [ ] §「Test cases must cover」per entity 至少 3 scenario
- [ ] §「Reusable utilities」既有 helper 強制重用
- [ ] §「Anti-pattern checklist」AI 必 self-check 後輸出

### 每個 component / feature 必含
- [ ] Props / Events / 不該做的事
- [ ] 對應 entity（不可創新 entity）
- [ ] 對應 API endpoint（不可自造 API）
- [ ] 對應 style token（用 design system、不 inline）

---

## 5. Code review checklist（給人類 review AI output 用）

AI commit / PR 必過：

### 🔍 Spec 對齊
- [ ] Component / function 在 spec §X 有列
- [ ] Out of scope 項目**沒被 AI 偷加**
- [ ] Domain naming 對齊 glossary（無 generic Manager / Service / Handler）

### 🔍 Tech 邊界
- [ ] 沒引新 dependency（per spec tech stack）
- [ ] 沒新 abstract base class / factory / strategy（除非 spec 明列）
- [ ] File size / function 長度符合限制

### 🔍 Test 含金
- [ ] Test 名稱描述 business outcome（不是 "test_X_returns_correct"）
- [ ] Test assert 業務不變量、非 mock 呼叫次數
- [ ] 每 entity ≥ 3 scenario

### 🔍 Security
- [ ] 每個 DB query 含 tenant filter
- [ ] 每個 endpoint 過 middleware
- [ ] 無 inline SQL / 無 eval / 無動態 require
- [ ] Pass SAST scan

### 🔍 Comprehension
- [ ] Junior dev 能在 30 min 內讀懂 + 改一個 feature
- [ ] 無「神秘魔法」（一段 code 看起來 work、不知為何）
- [ ] 註解只解釋 **why**、不解釋 **what**（per CLAUDE.md）

---

## 6. 「最小驚奇」原則（cross-cutting）

> 「**AI 必須遵循既有 codebase 的 pattern、不准創新**」

```
既有 codebase 有 pattern X → AI 必用 X、不可創 X'
既有 codebase 用 Vue 3 → 不可用 React
既有 codebase 用 Eloquent → 不可用 Doctrine
既有 codebase 命名 camelCase → 不可寫 snake_case
既有 codebase 用 axios → 不可用 fetch / ky / wretch
```

Spec 段必寫：「**參考 [existing/file.js]、follow 同 pattern**」。

---

## 7. 何時 **不要** 用 AI codegen

| 情境 | 為什麼不 |
|---|---|
| 跨 module 重構 | AI 沒 holistic view、可能破壞既有 contract |
| Security-sensitive code（auth / crypto / payment）| AI 漏洞率高、必專家寫 |
| 效能熱點 optimization | 需 profile data、AI 偏 premature optimize |
| 新 framework 升級 / migration | AI 易混新舊版 API |
| 客戶業務複雜規則（金融 / 醫療法規）| AI 不認規則、必專家驗 |
| 一次性 throwaway script（< 10 行）| 自己寫快、AI 過度設計 |

---

## 8. 跟 ProposalOS Phase 7 的關係

### Phase 7 ai-handoff/spec.md 必含本方法論引用：

```markdown
## ⚠️ AI Codegen Anti-Debt Constraints

per ProposalOS methodology: AI Codegen Anti-Debt（本檔）：

### 禁止
- ❌ 引新 framework / lib（per tech-stack §「不選的方案」）
- ❌ 新 abstract base class / factory / strategy（max 2 層抽象）
- ❌ Generic naming（Manager / Service / Handler / Processor / Util）
- ❌ File > 300 行 / function > 50 行 / class > 10 method
- ❌ Inline SQL / 跳過 tenant filter / frontend 做權限判斷
- ❌ Mock data 之外自造資料
- ❌ Out of scope §X 列的功能（不可偷加）

### 強制
- ✅ 沿用既有 [既有 codebase] pattern（e.g. warroom v3.17）
- ✅ Test per entity ≥ 3 scenario（happy / edge / unhappy）
- ✅ 業務 naming（per Domain glossary）
- ✅ 過 SAST + lint + type check
- ✅ Self-admitted debt 必同時開 issue（不可 silent TODO）
```

### 跟 Phase 5 強制檢查的關係：
- Phase 5 強制檢查項 D（Secure SDLC）= 本方法論 §5 security 段
- Phase 5 強制檢查項 E（SBOM）= 本方法論 §3 anti-pattern 4（依賴爆炸）

---

## 9. 業界 case study（避免重蹈覆轍）

### Case：「Spaghetti Point」案例（per Pixelmojo / Kyros 2026 研究）

```
Week 1：vibe coding 暴速、PoC 一週搞定
Week 4：feature velocity 開始降
Week 8：每加 1 feature 配 3 bug
Week 12（第 3 月）：velocity ≈ 0、團隊全救火
Month 6：重寫
```

**common root cause**：spec 太抽象、AI 各 session 不一致、無 review、test 戲、安全漏洞累積。

### Case：「AI-induced CVE Surge」（per Georgia Tech 2026-03）

35 CVEs in 1 month 直接歸因 AI codegen、最常見：
- 越權（缺 tenant filter）
- SQL 注入（AI 寫 raw query）
- XSS（frontend 不 escape）
- 過寬 CORS（AI 寫 `*`）

**對策**：本方法論 §3 anti-pattern 10 + §5 security checklist。

---

## 10. 工具 / Lint 配置 reference

### JS/TS
- ESLint + Prettier
- TypeScript strict mode
- `complexity` rule (max 10)
- `max-lines` (300) / `max-lines-per-function` (50)

### PHP (Laravel / warroom)
- PHP-CS-Fixer (PSR-12)
- PHPStan level 8
- Larastan
- `max-method-lines` (50)

### Python
- Ruff (lint + format)
- mypy strict
- bandit (security)

### Universal
- `pre-commit` hooks 強制
- CI fail 若 fail 任一 rule
- SAST：Semgrep / GitGuardian / Snyk

---

## 11. 心法：「**AI 是高速打字員、不是工程師**」

| AI 是 | AI 不是 |
|---|---|
| 高速 boilerplate 生成器 | Senior engineer |
| 知識補全工具 | Architect |
| 重複工作自動化 | Domain expert |
| 第二雙眼（review） | Code owner |

→ Spec 是工程師的契約、AI 是承包商、人類是業主。**業主不寫 spec、承包商一定亂蓋**。

---

## 12. 更新 log

- 2026-05-28 v1：初版（per amafans-eaqs-proposal Phase 7 套用過程、+ 業界 2026 vibe coding tech debt 研究）

## Sources（業界研究 reference）

- [Vibe-Coding Anti-Patterns: Ten Ways It Becomes Tech Debt](https://www.digitalapplied.com/blog/vibe-coding-anti-patterns-10-ways-it-becomes-tech-debt-2026)
- [The AI Coding Technical Debt Crisis: What 2026-2027 Holds](https://www.pixelmojo.io/blogs/vibe-coding-technical-debt-crisis-2026-2027)
- [Vibe Coding Tech Debt: How to Audit AI-Generated Code](https://www.kunalganglani.com/blog/vibe-coding-tech-debt-audit)
- [Vibe Coding's Security Debt: The AI-Generated CVE Surge (Georgia Tech)](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-generated-code-vulnerability-surge-2026/)
- [AI Technical Debt: How Vibe Coding Increases TCO](https://www.baytechconsulting.com/blog/ai-technical-debt-how-vibe-coding-increases-tco-and-how-to-fix-it)
- [Managing AI Debt: A Practical Playbook for LLM Systems](https://medium.com/@michael.hannecke/managing-ai-debt-a-practical-playbook-for-llm-systems-2a28af5ade01)
- [Spec-Driven Dev Prevents AI Tech Debt (Augment Code)](https://www.augmentcode.com/guides/ai-technical-debt-compounds-spec-driven-development)
- [Addy Osmani — My LLM coding workflow going into 2026](https://medium.com/@addyosmani/my-llm-coding-workflow-going-into-2026-52fe1681325e)
- [Comprehension Debt: The Ticking Time Bomb of LLM-Generated Code](https://shekhar14.medium.com/comprehension-debt-the-ticking-time-bomb-of-llm-generated-code-b8025e7f132a)
- [PromptDebt: A Comprehensive Study (arxiv)](https://arxiv.org/pdf/2509.20497)
- [TODO: Fix the Mess Gemini Created (arxiv)](https://arxiv.org/pdf/2601.07786)
