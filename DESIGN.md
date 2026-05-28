# ProposalOS — Conference Talk Deck Design Spec

> 跑 `pitch-deck-builder` skill 用本 spec。
> 用途 = 15-min conference talk 介紹 ProposalOS 方法論、給跨業 SI / 顧問 / PM 社群。

## 1. Brand Identity

| 維度 | 內容 |
|---|---|
| Project type | **跨業方法論 / OSS framework**（不是客戶提案、不是 SaaS、不是 startup pitch） |
| Audience | **跨業 SI / 顧問 / PM conference 聽眾**（中小 SI 老闆、SI 顧問、PM、新創 CTO） |
| Tone | **Story + framework**（從個人痛點故事帶出方法論、不是 dry lecture）|
| Pitch length | **15 min conference talk**（不是 5-min lightning、不是 30-min workshop）|
| Output formats | HTML（投影機 share）+ PDF（會後留存 / GitHub README 引用）|

## 2. Slide Count Rationale

**N = 10**

**為何 10**：15 min conference talk 黃金區間 = 8-12 slide（~1.5 min/slide 含過場）。N=10 剛好：
- Story arc 3 段：hook 開場（slide 1-2）→ 痛點 + aha（slide 3-4）→ framework demo（slide 5-6）
- Evidence 3 案例（slide 7-8）+ continuous learning 機制（slide 9）
- Closing takeaway + ask（slide 10）

對應 `~/.claude/skills/pitch-deck-builder/references/slide-count-guide.md` **conference talk** 場景（10-12）的下限。

## 3. Color Palette

| Role | HEX | 用途 |
|---|---|---|
| Background | `#F8F4ED` | 暖米底（投影機強光下不刺眼、academic feel）|
| Surface | `#FFFFFF` | Card 純白 |
| Surface-2 | `#EFE9DE` | Nested 米底深一階 |
| Primary | `#3D348B` | 深靛藍（methodology 權威感、不是 startup tech blue）|
| Primary-light | `#5448A5` | Title gradient 配色 |
| Accent | `#C44536` | 暖鏽紅（anti-pattern warning、實驗室紅、跟 Amafans terra cotta 區隔）|
| Text | `#1F1B2E` | 深紫黑 body |
| Text-muted | `#6B6478` | Secondary muted purple-grey |
| Border | `rgba(61, 52, 139, 0.15)` | Subtle indigo |
| Danger | `#9B2226` | 失敗 mode 深紅 |
| Success | `#4A7C59` | 已驗案例綠（earthy、非鮮綠）|
| Warning | `#D68C45` | 警示橘（暖色系內）|

**為何選這個 palette**：
- **投影機友善**：light background 在會場強光下不刺眼、深底會被洗白
- **Academic / methodology 既視感**：靛藍 + 暖米底對標學術 paper / O'Reilly book / Pragmatic Programmer 視覺語言
- **暖色（米 + 鏽）+ 冷色（靛藍）平衡**：不會像 SaaS / startup deck 冰冷
- **跟前 4 個 deck 完全區隔**：
  - Goodlinker（深 navy + 工業藍 + 警示橘）= startup dark
  - 祥圃（米白 + 森林綠 + 暗金）= food trust serif
  - Amafans（淺灰 + 海軍藍 + 暖赤陶）= partnership light
  - 本案（暖米 + 深靛藍 + 暖鏽）= academic warm

## 4. Brand References

1. **Pragmatic Bookshelf / O'Reilly book design** — 米底 + 深色 + warm accent、methodology authority
2. **Stripe Press（pressstripe.com）** — 暖色 + serif、tech 但帶 academic 質感
3. **Edward Tufte 的書** — 資訊密度高但乾淨、investigation feel

## 5. Aesthetic Family

**「Methodology authority」** — 跨業方法論的權威感、不是 startup hype、不是 corporate dry、像 O'Reilly book 投影到 conference 大螢幕。

對標：Pragmatic Programmer × Tufte × Stripe Press visual。

## 6. Font Stack

| Role | Font | Fallback |
|---|---|---|
| Heading | **Fraunces**（serif、variable、academic + warm character）| serif, Noto Serif TC |
| Body | **Inter** + Noto Sans TC（clean readability）| sans-serif |
| Mono | JetBrains Mono | monospace |
| Display（大字 hero） | Fraunces 700 + opsz 高 | serif |

**為何 Fraunces**：
- 跟前 4 個 deck 完全不同 character（Inter / Noto Serif TC / IBM Plex Sans 都用過）
- Variable font with opsz axis、大字小字都漂亮（conference deck 用字大小範圍寬）
- Academic + warm character、不是冷 corporate serif
- Open source friendly（fits OSS framework brand）

## 7. Slide Type Mix（10 slide、Conference talk 版）

| Slide | Title | Layout | 為何 |
|---|---|---|---|
| 1 | Cover / Hook | `01-cover` 變體（大標題、大字）| Conference 開場要 punch、tagline 比 title 重要 |
| 2 | Story opening | 新 `story-quote` | Personal story / why I built this（建立 emotional connection）|
| 3 | Problem — 4 失敗模式 | 新 `failure-modes-grid`（4 卡 danger themed）| 痛點 framing |
| 4 | Aha moment | 新 `three-pillars`（3 大支柱）| 12 模組 / 8 檢查項 / retrospect 三件事 |
| 5 | How it works | 新 `phase-flow`（6 phase horizontal）| 視覺化整套 workflow |
| 6 | Framework deep dive | `03-use-case-grid` 變體（12 模組）| 12 模組一次列 |
| 7 | Evidence — 3 cases | `05-stats-customer` 變體（3 cohort cards + metrics）| 3 個 ship 過案例 |
| 8 | Anti-patterns 累積 | 新 `stat-hero` | 145 條 anti-patterns 累積、continuous learning |
| 9 | Why now × Why ProposalOS | `04-2-col-compare` | RFP-tool / SaaS 都做不到 |
| 10 | Get started + Ask | `07-gantt-ask` ASK 段變體（3 CTA card）| Fork repo / try / community |

→ 10 slide / 9 種 unique layout（anti-bento ≥ 5 ✓）。
→ 5 個新 pattern（story-quote / failure-modes-grid / three-pillars / phase-flow / stat-hero）為本 project 落地。

## 8. Anti-Slop Self-Check

- [x] Rule 1：Palette 暖米 + 深靛藍 + 暖鏽（**非 lavender**、跟前 4 個都不同）
- [x] Rule 2：Metrics solid color、cover 才用 gradient
- [x] Rule 3：Card border 均勻
- [x] Rule 4：用 emoji + heading typography、不 wrap icon container
- [x] Rule 5：**Fraunces serif**、跟 Inter / Noto Serif TC / IBM Plex Sans 都不同
- [x] Rule 6：無 stock image
- [x] Rule 7：emoji ≤ 3/slide functional（📚 方法 / ⚠️ 失敗 / ✅ 已驗 / 🎯 框架）
- [x] Rule 8：無 placeholder、3 case study 數字必驗
- [x] Rule 9：10 slide / 9 種 unique layout（anti-bento ✓）
- [x] Rule 10：cover hero 置中、其他 slide mixed-align
- [x] Rule 11：每 slide source footer cite（README / framework/X / examples/Y）
- [x] Rule 12：本 DESIGN.md 已填完

## 9. 跨 project 設計差異化（5 個 deck 已驗證）

| Project | Theme | Heading font | Audience | Status |
|---|---|---|---|---|
| Goodlinker × GCP | dark-industrial | Inter | Google PM | ship |
| Xiangpu MES | food-trust | Noto Serif TC | 採購委員會 | ship |
| Amafans EAQS | partnership-clarity | IBM Plex Sans | 雙方 leadership | ship |
| **ProposalOS conference talk** | **methodology-authority（暖米 + 深靛藍 + 暖鏽）** | **Fraunces** | **跨業 SI / 顧問 conference** | **本案** |

4 個 project = 4 種完全不同 visual identity = pitch-deck-builder 跨場景 robustness 驗證。

## 10. Conference talk 特殊考量

跟其他 deck 場景不同的 5 點：

1. **大字優先**：投影機距離遠、heading 必 ≥ 36px、body ≥ 18px（pitch-deck-builder default 較小、本 deck 加大）
2. **單一主訊息**：每 slide 一個核心 idea、避免 dense bullet list
3. **講者輔助**：deck 不是 self-contained 文件、是講者 speaker note 的視覺背景
4. **故事結構**：開場 hook → 痛點 → aha → demo → evidence → ask 的敘事弧
5. **memorable takeaway**：closing slide 必有 1 句話 quote 可在聽眾腦中駐留

→ 本 deck CSS 會調大字、單 slide 留白多、避免資訊密度過載。
