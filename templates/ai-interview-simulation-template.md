# AI 訪談模擬 範本

⚠️ 用前必看 [playbook/ai-simulated-interview.md](../playbook/ai-simulated-interview.md) 3 模式紅線。

依「模式」選範本下方對應段：

- **模式 B**（AI 預判 + 真實訪談）→ 用「§B 模式 template」
- **模式 C1**（純內部準備）→ 用「§C1 模式 template」
- **模式 C2**（提案 placeholder）→ 用「§C2 模式 template」+ 4 紅線

---

## §B 模式 template（推薦）

```markdown
# [客戶名] 訪談 — AI 預判版（B 模式）

⚠️ 這份是 AI 預判、不是真實訪談。
⚠️ 絕不可把以下內容當引言寫進提案。
⚠️ 用途：訪前準備、訪後比對。

## 預判基於

- 客戶已知公開資料：[列具體事實，如「8.4 年運作」、「27 規則」]
- 內部 baseline 資料：[列 GoodLinker 端可驗事實]
- 產業典型 pattern：[食品業 / 製造業 / SaaS / ...]
- ⚠️ AI 訓練資料截至 YYYY、不含客戶 internal 資訊

## 預判時間 / 預計訪談時間

- 預判：YYYY-MM-DD
- 預計訪談：YYYY-MM-DD
- Reviewer：[姓名]

## 預判表（每題 3 欄、訪後填後 2 欄）

### Q：[訪談問題]

| 預判（confidence: H/M/L） | 實際（訪後填） | 差異 / 學習（訪後填） |
|---|---|---|
| **H**：[典型 pattern 回答] | _訪後填_ | _訪後填_ |
| **M**：[常見變體] | | |
| **L**：[低信度可能] | | |

**追問預判**：[客戶可能跳過 / 迴避 / 模糊回答的點、設計追問]

**反向預判**：[客戶可能不會 / 不能回答的點、不要逼]

### Q：[下一問題]
（同上格式）

## 預判信度評估

| 主題 | 高信度預判佔比 | 高價值不可預判 |
|---|---|---|
| 主題 1 | ~X% | [真實訪談才能拿到的金句類型] |

## ⭐ 高價值題標記

[列哪幾題最可能挖到金句、訪談時優先留時間]

## 訪後動作（B 模式必跑）

訪談後 24 hr 內：

1. 填「實際」欄
2. 填「差異 / 學習」欄
3. 找 AI 預判錯的點 → anti-pattern 候選
4. 加進 framework/anti-patterns.md

## 訪後比對結果（訪後填）

### 差異分類

| 差異類型 | 案件中發現的 | 對應 anti-pattern |
|---|---|---|
| AI 預判 H 但實際完全不同 | [列] | AP-NEW-XX |
| AI 沒預判到、實際很重要 | [列] | AP-NEW-YY |
| AI 預判到、實際也對 | [列、證實 AI 在這類有信度] | — |

### 對 ProposalOS 的 meta-learning

[累積成 AI 預判 vs 實際的 pattern 庫]
```

---

## §C1 模式 template（純內部）

```markdown
# [情境] AI 模擬 — 內部 Brainstorm（C1 模式）

⚠️ 純內部用、不可進提案。

## 模擬情境

- 角色：[假設訪談對象 / 反方審查角色]
- 場景：[訪談 / 反方審查 / 業務員 deal-loss / etc]
- 目的：[找盲點 / 設計問題 / 訓練訪談者]

## 模擬內容

（AI 推論的可能回答 / 問題 / 反應）

## 用途記錄

- [ ] 用於訓練訪談者
- [ ] 用於設計反方審查題庫
- [ ] 用於內部 dry-run
- [ ] 其他：

## 紅線確認

- [ ] 確認此檔不會被誤當真實訪談紀錄
- [ ] 確認此檔不會 commit 到含提案 deliverables 的目錄
- [ ] 確認文件名 / 標題含「模擬」/「AI 推論」等明顯標記
```

---

## §C2 模式 template（提案 placeholder、有紅線）

⚠️ 預設**不要用**。要用必過 4 紅線：

### 紅線 checklist

- [ ] 紅線 1：每段 C2 內容都有警示標頭
- [ ] 紅線 2：每段 C2 都有替換計畫（deadline + 負責人 + 動作）
- [ ] 紅線 3：絕不用具體 quote 風格 / 不寫像真實 quote 的句子
- [ ] 紅線 4：絕不放在「客戶引言」段標題下、改放「Pending Customer Validation」

### Template

```markdown
### Pending Customer Validation — [客戶名]

> ⚠️ **以下為 AI 推論、待真實訪談驗證**
>
> 推論依據：
> - [公開資料 1]
> - [產業典型 pattern]
>
> 推論日期：YYYY-MM-DD
> 推論者：[AI model + reviewer]

#### 預期訪談會發掘的主題

（**用清單描述**、不用 quote 形式）

1. [主題 1：典型回答方向]
2. [主題 2：可能挖到的角度]
3. [主題 3：客戶獨特觀點待驗]

#### 替換計畫

| 動作 | 負責人 | Deadline | 狀態 |
|---|---|---|---|
| 約訪談 | | | |
| 訪談 | | | |
| 整理 + 雙方確認 | | | |
| 取代本段 placeholder | | | |

#### 追蹤

- 建立日期：YYYY-MM-DD
- 上次更新：YYYY-MM-DD
- ⚠️ 14 天內未替換 → 升級警示、回到 ProposalOS retrospect 寫成 anti-pattern
```

---

## 範例

### B 模式範例
[`examples/goodlinker-gcp-pitch-retrospective.md`](../examples/goodlinker-gcp-pitch-retrospective.md) → demo 在 `goodlinker-gcp-pitch/exploration/2026-05-27_haiui_interview_PREDICTED.md`

### C1 模式範例
適合做：訪談者訓練、反方審查 brainstorm。

### C2 模式範例
範例不在 repo 內（敏感）、用上述 template。

## 跟 ProposalOS Anti-Patterns 的關係

C2 模式錯誤使用 → 自動成為 anti-pattern：

- AP-NEW-AI-1：「AI 模擬內容沒標 unverified、誤當真實 quote」
- AP-NEW-AI-2：「C2 placeholder 永久未替換」
- AP-NEW-AI-3：「AI 模擬內容混在客戶引言段」
- AP-NEW-AI-4：「沒紀錄 C2 使用、無從追蹤」

→ 詳見 [framework/anti-patterns.md](../framework/anti-patterns.md)。
