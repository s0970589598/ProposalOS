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

## 真實案例累積的 Anti-Patterns

從 [examples/goodlinker-gcp-pitch-retrospective.md](../examples/goodlinker-gcp-pitch-retrospective.md) 累積（真實 investor pitch、71 修正提煉）。

### AP-NEW-01：客戶引言段是 Placeholder（未訪談）
- **產業**：跨產業
- **階段**：提案
- **發生**：標竿客戶引言段全為 `> 「___（待訪談）___」`
- **後果**：客戶 / 評委會覺得 immature
- **教訓**：訪談是必修、提案送出前**至少 1 個真實引言**
- **對應模組**：[強制檢查項 H](8-mandatory-checks/H-evidence-pack.md)

### AP-NEW-02：對方端決策鏈不明（RACI 空白）
- **發生**：寫了我方 RACI、對方 RACI 0 個角色
- **教訓**：投資 / partnership pitch 也要做對方端 stakeholder mapping
- **對應模組**：[模組 05](12-modules/05-stakeholders-raci.md)

### AP-NEW-03：累積大量修正、多半發生早期版本
- **發生**：v1 → v2 → v3 累積 71 修正、大半早期就該驗
- **教訓**：**事前 7 問 sanity check > 事後修 71 次**

### AP-NEW-04：macOS sed 清空中文檔案
- **發生**：`sed -i '' 's/中文/中文/g' 含中文檔.md` → 整檔變 0 bytes
- **教訓**：禁用 sed 對中文檔案 in-place 替換、用 Edit / perl / uv python3

### AP-NEW-05：Retract 的檔沒清乾淨
- **發生**：被取代的檔還在、新人會用錯
- **教訓**：retract 檔移到 archive/、不留原位

### AP-NEW-06：deal-loss 對手寫不出（只靠 WebSearch）
- **發生**：競品段對「真實 deal-loss 對手」無法填
- **教訓**：競品分析**必訪業務員拉真實 deal-loss 紀錄**
- **對應模組**：[模組 02](12-modules/02-competitors-alternatives.md)

### AP-NEW-07：時序 hero stat 沒標日期（漂移）
- **發生**：「過去 30d X = 971」是 sliding window、同 30d 已變 733
- **教訓**：時序型 hero stat 必標「(截至 YYYY-MM-DD)」+ 註明 sliding window

## AI 模擬訪談相關 Anti-Patterns

源自 ProposalOS 對 AI 模擬訪談的 3 模式分層（[playbook/ai-simulated-interview.md](../playbook/ai-simulated-interview.md)）。

### AP-NEW-AI-1：AI 模擬內容沒標 unverified、誤當真實 quote
- **發生**：用 AI 模擬客戶會說什麼、寫進 pitch 客戶引言段、沒標示
- **後果**：客戶發現 = 信任崩潰、評委發現 = 直接出局
- **教訓**：AI 模擬內容必含「⚠️ AI 推論、待真實訪談」警示標頭、絕不放在「客戶引言」段

### AP-NEW-AI-2：C2 placeholder 永久未替換
- **發生**：deadline 緊用 AI 模擬當 placeholder、deadline 過後忘記替換
- **後果**：永遠的 fake quote 在 pitch 內、定時炸彈
- **教訓**：每段 C2 必有「替換計畫」（deadline + 負責人 + 動作 + 14 天追蹤）

### AP-NEW-AI-3：AI 模擬寫得像真實 quote
- **發生**：「我們當初是憑經驗設規則」這種 quote 風格句子 + AI 模擬標記
- **後果**：讀者只看 quote、忽略小字標記、視為事實
- **教訓**：C2 內容**改用清單形式描述主題、不用 quote 風格句子**

### AP-NEW-AI-4：沒紀錄 C2 使用、無從追蹤
- **發生**：用了 AI 模擬替代真實訪談、沒紀錄哪些段是 C2
- **後果**：後續無法 audit、無法替換、無法累積 anti-pattern
- **教訓**：所有 C2 使用必紀錄（建立日 / 來源 / 替換進度）

### AP-NEW-AI-5：B 模式預判沒做訪後比對
- **發生**：AI 預判完、真實訪談跑完、忘記比對「預判 vs 實際」
- **後果**：失去 B 模式最有價值的部分（AI 盲點累積）
- **教訓**：訪後 24 hr 內必填預判 template 的「實際 / 差異」欄、抽 anti-pattern 候選

## 提案撰寫階段相關 Anti-Patterns

源自 [examples/predicted-to-pitch-update-demo.md](../examples/predicted-to-pitch-update-demo.md) + 祥圃 MES proposal dogfood（2026-05-27）。

### AP-NEW-WRITE-1：寫提案沒做 WebSearch、用「客戶零基礎」假設
- **發生**：寫 proposal 跳過 WebSearch 步驟、直接用「客戶端待補」placeholder 占位、結果發現客戶已有 SAP ERP 等核心系統、整個 framing 過時
- **後果**：
  - Pitch 寫成「我們從 0 蓋」、客戶讀完笑掉牙（你連我用什麼都不知道）
  - 競品分析完全空白
  - 報價 / 整合工程量錯誤（沒算 SAP 整合）
- **根因**：把「公開可查」誤當「待訪談才能知」、低估 WebSearch 的價值
- **教訓**：**寫 proposal 前 30 min 必跑 WebSearch**、查：
  - 客戶公司基本資料（員工 / 規模 / 業務）
  - 客戶既有 IT（ERP / WMS / CRM、找 SAP 案例 / Salesforce 客戶名單）
  - 客戶通路（B2B 客戶誰）
  - 業界競品（同產業 MES / SaaS 廠商）
  - 法規 / 認證現況（CAS / HACCP / ISO）
- **對應模組**：[模組 01](12-modules/01-industry-market.md) + [模組 02](12-modules/02-competitors-alternatives.md) + [模組 03](12-modules/03-problem-business-goals.md) + Capture Plan

### AP-NEW-WRITE-2：競品分析「待補」、不是真寫
- **發生**：proposal §2 競品段標「待 user 內部補」、自己給自己 4/10 低分
- **後果**：違反 ProposalOS V10 「競品前移」紀律、Pitch 整體 framing 缺最關鍵的差異化定位
- **根因**：以為「真實 deal-loss 對手」是業務訪談才能知、忽略 80% 競品分析可用公開資料完成
- **教訓**：
  - 提案撰寫**階段必含**競品分析（不是「待補」）
  - 流程：WebSearch → 公開資料整理 → SWOT 每個競品 → 客戶選擇樹
  - 標 confidence：高（多家媒體 / 官網）/ 中（推論）/ 低（無公開資料）
  - **業務 deal-loss 訪談是補強、不是替代**
- **對應模組**：[模組 02](12-modules/02-competitors-alternatives.md) + [methodologies/shipley-apmp.md](methodologies/shipley-apmp.md)

### AP-NEW-WRITE-3：Capture Plan 當「大標案才用」、跳過
- **發生**：寫中型案（NT$ 500-1000 萬）proposal、跳過 Capture Plan、直接寫主提案書
- **後果**：客戶基本資料 / IT 現況 / 競品 / 採購流程 等沒有單獨檔、proposal 寫到一半才發現缺
- **根因**：誤把 Capture Plan 當「Shipley 大標案專用」、忽略中型案也需要事前情報整合
- **教訓**：
  - **區分「動作」vs「輸出」**：
    - **動作（WebSearch 公開資料）= 每案必做、含小案**（不查的風險不分案件大小）
    - **輸出（Capture Plan 完整檔）= 中型案 NT$ 100 萬+ 必做**
    - 小案動作做完、可用 1 頁筆記 / 5 facts 摘要、不用寫正式 Capture Plan 檔
  - Capture Plan 內容：客戶 + 競品 + IT + 採購 + Win Themes + 風險（公開資料事實版）
  - 寫主 proposal 時引用 Capture Plan 為 source of truth
  - 訪談後更新 Capture Plan（不是直接改 proposal）
- **對應模組**：[Shipley / APMP](methodologies/shipley-apmp.md) + [templates/capture-plan-template.md](../templates/capture-plan-template.md)

### AP-NEW-WRITE-4：小案用大案輸出格式（大刀小用）
- **發生**：30 萬小案、寫 10 段完整 Capture Plan + 100 頁 proposal + 完整 Win Themes 詳述
- **後果**：
  - 客戶看不下去（小案不該這麼複雜）
  - 業務員出手慢（一個小案花一週寫文件）
  - 邊際效益低（細節寫了客戶也不看）
  - 看起來「不專業」（小案 over-engineering = 顯得對小案無經驗）
- **根因**：用「動作 vs 輸出」混淆思維 — 認為「做完整研究 = 寫完整文件」
- **教訓**：
  - **動作（查公開資料）依「未知度」決定深度、不依金額**
  - **輸出格式依「案件規模」分 3 級**：
    - Layer 1：5 Facts 摘要（小案、1 頁、5 分鐘可填）
    - Layer 2：完整 Capture Plan（中案、10 段）
    - Layer 3：Layer 2 + Win Themes + 接觸計畫 + Compliance（大標 / 政府）
  - 動作做完 = 你知道一切；輸出 = 客戶 / 團隊看的、不要過度
- **對應模組**：[templates/capture-plan-template.md](../templates/capture-plan-template.md) 三層輸出格式段

## 7 問 Sanity Check（從真實案例提煉）

寫每個具體數字 / 主張前自問：

1. **欄位真的在被 update 嗎？**（避免「99.91%」型翻車 — 用率高其實是 col 沒被寫）
2. **數字背後有業務邏輯嗎？**（避免「9 個 tag」型誤推論）
3. **cohort 樣本同 plan / 同用途嗎？**（apple-to-apple）
4. **客戶 plan 歷史完整看了嗎？**（避免「1 筆 free 推 churn」型誤判）
5. **0% / 100% 極端值藏多層次嗎？**（極端值通常是定義問題）
6. **這數字當下 query 過嗎？基數定義明寫嗎？**
7. **「客戶用 X 技術」推論前驗過嗎？**（沒實證標 unverified）

⚠️ 這 7 問源於真實案件累積 71 修正後的提煉、適用於**任何具體主張**。

## Anti-Pattern Index 索引（按模組）

| 模組 | Anti-Patterns |
|---|---|
| 訪談 | AP-01、AP-02、AP-03、AP-NEW-01 |
| 競品 | AP-04、AP-05、AP-NEW-06 |
| 架構 | AP-06、AP-07、AP-08 |
| 商務 | AP-09、AP-10、AP-11、AP-12 |
| 合規 | AP-13、AP-14、AP-15、AP-16 |
| 交付 | AP-17、AP-18、AP-19、AP-20 |
| 法律 | AP-21、AP-22、AP-23 |

## 紅線提醒

⚠️ Anti-pattern 紀錄**不准寫真實客戶名**、所有 case 去敏感（用代號）。
⚠️ 紀錄前確認**雙方都同意分享**（或完全去到無可識別程度）。
⚠️ 不要把 anti-pattern 當作「批判」、是「學習」。
