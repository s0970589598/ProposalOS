# Anti-Patterns 庫

提案中**不能做**的事、過去做錯的具體案例、累積式紀錄。

> ⚠️ 本檔內容為**示意 anti-pattern**（基於業界共識 + 推斷的失敗模式），**非真實案件記錄**。
> 真實 anti-pattern 應從**真實案件後復盤** 收集累積（每案一筆、註明日期、產業、教訓）。
> 本檔提供框架、實際 entries 需 GoodLinker / 使用者依真實案件填入。

## 為什麼需要 Anti-Patterns 庫

| Good Pattern 紀錄 | Anti-Pattern 紀錄 |
|---|---|
| 「該怎麼做」 | 「過去做錯的具體案例」 |
| 抽象、難內化 | 具體、刻骨銘心 |
| 容易忘 | 學一次記一輩子 |
| 大家都看書知道 | 別人沒踩過的雷 = 我們的競爭力 |

→ GoodLinker `~/.claude/CLAUDE.md` 累積 58 修正記錄、就是這類資產。
→ ProposalOS 需要自己的 anti-pattern 累積。

## Anti-Pattern 紀錄格式

```markdown
## AP-NN：[簡短標題]

- **日期**：YYYY-MM-DD
- **產業**：製造 / 醫療 / 金融 / 政府 / 其他
- **案件規模**：< 50 萬 / 50-500 萬 / 500 萬+
- **階段**：訪談 / 提案 / 商務 / 交付 / 維運
- **發生**：具體發生什麼（去敏感、不寫公司名）
- **後果**：直接損失 / 信任損失 / 案件失敗 / 客訴
- **根因**：為什麼會發生
- **教訓**：以後遇到類似情境要怎麼做
- **對應模組**：本框架哪幾個模組沒做好（連結）
```

## 七類 Anti-Patterns（業界共識常見失敗模式）

### 類別 1：訪談 / 需求挖掘

#### AP-01：把客戶嘴上的解法當需求

- **典型**：客戶說「我要 dashboard」→ 我們做 dashboard → 上線後客戶說「不是這個 dashboard」
- **根因**：沒用 5 次「為什麼」、沒用 JTBD 找真需求
- **教訓**：[模組 03](12-modules/03-problem-business-goals.md) + [JTBD](methodologies/jtbd.md)

#### AP-02：只訪一個窗口

- **典型**：只跟 PM 訪、上線後第一線員工抗拒
- **根因**：沒覆蓋 [產銷人發財](12-modules/03-problem-business-goals.md) + 沒做 [stakeholder mapping](12-modules/05-stakeholders-raci.md)
- **教訓**：訪談必含 ≥ 3 種角色（高層 / 主管 / 第一線）

#### AP-03：訪談後沒紀錄就動工

- **典型**：客戶說的話沒寫下、3 個月後爭執「我們有講過要 X」
- **根因**：沒做 [interview-script.md](../playbook/interview-script.md) 紀錄與雙方確認
- **教訓**：訪談 24h 內紀錄、雙方 sign-off

### 類別 2：競品 / 戰略

#### AP-04：把競品分析放提案末尾當銷售比較

- **典型**：「我們 vs A vs B」放在最後、客戶已決定不買、看了沒影響
- **根因**：違反 [V10 競品前移修正](../archive/version-history/v10-competitor-frontload.md)
- **教訓**：競品 → 需求探索階段、不是最後

#### AP-05：以為客戶沒有替代方案

- **典型**：客戶有「維持現狀」或「自己做」的選項、我們完全不處理
- **根因**：[模組 02](12-modules/02-competitors-alternatives.md) 三類選項沒寫到「替代方案」
- **教訓**：替代方案必入競品矩陣

### 類別 3：架構 / 方案

#### AP-06：架構圖只一張、塞 4 層

- **典型**：客戶 IT 看不懂、跟主管看的是同一張圖
- **根因**：違反 [TOGAF 4 層](methodologies/c4-model.md) + [C4 Model](methodologies/c4-model.md) 分層原則
- **教訓**：給高層看 Context、給 IT 看 Container、不混

#### AP-07：NFR 全部不寫 / 全部寫超嚴

- **典型**：客戶問效能、答不出來；或承諾 99.99% 結果做不到
- **根因**：[模組 08 NFR](12-modules/08-architecture-functional-nfr.md) 段未認真量化
- **教訓**：NFR 數字必須有依據、能量測、能違約

#### AP-08：一律 Big Bang 上線

- **典型**：一次切換、失敗風險高、客戶不敢簽
- **根因**：[模組 09](12-modules/09-solution-options-phased-rollout.md) 沒給分階段選項
- **教訓**：分階段是預設、Big Bang 是例外

### 類別 4：商務 / 報價

#### AP-09：整套報一個價

- **典型**：報 500 萬、客戶覺得貴、無法挑配減項
- **根因**：[模組 10](12-modules/10-procurement-pricing.md) 沒拆項
- **教訓**：拆 5+ 項、可選 / 必選分明

#### AP-10：沒寫「不包含」

- **典型**：簽約後客戶說「我以為含這項」、無限追加
- **根因**：[模組 09](12-modules/09-solution-options-phased-rollout.md) + [模組 10](12-modules/10-procurement-pricing.md) 邊界不清
- **教訓**：「不含」清單寫出來、合約附錄

#### AP-11：給折扣不交換條件

- **典型**：客戶說「太貴」我方砍 10%、客戶下次再砍
- **根因**：[模組 10](12-modules/10-procurement-pricing.md) 商務策略沒抓
- **教訓**：折扣必須交換（合約期、付款、case 使用權、reference 同意）

#### AP-12：用量上限沒設

- **典型**：AI Token / API call 沒上限、客戶端 bug 跑迴圈、月帳單炸 10 倍
- **根因**：[模組 10 用量上限](12-modules/10-procurement-pricing.md) 段沒做
- **教訓**：所有按用量計費項都設 Hard Limit

### 類別 5：合規 / 資安

#### AP-13：「我們有資安」沒細節

- **典型**：客戶 IT 一問「你們怎麼開發」、答不出來
- **根因**：[強制檢查項 D Secure SDLC](8-mandatory-checks/D-secure-sdlc.md) 沒做
- **教訓**：每階段（Requirements → Maintenance）都要寫做什麼

#### AP-14：沒 SBOM、log4j 爆炸時不知道有沒有用

- **典型**：客戶問「你系統用了 log4j 嗎」、我方查 3 天才答得出來
- **根因**：[強制檢查項 E SBOM](8-mandatory-checks/E-sbom-license-supply-chain.md) 沒做
- **教訓**：SBOM 自動產出、漏洞訂閱

#### AP-15：AGPL 元件混進 SaaS

- **典型**：用了 AGPL 套件、整個 SaaS 可能要開源
- **根因**：[License 風險](8-mandatory-checks/E-sbom-license-supply-chain.md) 沒審
- **教訓**：新加套件必審 License

#### AP-16：AI 沒寫評估方式

- **典型**：客戶問「AI 多準」答不出來
- **根因**：[模組 07 AI 治理](12-modules/07-compliance-security-ai-risk.md) + [MLOps](methodologies/mlops-and-ai-governance.md) 沒寫
- **教訓**：每個 AI 功能都要 accuracy / hallucination / bias 指標

### 類別 6：交付 / 驗收 / 維運

#### AP-17：驗收標準寫「客戶滿意」

- **典型**：上線後客戶說「不夠好」、無客觀標準
- **根因**：[模組 11](12-modules/11-acceptance-benefits-operations.md) 驗收沒量化
- **教訓**：每個驗收項可測、可重現、有時限

#### AP-18：基線數字沒量

- **典型**：上線後算不出「省了多少」、ROI 變吵架
- **根因**：[模組 11 效益追蹤](12-modules/11-acceptance-benefits-operations.md) 沒做基線
- **教訓**：簽約前**必量基線**

#### AP-19：RTO 寫 5min 但實際 8hr

- **典型**：SLA 寫 5min RTO、實測失敗、違約金被扣
- **根因**：[強制檢查項 F](8-mandatory-checks/F-rto-rpo-rollback.md) 沒實測
- **教訓**：合約寫的 RTO 必須**已演練過**

#### AP-20：上線後沒人接

- **典型**：客戶端沒指定接手人、3 個月後沒人在用
- **根因**：[模組 11 變革管理](12-modules/11-acceptance-benefits-operations.md) + [強制檢查項 B 溝通計畫](8-mandatory-checks/B-communication-plan.md) 沒做
- **教訓**：簽約前確認客戶端接手人 + 訓練計畫

### 類別 7：法律 / 退場

#### AP-21：DPA 沒準備、客戶法務一卡 4 週

- **典型**：簽約最後階段法務要 DPA、我方臨時起草、品質差 + 延誤
- **根因**：沒事前準備
- **教訓**：DPA 中文版 + 英文版**事前定稿**

#### AP-22：退出機制不清

- **典型**：客戶法務問「不續約資料怎麼帶走」、答「再說」、客戶不簽
- **根因**：[強制檢查項 G](8-mandatory-checks/G-exit-plan.md) 沒做
- **教訓**：退出機制是**讓客戶敢簽**的關鍵、不是「希望客戶不要走」的擋箭牌

#### AP-23：智財權含糊

- **典型**：客製化開發歸誰沒寫清楚、官司
- **根因**：合約附錄 IP 條款沒寫
- **教訓**：平台核心歸我方、客戶資料歸客戶、客製化歸屬另議（合約寫死）

## 怎麼累積真實 anti-patterns

### 每案後復盤

每案上線 / 失敗 / 結束後寫一份：

```markdown
# Case [代號] Retrospective

## 案件基本（去敏感）
- 產業：
- 規模：
- 結果：贏 / 輸 / 中途暫停 / 上線

## 走得好的（保留進框架）

## 走不好的 → 新 anti-pattern
- AP-NN：[標題]
- 發生：
- 根因：
- 教訓：

## 對 ProposalOS 的改進建議
```

### 累積管道

| 來源 | 頻率 |
|---|---|
| 個人案件復盤 | 每案 |
| 同事案件分享 | 每月 |
| 客戶端訪談（失敗案）| 每季 |
| 同行交流 | 不定 |
| 書籍 / 業界文章 | 持續 |

## Anti-Pattern Index 索引（按模組）

| 模組 | Anti-Patterns |
|---|---|
| 訪談 | AP-01、AP-02、AP-03 |
| 競品 | AP-04、AP-05 |
| 架構 | AP-06、AP-07、AP-08 |
| 商務 | AP-09、AP-10、AP-11、AP-12 |
| 合規 | AP-13、AP-14、AP-15、AP-16 |
| 交付 | AP-17、AP-18、AP-19、AP-20 |
| 法律 | AP-21、AP-22、AP-23 |

## 紅線提醒

⚠️ Anti-pattern 紀錄**不准寫真實客戶名**、所有 case 去敏感（用代號）。
⚠️ 紀錄前確認**雙方都同意分享**（或完全去到無可識別程度）。
⚠️ 不要把 anti-pattern 當作「批判」、是「學習」。
