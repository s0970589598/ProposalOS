# 提案流程 Playbook

從接到線索到簽約 / 上線，整個流程的步驟與工具。

## 4 大段 ＋ 18 小階段

每個階段都屬於 4 大段之一：

| 段 | 大階段 | 對應小階段 | 重點 |
|---|---|---|---|
| **準備期** | 蒐集資訊、定位 | 0-7 | 不要急著寫提案；前期沒做好後面全歪 |
| **提案期** | 寫 + 說明 + 反方審查 | 8-10 | 提案不是文件，是「跟客戶共同建構的共識」|
| **商務期** | 法務、議價、簽約 | 11-13 | 折扣必須交換條件、不要白給 |
| **交付期** | 上線、驗收、維運 | 14-18 | 交付期決定下次 reference |

## 全流程總覽

```
線索進來
   ↓
階段 0：判斷接不接（30 分鐘）
   ↓
階段 1：產業與市場（1-2 天）
   ↓
階段 2：競品 / 替代方案（1-2 天）            ← 前移！
   ↓
階段 3：第一次客戶會議（2 hr）
   ↓
階段 4：訪談 + 流程盤點（1-2 週）
   ↓
階段 5：資料盤點 + 整合評估（1 週）
   ↓
階段 6：合規檢查 + 風險識別（3 天）
   ↓
階段 7：架構 + 方案 + 報價（1-2 週）
   ↓
階段 8：提案書產出（3-5 天）
   ↓
階段 9：內部反方審查（1 天）
   ↓
階段 10：提案說明會（2 hr）
   ↓
階段 11：客戶內部評估 + 修正（1-4 週）
   ↓
階段 12：法務 / 商務談判（1-4 週）
   ↓
階段 13：簽約
   ↓
階段 14：Kickoff
   ↓
階段 15：分階段交付（按方案）
   ↓
階段 16：驗收
   ↓
階段 17：上線
   ↓
階段 18：上線後 30/60/90 天回顧
```

## ═══ 準備期（階段 0-7）═══

> 占整個提案時間 **60-70%**。
> 前期投入別省 — 訪談沒做好、後面寫得再美都歪。

## 階段 0：判斷接不接

不是每個線索都接。先過濾：

| 項目 | 標準 |
|---|---|
| 預算 | 是否在我們服務範圍 |
| 產業 | 我們有經驗 / 願意學 |
| 客戶誠意 | 是否真要做（vs 探勘） |
| 時程 | 是否現實 |
| 內部資源 | 我們是否有人能做 |
| 風險 | 是否可承受 |

**Go / No Go Checklist**：
- [ ] 預算在 [下限, 上限] 之間
- [ ] 產業屬於我們主力 / 戰略產業
- [ ] 客戶提出明確時程 / 目標
- [ ] 客戶內部有指定窗口
- [ ] 我們有可用團隊
- [ ] 沒有重大法律 / 道德風險

3 個以上不符 → No Go 或要主管裁定。

## 階段 1-2：產業 + 競品（提案前置功課）

**這是 ProposalOS 的關鍵差異**：競品前移到訪談前。

對應：
- [framework/12-modules/01-industry-market.md](../framework/12-modules/01-industry-market.md)
- [framework/12-modules/02-competitors-alternatives.md](../framework/12-modules/02-competitors-alternatives.md)

輸出：
- 產業簡報（內部用、3-5 頁）
- 競品定位圖（內部用）
- 競品功能對照表

## 階段 3：第一次客戶會議

帶著前置功課去，不要當張白紙去。

議程建議：

```
1. 寒暄、雙方介紹                          10 min
2. 客戶背景、組織、產品（讓客戶說）         20 min
3. 客戶痛點、為什麼現在做                   30 min
4. 客戶評估過的選項（用我們的競品功課對照） 20 min
5. 我們的初步想法（不出具體報價）           20 min
6. 接下來怎麼合作                          15 min
7. Q&A                                     15 min
```

帶東西：

- 公司介紹（5 頁內）
- 相關案例（3 個內）
- 不要帶報價單 ⚠️

## 階段 4：訪談 + 流程盤點

對應：
- [interview-script.md](interview-script.md)
- [framework/12-modules/03-problem-business-goals.md](../framework/12-modules/03-problem-business-goals.md)
- [framework/12-modules/04-as-is-to-be-service-blueprint.md](../framework/12-modules/04-as-is-to-be-service-blueprint.md)
- [framework/12-modules/05-stakeholders-raci.md](../framework/12-modules/05-stakeholders-raci.md)

訪談對象：

- 提案發起人
- 部門主管
- 第一線使用者（至少 2-3 個）
- IT 主管
- 採購（看狀況）

訪談紀錄：每場 24 小時內寫完，雙方確認。

## 階段 5：資料盤點

對應：[framework/12-modules/06-data-integration-governance.md](../framework/12-modules/06-data-integration-governance.md)

要拿到的：

- 既有系統 API 文件
- 資料量級、頻率
- 樣本資料（去敏感）
- 主資料對應（不同系統 ID）

## 階段 6：合規 + 風險識別

對應：
- [framework/12-modules/07-compliance-security-ai-risk.md](../framework/12-modules/07-compliance-security-ai-risk.md)
- [framework/12-modules/12-risk-assumptions-red-team.md](../framework/12-modules/12-risk-assumptions-red-team.md)

跟客戶法務 / 資安溝通：

- 是否要 DPA / BAA
- 資料是否跨境
- 認證要求
- 內部資安政策

## 階段 7：架構 + 方案 + 報價

對應：
- [framework/12-modules/08-architecture-functional-nfr.md](../framework/12-modules/08-architecture-functional-nfr.md)
- [framework/12-modules/09-solution-options-phased-rollout.md](../framework/12-modules/09-solution-options-phased-rollout.md)
- [framework/12-modules/10-procurement-pricing.md](../framework/12-modules/10-procurement-pricing.md)

不要只給一個方案。給 3 個。

## ═══ 提案期（階段 8-10）═══

> 占整個提案時間 **15-20%**。
> 提案不是「文件交付」、是「跟客戶共同建構的共識」。

## 階段 8：提案書產出

對應：[templates/](../templates/)（依案件規模選 short / standard / enterprise）

過 [framework/8-mandatory-checks/](../framework/8-mandatory-checks/) 每項：

- [ ] RTM
- [ ] 溝通計畫
- [ ] 決策紀錄機制
- [ ] Secure SDLC
- [ ] SBOM
- [ ] RTO/RPO
- [ ] 退出機制
- [ ] 證據包

## 階段 9：內部反方審查

對應：[red-team-questions.md](red-team-questions.md)

找團隊內 1-2 個沒參與這案的人，用反方角度打。

## 階段 10：提案說明會

不要把提案書直接發給客戶 → 客戶會自己看自己詮釋。
**一定要面對面說明**：

```
1. 為什麼是現在做（產業背景）          10 min
2. 你說的痛點，我們聽到了（重述）       15 min
3. 我們的解法                          20 min
4. 三方案比較 + 推薦                   15 min
5. 投資與時程                          10 min
6. 風險與責任邊界                       10 min
7. Q&A                                 30 min
8. 下一步                              10 min
```

## ═══ 商務期（階段 11-13）═══

> 占整個提案時間 **10-15%**。
> 折扣必須交換條件、不要白給。法務問題 24-48hr 必回。

## 階段 11-12：客戶評估 + 商務

| 動作 | 何時 |
|---|---|
| Reference call | 客戶要求時 24 hr 內安排 |
| 法務問題 | 24-48 hr 內回 |
| 商務談判 | 主管出馬、不要 PM 自己扛 |
| 折扣需要 | 必須交換條件，不要白白讓 |

## ═══ 交付期（階段 13-18）═══

> 占整個專案時間 **依方案 3-12 個月**。
> 交付期決定下次客戶會不會當 reference。

## 階段 13-16：簽約 → 上線

對應：[framework/12-modules/11-acceptance-benefits-operations.md](../framework/12-modules/11-acceptance-benefits-operations.md)

## 階段 18：上線後回顧

不是案子的結束，是下一個案子的起點。

- 30 天回顧：早期問題、訓練成效
- 60 天回顧：使用率、流程順暢度
- 90 天回顧：效益達成、KPI 對照
- 寫成 case study → 證據包

## 整體時間軸（中型案）

| 階段 | 時間 |
|---|---|
| 0-3 | 1 週 |
| 4-5 | 2 週 |
| 6-7 | 2 週 |
| 8-9 | 1 週 |
| 10-12 | 4-8 週 |
| 13-16 | 3-6 個月 |
| 17-18 | 上線後追蹤 3 個月 |

**前期投入別省**：階段 1-9 沒做好，後面什麼都歪。
