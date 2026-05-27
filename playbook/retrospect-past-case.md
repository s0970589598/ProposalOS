# 過去案件 Retrospective Guide

⚠️ **比寫新虛構案例更值錢**：對過去做過的真實案件用 ProposalOS v1.2 框架反向 review、找出當初的盲點、累積進 [anti-patterns 庫](../framework/anti-patterns.md)。

## 為什麼

| 寫虛構案例 | Retrospect 真實案件 |
|---|---|
| 從 0 編、用力 4 小時 | 從既有資料 review、用力 2 小時 |
| 內容是「我們以為好的」 | 內容是「真實發生過」 |
| 教學示意 | 真實教訓 |
| 對外可分享 | 通常內部用（含敏感） |
| 不會累積反向學習 | 直接累積 anti-patterns + good patterns |

## 適合 retrospect 的案件

- 半年內結束的（記憶新鮮）
- 跑完整流程的（贏 / 輸 / 中途暫停皆可）
- 有完整文件留存的
- 雙方願意分享學習的

⚠️ 一開始挑 1-2 個就好、不要一次 retrospect 10 個（會累 + 品質差）。

## Retrospect 流程

### Step 1：蒐集材料（30 分鐘）

蒐集當時的：
- 提案書（如有）
- 訪談紀錄
- 報價單
- 合約
- 重要 Email 往來
- 變更紀錄（如有 CR 流程）
- 上線後 30/60/90 天回饋（如有）
- 客戶事後回饋 / 問卷
- 內部當時的判斷紀錄

### Step 2：依 12 模組 + 8 強制檢查項對照（60 分鐘）

開一份 markdown、用以下 template：

```markdown
# Case [代號] Retrospective

## 基本資料（去敏感）
- 產業：
- 規模：
- 時程：YYYY-MM ~ YYYY-MM
- 結果：贏 / 輸 / 中途暫停 / 上線完成
- 金額（區間）：
- Reviewer：
- Review 日期：

## 12 模組對照

### 01 產業市場
- 當時做到什麼程度：（無 / 表面 / 完整）
- 缺什麼：
- 學到：

### 02 競品替代
（同上格式）

### 03 問題目標
### 04 流程藍圖
### 05 角色 RACI
### 06 資料治理
### 07 合規資安
### 08 架構 NFR
### 09 方案分階段
### 10 商務報價
### 11 驗收維運
### 12 風險反方

## 8 強制檢查項對照
（同樣格式）

## 走得好的（成功 pattern）
- Good Pattern 1：
- Good Pattern 2：

## 走不好的（anti-pattern 新增）

對應 [anti-patterns.md](../framework/anti-patterns.md) 格式：

### AP-XX：[簡短標題]
- 產業：
- 階段：
- 發生：
- 後果：
- 根因：
- 教訓：
- 對應模組：

## 對 ProposalOS 框架的改進建議

- 應該加：
- 應該改：
- 應該刪：

## 客戶端視角學到

把這次客戶問過的「沒料到的問題」整理出來、給 [client-perspective.md](../framework/client-perspective.md) 補強。

## 結論

這次案件給 ProposalOS 帶來的最重要學習（1-3 點）：

1.
2.
3.
```

### Step 3：抽 anti-patterns（30 分鐘）

從上面 retrospective 抽 1-3 個 anti-pattern、按 [anti-patterns.md](../framework/anti-patterns.md) 格式加進去。

### Step 4：抽 good patterns（15 分鐘）

成功經驗也要紀錄、別只看失敗。記下：
- 哪些動作真的有用
- 哪些 win theme 客戶買單
- 哪些對話讓客戶 say yes

### Step 5：更新框架（30 分鐘）

把學習轉成框架的改進：
- 模組改寫
- Anti-pattern 加入
- 新的 case study（去敏感版可加入 examples/）

## Retrospect 時常見「以前覺得對、現在覺得錯」的 pattern

| 當時的想法 | 現在的學習 |
|---|---|
| 「客戶說要 X、我們做 X」 | 沒挖真痛點、做了客戶用不到的 |
| 「我們架構很厲害」 | 客戶 IT 看不懂、評分時被扣 |
| 「報價只報一個數字最簡單」 | 客戶無法選配、覺得貴 |
| 「7×24 支援是行銷話術」 | 客戶法務真的要看 SLA 細節 |
| 「DPA 簽約時再補」 | 客戶法務一卡 4 週 |
| 「同產業 reference 1 個夠了」 | 客戶要 ≥ 3 個才放心 |
| 「上線後就交給客戶」 | 沒做變革管理、3 個月後沒人用 |

## 把 retrospect 存哪

| 規模 | 放哪 |
|---|---|
| 高度敏感（客戶可識別） | `proposals/[client]/retrospective.md`（已 git-ignore）|
| 中度敏感（產業 + 規模可看出）| 個人筆記 / 內部 Notion |
| 完全去敏感（學習 pattern 為主） | `examples/[anon]-retrospective.md`、可上 ProposalOS repo |

⚠️ 上 git 前**雙重檢查**沒有客戶名、金額具體值、可識別資訊。

## Retrospect 節奏建議

| 頻率 | 動作 |
|---|---|
| 每案結束（贏 / 輸）| 個人 retrospect、30 分鐘版本 |
| 每月 | 整合月內案件、找跨案 pattern |
| 每季 | 團隊聚集、分享 retrospect、更新框架 |
| 每年 | 大型 review、決定 ProposalOS 下一版方向 |

## 範例

```markdown
# Case A1 Retrospective（虛構代號）

## 基本
- 產業：食品冷鏈
- 規模：300-500 萬
- 結果：贏、上線完成
- Reviewer：Allen
- Review 日期：2026-05-27

## 12 模組對照（節錄）

### 01 產業市場
- 當時：表面（沒做 PESTEL）
- 缺：法規驅動因子（食安法 2024 修正）沒寫進去
- 學到：產業章節要明標「為什麼是現在」

### 03 問題目標
- 當時：完整
- 學到：產銷人發財訪談覆蓋的「發（研發）」沒問到、後來客戶反映配方追溯也想要

## 走得好的
- 王副總當 Champion、預算討論順
- 報價拆 5 項、客戶選配 Bronze SLA 省 30 萬

## 走不好的 → AP-25
- AP-25：上線後 IT 主管接手知識轉移不夠
  - 根因：太晚跟 IT 對齊、簽約後才見面
  - 教訓：階段 4 訪談必含 IT 主管 1 次

## 對框架的改進建議
- 模組 05 RACI 強化「IT 主管在訪談階段必訪」
- Anti-patterns 加入 AP-25
```

---

## 與其他文件的關係

- [anti-patterns.md](../framework/anti-patterns.md)：累積去敏感版 anti-patterns
- [client-perspective.md](../framework/client-perspective.md)：把客戶角度學習補回去
- [scoring-rubric.md](../framework/scoring-rubric.md)：用 rubric 給當時的提案打分、找差距
- [skill-building.md](skill-building.md)：個人能力建構復盤
