# C｜變更紀錄與決策紀錄

🔴 過程持續維護

## 為什麼必有

半年後最常見的爭執：
- 「當初為什麼這樣設計」
- 「這個我以為不在範圍內」
- 「這個是誰拍板的」

沒有紀錄 → 對方說了算 / 各說各話 / 最後送律師。

## 兩種紀錄

### 1. 決策紀錄（Architecture Decision Record / Project Decision Log）

每個重大決策必記。

| ID | 日期 | 決策標題 | 背景 | 選項 | 決策 | 理由 | 簽核 |
|---|---|---|---|---|---|---|---|
| D-01 | 2025-06-15 | 用 AWS 而非 Azure | 客戶 IT 偏好 AWS | AWS / Azure / GCP | AWS | 既有 IAM、成本、團隊熟悉 | 客方 IT 主管、我方 PM |
| D-02 | 2025-06-22 | 不做行動 App | 預算限制 | App / RWD | RWD | 預算減 80 萬、覆蓋 80% 場景 | 客方老闆、我方 PM |

### 必填欄位

- **背景**：為什麼要做這個決定（不是「因為要做」這種廢話）
- **選項**：考慮過哪些方案
- **決策**：最後選什麼
- **理由**：為什麼選這個（要可重現邏輯）
- **影響**：這個決策影響哪些後續工作
- **簽核**：雙方至少一人

### 2. 變更紀錄（Change Request Log）

範圍 / 時程 / 預算的變更必走 CR 流程。

| CR ID | 日期 | 變更內容 | 觸發原因 | 影響範圍 | 影響時程 | 影響成本 | 決定 | 雙方簽核 |
|---|---|---|---|---|---|---|---|---|
| CR-01 | 2025-08-10 | 增加 BI 報表模組 | 客戶老闆要求 | FR-15、FR-16 新增 | +3 週 | +30 萬 | 同意 | 雙方 PM |

### CR 流程

```
1. 客戶提出（或我方識別）
   ↓
2. 我方評估（範圍、時程、成本、技術影響）
   ↓
3. 提出 CR 單（含三種選項：同意 / 拒絕 / 部分接受）
   ↓
4. 客戶決定
   ↓
5. 雙方簽核
   ↓
6. RTM 更新
   ↓
7. 合約附錄
```

### CR 紅線

提案合約裡要寫：
- 超過 X% 範圍變更必須走 CR
- CR 評估費用是否計費
- CR 答覆 SLA（雙方各幾工作天）
- 拒絕 CR 的後果

## 工具

| 規模 | 工具 |
|---|---|
| 小案 | Google Sheet |
| 中案 | Notion 資料庫 / Confluence |
| 大案 | JIRA / Azure DevOps + 合約附錄 |

## 文化提醒

- ❌ 「這個我們口頭講過」→ 不算
- ❌ 「Slack 上有講」→ 找不到等於沒講
- ❌ 「PM 私下答應」→ 沒紀錄 PM 就揹責任
- ✅ 所有 key decision 都進 log，雙方簽

## 常見地雷

- ❌ 只記決策不記理由 → 半年後沒人記得為什麼
- ❌ 沒記放棄的選項 → 後續有人問「為什麼不用 X」答不出來
- ❌ CR 用 Email 串溝通沒做正式單 → 影響範圍模糊
- ❌ CR 沒寫拒絕後果 → 客戶不簽就一直拖

## 與其他模組的關係

- ← 模組 12：風險、責任邊界
- ← 強制檢查項 B：溝通計畫定 escalation path

## 反方審查問題

- 你的決策紀錄誰看得到？簽核如何留痕？
- CR 流程合約寫了嗎？答覆 SLA 多久？
- 沒走 CR 就做的工作，誰付錢？
- 半年後爭執時，這些紀錄拿得出來嗎？

---

## 決議紀錄標準格式（per Amafans EAQS 2026-05-29 retro）

避免 [AP-NEW-ANTI-HALLUC-1 temporal attribution drift](../anti-patterns.md) + [AP-NEW-ANTI-HALLUC-2 ghost attribution](../anti-patterns.md)、每個重大內部決議**必含 4 元素 + 1 影響範圍 list**：

### 4 元素

| 元素 | 內容 | 範例 |
|---|---|---|
| **日期** | YYYY-MM-DD（today 真決議的日期、不是 confirm 沿用既有的日期）| 2026-05-29 |
| **決策人** | 具體個人或角色（不是「內部共識」這類 ghost 模糊）| GoodLinker Ethan (GM) |
| **決議內容** | 1-2 句、可驗 / 可重現 | EAQS 控制邏輯只保留全開 / 全關、移除「智能控制」mode |
| **理由** | 為何這樣決（避免半年後忘）| Demo 5/13 列「智能控制」是 Phase 2 想法、Phase 1 範圍精簡優先 |

### 影響範圍 list（cross-doc sweep checklist）

決議產生時必列要 update 的 file（避免「一個決議跨 5-10 file 漏更」、配套 wiki-lint / decision-propagation skill 跑 sweep）：

```
範例 — 「智能控制移除」決議影響範圍（per Amafans EAQS）：
- pending-items-tracker.md A.2 / P1-1 / 跨檔差異 row
- rfp-audit.md A1 row
- rfp-v07-draft-additions.md Phase 0 task + R-04 risk
- system-design/data-schema.md ModeProfile
- system-design/data-fields.md ENUM + condition_json
- ai-handoff/spec.md out-of-scope row
```

### Trade-off table 範例（per Amafans EAQS CR-002.a 電表 scope）

重大決議必含「方案 trade-off table」、避免單選默認、強制 evaluate alternatives：

| 方案 | 內容 | 優點 | 缺點 | 適用 |
|---|---|---|---|---|
| A | 只接電扇分路電表 | BOM 最小、100% 歸因 Amafans | 無法對標台電帳單 | 客戶無總電表 / 最小 BOM 場域 |
| B | 客戶整廠總電表 | 對標台電帳單、完整 EMS | 風扇 vs 其他設備混在一起 | 客戶有總電表、看整廠 |
| C | 總 + 分路（推薦）| 既歸因 Amafans、又對台電帳單、雙視圖 | BOM 較多、onboarding 步驟多 | 多數客戶情境 |

→ trade-off table **必含 3 列以上**、避免單選默認

### 反 anti-pattern checklist

寫決議紀錄前自問：
1. ⚠️ **日期戳對嗎？** today 真決議？還是 confirm 沿用既有？（避免 AP-NEW-ANTI-HALLUC-1）
2. ⚠️ **attribution 有 cite 嗎？** 「per X 決策」必含 source / 日期 / 決策人（避免 AP-NEW-ANTI-HALLUC-2）
3. ⚠️ **影響範圍列了嗎？** 不列 = 跨檔 propagation 必漏
4. ⚠️ **trade-off table 有嗎？** 沒有 = 單選默認、無 evaluate alternatives 痕跡

### git archaeology preflight

寫 phrasing 引用既有 claim 前先驗起源：
```bash
git log -p -- <file>          # 看 file 全 commit 史
git log --all -p -- <path>    # 所有 branch 找
git log --oneline --grep="<keyword>"   # 按 keyword 找 commit
```

找不到 git source → 標 ⚠️ unverified、不要寫「per X 決策」攬功。
