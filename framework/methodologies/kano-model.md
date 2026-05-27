# Kano Model

Noriaki Kano（東京理科大學）1984 提出。
**比 P0 / P1 / P2 更精準的需求分類法**。

把功能對應到「滿足度 vs 投入量」的關係曲線。

## 五類需求

```
        滿足度
          ↑
          │            Delight（驚喜）
          │           ╱
          │         ╱
          │       ╱        Performance（期望）
   ───────┼─────╳─────────────→ 投入度
          │   ╱       Must-have（必備）— 平的線（有 → 不抱怨；無 → 大怒）
          │ ╱
        ╳
       Reverse（反效果）— 越多越糟
```

## 五類定義

| 類別 | 沒有時 | 有時 | 範例 |
|---|---|---|---|
| **Must-have（必備）** | 大怒 | 沒感覺 | 系統能登入、加密、備份 |
| **Performance（期望）** | 不滿 | 滿意 | 反應速度、可用率、功能完整度 |
| **Delight（驚喜）** | 沒感覺 | 大愛 | AI 自動推薦、預測告警 |
| **Indifferent（無差）** | 沒感覺 | 沒感覺 | 後台 icon 顏色、特殊登入動畫 |
| **Reverse（反效果）** | 滿意 | 不滿 | 過多通知、太多選項、過度動畫 |

## 跟 P0 / P1 / P2 的差別

| | P0/P1/P2 | Kano |
|---|---|---|
| 維度 | 一維（重要性） | 二維（必要性 × 滿足度）|
| 區分 | 只有「重要 vs 不重要」 | 區分「沒有會生氣」vs「有了會驚喜」 |
| 報價暗示 | P0 全包、P1 可選 | Must 全包、Delight 拆出來加價 |
| 策略價值 | 低 | 高（差異化）|

## 怎麼分類功能

對每個需求問兩個問題：

```
正面問題：「如果有這功能你會怎麼想？」
負面問題：「如果沒這功能你會怎麼想？」
```

答案 5 選 1：

1. 我會很喜歡（Like）
2. 我預期應該有（Must-be）
3. 沒差（Neutral）
4. 我可以容忍（Live with）
5. 我不喜歡（Dislike）

對照表：

| 正面回答 \ 負面回答 | Like | Must-be | Neutral | Live with | Dislike |
|---|---|---|---|---|---|
| Like | Q（問題）| A 驚喜 | A 驚喜 | A 驚喜 | O 期望 |
| Must-be | R 反效果 | I 無差 | I 無差 | I 無差 | M 必備 |
| Neutral | R | I | I | I | M |
| Live with | R | I | I | I | M |
| Dislike | R | R | R | R | Q |

註：Q = Questionable（答案矛盾、再問一次）

## 套用 ProposalOS

### RTM 加 Kano 欄

| 痛點 ID | 功能 | P0/P1/P2 | Kano | 報價策略 |
|---|---|---|---|---|
| P-01 | 溫度告警 | P0 | Must-have | 內含、不能砍 |
| P-04 | 履歷反查 | P0 | Performance | 越快越好、可分等級 |
| P-06 | 司機 App | P1 | Delight | 拆出來、加價 |
| — | 後台動畫 | — | Indifferent | 不做 |
| — | 滿屏通知 | — | Reverse | 不做（會傷害 UX）|

### 訪談時用 Kano 問

不要直接問「你想要什麼」（答案會是長串清單）。
用 Kano 兩問法：

> 「如果我們系統可以做到自動產月報、你會怎麼想？」
> 「如果做不到呢？」

→ 客戶回答可以歸類到 5 類。

→ 比直接問「你要不要月報自動」深 10 倍。

### 報價策略對應

| Kano 類別 | 報價策略 |
|---|---|
| Must-have | 全部內含、不可砍 |
| Performance | 分 Bronze/Silver/Gold 三等級報、越多越貴 |
| Delight | 拆成 add-on、加價購、第二階段升級 |
| Indifferent | 不做、省成本 |
| Reverse | 不做、寫進 to-be 但標「刻意不做」 |

→ 對應到我們的三方案（基礎 / 標準 / 完整）：

```
基礎版    = 全部 Must-have
標準版    = Must-have + 主要 Performance
完整版    = Must-have + 全 Performance + 1-2 個 Delight
```

## Kano 隨時間變化

**Delight 會慢慢變成 Performance、再變 Must-have**。

| 功能 | 5 年前 | 現在 | 5 年後 |
|---|---|---|---|
| 手機推播 | Delight | Must-have | Must-have |
| AI 預測告警 | — | Delight | Performance |
| LINE 通知 | Delight | Must-have | Must-have |
| 雲端備份 | Performance | Must-have | Must-have |

→ 客戶的「Delight」會越來越多、廠商必須**持續創新**。

## 跨產業 Kano 範例

### 製造業 IoT

| 功能 | Kano |
|---|---|
| 即時溫度顯示 | Must |
| 異常告警 | Must |
| 歷史趨勢圖 | Performance |
| AI 預知保養 | Delight |
| 紙本月報 | Reverse（沒人要） |

### 醫療系統

| 功能 | Kano |
|---|---|
| 病歷查詢 | Must |
| 跨院互通 | Performance |
| AI 診斷輔助 | Delight |
| 過多警示 | Reverse（alarm fatigue） |

### 政府服務

| 功能 | Kano |
|---|---|
| 線上申辦 | Must |
| 行動裝置可用 | Performance |
| 智慧客服 | Delight |
| 多重認證 | Performance（過多 = Reverse） |

## 常見錯誤

- ❌ 全部標 Must（=> 報價爆炸、客戶看到價格嚇跑）
- ❌ Delight 也內含（=> 沒留 upsell 空間）
- ❌ Reverse 沒識別（=> 做了傷害 UX、客戶不滿）
- ❌ 假設客戶想要的 = 我們以為好的（=> 沒用 Kano 兩問法驗證）

## 推薦讀物

- Kano 原始 paper（1984，日文）
- HBR《Kano Model for Customer Satisfaction》
- Folkestad 等《QFD - The Kano Method》
