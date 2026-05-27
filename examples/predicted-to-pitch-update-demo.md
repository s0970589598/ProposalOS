# PREDICTED → Pitch / RTM / Q&A 修改 — Sandbox Demo

⚠️ **這是 sandbox 示範、不影響任何真實 pitch / RTM**。
⚠️ 用途：展示「AI 預判洞察」→ 「具體 pitch / RTM / Q&A 修改」的轉換流程。
⚠️ 若要真改 pitch v3、需另外手動套用本檔變更到 `goodlinker-gcp-pitch/docs/pitch_v3_final.md`。

---

## 場景

從 [`goodlinker-gcp-pitch/exploration/2026-05-27_haiui_interview_PREDICTED.md`](../../goodlinker-gcp-pitch/exploration/2026-05-27_haiui_interview_PREDICTED.md) AI 預判找出 2 個關鍵洞察：

1. **反向預判 1**：sustained 4 階可能不是客戶自己設、是 Goodlinker AM 共同累積
2. **反向預判 2**：接班人題客戶會迴避、know-how 集中風險真實存在
3. **⭐ 高價值題**：新人 onboarding 規則 know-how 在哪
4. **⭐ 高價值題**：客戶接受 AI 分享規則的條件

把這 4 個洞察轉成 3 種具體 artifact：

- Demo 1：Pitch §架構 / §AI 接受度段修改
- Demo 2：RTM 新增 2 條需求
- Demo 3：反方審查 Q&A 預備

---

## Demo 1：Pitch §架構段修改

### Before（原 pitch v3 §整合架構結尾 — 推測樣式）

```markdown
→ 整合是 **cur AWS stack 保留 + 新加 GCP analytics/AI 層、不取代**、
   客戶資料安全 AWS 主場、AI advisory 走 GCP。
```

### After（補強我方角色論述）

```markdown
→ 整合是 **cur AWS stack 保留 + 新加 GCP analytics/AI 層、不取代**、
   客戶資料安全 AWS 主場、AI advisory 走 GCP。

### Goodlinker 在 know-how 累積中的真實角色

> ⚠️ 待 6/8 訪海瑞驗證、預判（B 模式）顯示：
>
> 海瑞 sustained 8.4 年 0 改、**很可能不是客戶單方面設**、
> 是 **Goodlinker AM × 客戶廠長 / 製程工程師共同累積**：
> - 初期客戶提需求、AM 建議 sustained 級數
> - 試錯期 AM 根據其他食品客戶經驗微調
> - 8.4 年 0 改背後是「**早期 AM 介入 + 客戶接手**」的雙重貢獻
>
> **對 pitch 的意涵**：Vertex AI 提煉的不只是「客戶 know-how」、
> 也是「Goodlinker AM 累積的跨客戶 pattern」。這個雙重來源**強化我方護城河**：
> - 純客戶 know-how 競品難複製
> - AM × 客戶共同 know-how **連大廠也學不到**（Siemens / GE 不會做客戶 onboarding）
```

### 為什麼這樣改

| 改動                         | 來源洞察       | 對 pitch 的影響                    |
| -------------------------- | ---------- | ------------------------------ |
| 加「Goodlinker AM × 客戶共同累積」段 | 反向預判 1     | 強化護城河論述：不是被動平台、是主動 know-how 引擎 |
| 標「⚠️ 待 6/8 訪海瑞驗證」          | C2 模式 4 紅線 | 不假裝已驗、預判標 unverified           |
| 對比大廠（Siemens / GE）         | 競品分析 + 預判  | 把預判洞察接到既有 Win Theme            |

---

## Demo 2：Pitch §AI 接受度段修改

### Before（原 pitch 隱含 — AI 採用度從 16% 提升到 80%）

```markdown
> AI 採用度從 16% 月活躍 / 40% alltime 用過、提升到 80%
```

### After（補強 ROI 論述 — know-how 集中風險）

```markdown
> AI 採用度從 16% 月活躍 / 40% alltime 用過、提升到 80%

### 為什麼 AI advisor 對 Goodlinker 客戶 ROI 最強

> ⚠️ 預判（B 模式）洞察、待 6/8 訪海瑞驗證：
>
> 海瑞型客戶的規則 know-how **高度集中於 1-2 個老師傅**：
> - 訪談「新人 onboarding 怎麼帶」預期答案：靠老師傅、3-6 個月、沒正式 SOP
> - 訪談「你離職下一個人接得起來嗎」預期：迴避回答（know-how 集中風險真實）
>
> → **AI advisor 替代「老師傅帶」的 ROI 是傳統 SaaS 工具的 5-10 倍**：
> - 傳統 SaaS：替代 30% 重複動作 → 邊際效益小
> - AI advisor：替代「不可言傳」的老師傅判斷 → 解決客戶 succession risk
>
> 這是為什麼 Goodlinker × Vertex AI ≠ 「平台 + AI 包裝」、
> 而是 **「客戶接班人風險的真實 mitigation」** = 老闆 / 採購會優先採購的剛需。
```

### 為什麼這樣改

| 改動 | 來源洞察 | 對 pitch 的影響 |
|---|---|---|
| 加「know-how 集中於 1-2 老師傅」 | 反向預判 2 + ⭐ 高價值題 | 把模糊「AI advisor 提升採用度」變具體「替代老師傅 ROI 5-10x」 |
| 從 feature 升級到 succession risk | 預判洞察提煉 | Google PM 對「客戶剛需」比「平台 nice-to-have」更願給 credit |
| 標「⚠️ 待驗」 | C2 模式 | 同 Demo 1 |

---

## Demo 3：RTM 新增 2 條需求

### Before（推測現有 RTM）

```markdown
| 痛點 P-XX | 客戶要 AI advisory | R-XX 自動規則建議 | FR-XX AI Rule Advisor |
```

### After（加 2 條新需求）

```markdown
| 痛點 P-XX | 客戶要 AI advisory | R-XX 自動規則建議 | FR-XX AI Rule Advisor |
| **P-NEW-1** | **客戶 know-how 集中老師傅 / 新人 onboarding 失靈** | **R-NEW-1 AI 接手「老師傅帶」、變成隨身知識庫** | **FR-NEW-1 規則 know-how RAG + 新人 onboarding bot** |
| **P-NEW-2** | **客戶不願分享規則 know-how 給競品** | **R-NEW-2 匿名 know-how 共享機制（規則模式去客戶識別）** | **FR-NEW-2 跨客戶 pattern 提煉 + 匿名化引擎** |
```

### 為什麼加這 2 條

| 痛點 | 來源洞察 | 對 pitch / Phase roadmap 的影響 |
|---|---|---|
| **P-NEW-1** 新人 onboarding | ⭐ 高價值題 | 直接對應 pitch §「AI Onboarding Bot」、變成可量化 KPI |
| **P-NEW-2** 匿名分享 | ⭐ 高價值題 + 反向預判 2 | 對應 pitch §「Know-how RAG」、加上「匿名化」設計需求 |

⚠️ 標 P-NEW-1 / 2 是 **預判推導**、訪海瑞後須改為真實痛點 ID（P-XX）。

---

## Demo 4：反方審查 Q&A 預備

### Before（pitch 沒明顯反方審查段、Google PM 可能臨場問）

無對應準備。

### After（新建 §反方審查預備 段、或內部 Q&A 檔）

```markdown
## 反方審查預備（Google PM / Vertex AI CE 可能問）

### Q1：「客戶會接受 AI 分享規則嗎？」

**答**（基於預判 B 模式、待驗）：

> 預判海瑞 H 信度回答「可」、條件：
> 1. **匿名**（去客戶識別、規則模式去具體 sensor 名）
> 2. **不給直接競品**（食品業互不接觸的客戶 OK、跨產業更 OK）
> 3. **互惠**（分享方可優先用其他客戶 know-how）
>
> 對應產品設計：FR-NEW-2 匿名化引擎 + opt-in 模型。
> 6/8 訪海瑞會驗證這 3 條件是否真實。

### Q2：「客戶 know-how 真的轉得進 AI 嗎？」

**答**（基於預判）：

> 預判客戶連自己的 sustained 4 階機制都不一定記得（很可能是 Goodlinker AM 設）、
> 這恰好證明 **know-how 需要 AI 提煉**：
> - 客戶腦中 know-how 模糊、不結構化
> - AI 從**實際規則歷史**（Sensor-Rule-V3、982K version）+ **PROD 行為**反推
> - 結果 = 比客戶自己記得的還結構化、可遷移
>
> 6/8 訪海瑞會驗證這個假設（客戶能不能講清楚自己的規則邏輯）。

### Q3：「你們為什麼是 startup？」（規模、募資階段）

**答**（已有素材、需補）：

> 待 user 補：員工數、年營收、上一輪募資、Burn rate、startup 認定依據

### Q4：「Bedrock 已 0 真實使用、為什麼確定 Vertex AI 會被用？」

**答**（pitch 隱含、可加強）：

> Bedrock 失敗原因：team 沒投入時間（KB id `7OBPUEB3GQ` quick-start、0 真實 query）。
> Vertex AI 不同：
> - Phase 0 PoC 6 月底前完成、有具體 demo（嘉楠 IQF）
> - Phase 0 完成後寫 ADR-008、Go/No-Go 決策
> - 不是「先拿 credit 再說」、是「先驗證再 scale」
```

### 為什麼這樣準備

| 預備 | 來源洞察 | 對 Google PM intro call 的價值 |
|---|---|---|
| Q1 答案有 3 條件 | 預判 ⭐ 高價值題 | 從「我們覺得會」變「我們有具體預判 + 訪談計畫驗證」 |
| Q2 答案翻轉 know-how 模糊 | 反向預判 1 | 把客戶不記得變成 AI 的 ROI 證據（不是缺點） |
| Q4 答案強化 Vertex 不會重蹈覆轍 | 反方審查思維 | 主動回答 Google PM 一定會質疑的點 |

---

## 應用方式

如果你（看完 demo）決定真改 pitch v3：

```bash
cd ~/code/goodlinker-gcp-pitch

# 1. 開 pitch v3
$EDITOR docs/pitch_v3_final.md

# 2. 套用 Demo 1 修改到 §整合架構結尾
# 3. 套用 Demo 2 修改到 §AI 採用度段
# 4. 套用 Demo 3 修改到 RTM
# 5. 套用 Demo 4 修改到新 §反方審查預備段（或建獨立 Q&A 檔）

# 6. ⚠️ 注意 pre-commit lint 會偵測：
#    - 數字 cross-file 一致性（修正數 / paid / ADR 數）
#    - stale claims（標日期）
#    若加新內容、確認沒破壞既有對齊

# 7. methodology_and_corrections.md append 一條（per Schema-content propagation）：
echo "### 修正 #76：B 模式預判洞察補進 pitch
- 預判依據：ProposalOS/examples/predicted-to-pitch-update-demo.md
- 待 6/8 訪海瑞驗證、訪後若預判錯需 retract" >> docs/methodology_and_corrections.md

# 8. CLAUDE.md 修正數 74 → 76
# 9. exploration/INDEX.md 修正 75 → 76（line 13）
# 10. 8 個 propagation 檔同步（per CLAUDE.md schema-content propagation list）

# 11. git commit + push（pre-commit hook 會驗）
```

→ 預估工作量：1-2 hr 套用 + propagation。

---

## ⚠️ 若不真改、保留作為「假設庫」

不套用也合理 — 把本檔當「**訪海瑞前的假設清單**」、訪後對照：

- 預判對 → 強化（可正式進 pitch）
- 預判錯 → 標 anti-pattern、提煉 ProposalOS AI 預判盲點

---

## 跟 ProposalOS 框架的對應

| Demo | 對應 ProposalOS 段 |
|---|---|
| Demo 1 Pitch §架構 | 模組 08 架構 + 模組 02 競品（Win Themes 強化）|
| Demo 2 Pitch §AI 接受度 | 模組 03 問題目標 + 模組 11 效益（ROI 量化）|
| Demo 3 RTM 新增 | 強制檢查項 A RTM（雙向追溯）|
| Demo 4 反方審查 | 模組 12 風險反方 + playbook/red-team-questions.md |

→ ProposalOS 完整 dogfood 流程：預判 → 提煉 demo → 真實訪談驗證 → 套用真實版 → anti-pattern 累積。

---

## 給 ProposalOS 的 meta-lesson

如果這份 demo 被真實套用（6/8 訪後）、會驗證：

1. B 模式預判洞察能否轉成有用 pitch 修改？
2. 預判錯誤率多少？
3. 哪類洞察轉換率高（反向預判 vs ⭐ 高價值題）？

→ 累積 6-12 個月 = ProposalOS 第一個 **AI 預判 → pitch 修改的轉換率 dataset**。
