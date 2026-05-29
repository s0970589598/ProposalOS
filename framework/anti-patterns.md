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
- **教訓**：[模組 03](modules/03-problem-business-goals.md) + [JTBD](methodologies/jtbd.md)

#### AP-02：只訪一個窗口

- **典型**：只跟 PM 訪、上線後第一線員工抗拒
- **根因**：沒覆蓋 [產銷人發財](modules/03-problem-business-goals.md) + 沒做 [stakeholder mapping](modules/05-stakeholders-raci.md)
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
- **根因**：[模組 02](modules/02-competitors-alternatives.md) 三類選項沒寫到「替代方案」
- **教訓**：替代方案必入競品矩陣

### 類別 3：架構 / 方案

#### AP-06：架構圖只一張、塞 4 層

- **典型**：客戶 IT 看不懂、跟主管看的是同一張圖
- **根因**：違反 [TOGAF 4 層](methodologies/c4-model.md) + [C4 Model](methodologies/c4-model.md) 分層原則
- **教訓**：給高層看 Context、給 IT 看 Container、不混

#### AP-07：NFR 全部不寫 / 全部寫超嚴

- **典型**：客戶問效能、答不出來；或承諾 99.99% 結果做不到
- **根因**：[模組 08 NFR](modules/08-architecture-functional-nfr.md) 段未認真量化
- **教訓**：NFR 數字必須有依據、能量測、能違約

#### AP-08：一律 Big Bang 上線

- **典型**：一次切換、失敗風險高、客戶不敢簽
- **根因**：[模組 09](modules/09-solution-options-phased-rollout.md) 沒給分階段選項
- **教訓**：分階段是預設、Big Bang 是例外

### 類別 4：商務 / 報價

#### AP-09：整套報一個價

- **典型**：報 500 萬、客戶覺得貴、無法挑配減項
- **根因**：[模組 10](modules/10-procurement-pricing.md) 沒拆項
- **教訓**：拆 5+ 項、可選 / 必選分明

#### AP-10：沒寫「不包含」

- **典型**：簽約後客戶說「我以為含這項」、無限追加
- **根因**：[模組 09](modules/09-solution-options-phased-rollout.md) + [模組 10](modules/10-procurement-pricing.md) 邊界不清
- **教訓**：「不含」清單寫出來、合約附錄

#### AP-11：給折扣不交換條件

- **典型**：客戶說「太貴」我方砍 10%、客戶下次再砍
- **根因**：[模組 10](modules/10-procurement-pricing.md) 商務策略沒抓
- **教訓**：折扣必須交換（合約期、付款、case 使用權、reference 同意）

#### AP-12：用量上限沒設

- **典型**：AI Token / API call 沒上限、客戶端 bug 跑迴圈、月帳單炸 10 倍
- **根因**：[模組 10 用量上限](modules/10-procurement-pricing.md) 段沒做
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
- **根因**：[模組 07 AI 治理](modules/07-compliance-security-ai-risk.md) + [MLOps](methodologies/mlops-and-ai-governance.md) 沒寫
- **教訓**：每個 AI 功能都要 accuracy / hallucination / bias 指標

### 類別 6：交付 / 驗收 / 維運

#### AP-17：驗收標準寫「客戶滿意」

- **典型**：上線後客戶說「不夠好」、無客觀標準
- **根因**：[模組 11](modules/11-acceptance-benefits-operations.md) 驗收沒量化
- **教訓**：每個驗收項可測、可重現、有時限

#### AP-18：基線數字沒量

- **典型**：上線後算不出「省了多少」、ROI 變吵架
- **根因**：[模組 11 效益追蹤](modules/11-acceptance-benefits-operations.md) 沒做基線
- **教訓**：簽約前**必量基線**

#### AP-19：RTO 寫 5min 但實際 8hr

- **典型**：SLA 寫 5min RTO、實測失敗、違約金被扣
- **根因**：[強制檢查項 F](8-mandatory-checks/F-rto-rpo-rollback.md) 沒實測
- **教訓**：合約寫的 RTO 必須**已演練過**

#### AP-20：上線後沒人接

- **典型**：客戶端沒指定接手人、3 個月後沒人在用
- **根因**：[模組 11 變革管理](modules/11-acceptance-benefits-operations.md) + [強制檢查項 B 溝通計畫](8-mandatory-checks/B-communication-plan.md) 沒做
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
- **對應模組**：[模組 05](modules/05-stakeholders-raci.md)

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
- **對應模組**：[模組 02](modules/02-competitors-alternatives.md)

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
- **對應模組**：[模組 01](modules/01-industry-market.md) + [模組 02](modules/02-competitors-alternatives.md) + [模組 03](modules/03-problem-business-goals.md) + Capture Plan

### AP-NEW-WRITE-2：競品分析「待補」、不是真寫
- **發生**：proposal §2 競品段標「待 user 內部補」、自己給自己 4/10 低分
- **後果**：違反 ProposalOS V10 「競品前移」紀律、Pitch 整體 framing 缺最關鍵的差異化定位
- **根因**：以為「真實 deal-loss 對手」是業務訪談才能知、忽略 80% 競品分析可用公開資料完成
- **教訓**：
  - 提案撰寫**階段必含**競品分析（不是「待補」）
  - 流程：WebSearch → 公開資料整理 → SWOT 每個競品 → 客戶選擇樹
  - 標 confidence：高（多家媒體 / 官網）/ 中（推論）/ 低（無公開資料）
  - **業務 deal-loss 訪談是補強、不是替代**
- **對應模組**：[模組 02](modules/02-competitors-alternatives.md) + [methodologies/shipley-apmp.md](methodologies/shipley-apmp.md)

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

### AP-NEW-WRITE-5：用「客戶提案」框架套「聯名 RFP」（套錯案件類型）
- **發生**：拿到雙方聯名合作 RFP（如 Amafans × GoodLinker EAQS）、直接套客戶提案 13 模組（含產業 / 競品 / 三方案 / 客戶引言）
- **後果**：
  - 競品分析多餘（聯名 RFP 是內部規格、不對外、不需打敗對手）
  - 客戶引言 placeholder（雙方都是客戶、無外部客戶引言概念）
  - 三方案不適用（聯名是單一規格、不是三選一）
  - 浪費時間在不適用的章節
- **根因**：ProposalOS 預設「客戶提案」案件類型、未覆蓋「聯名 RFP」
- **教訓**：
  - **不同案件類型用不同框架子集**：
    | 案件類型 | 適用框架 |
    |---|---|
    | **客戶提案** | 完整 13 模組 + 8 強制檢查項 |
    | **投資 / partnership pitch** | 13 模組部分 + 部分強制檢查（Capture Plan + Win Themes 重）|
    | **聯名 RFP** | 模組 03/04/06/07/08/11/12 + 強制檢查項 A/B/C/D/E/F + 17 待確認追蹤 |
    | **顧問報告** | 模組 03/04/06/07/08/11/12 + 強制檢查項 A/B/C/H |
    | **政府標案** | 完整 + Compliance Matrix + Shipley 全套 |
  - 開案前必先**判斷案件類型**、不要 default 客戶提案
  - 真實案例：Amafans EAQS 案、若直接套客戶提案會浪費 30% 工作量在不適用章節
  - **聯名 RFP sub-anti-patterns**（per Amafans EAQS 2026-05 真實案例累積）：
    - **AP-NEW-WRITE-5.a**：聯名 RFP §10 商務照 client-proposal 模板寫具體報價 / 三方案 — 聯名商務在合約 / appendix、RFP 主文不該包（per Amafans EAQS、商業條款延後另案）
    - **AP-NEW-WRITE-5.b**：跨檔差異追蹤只分「Demo vs RFP」2 維、漏「內部決議」第 3 維 — 例「智能控制移除」是 2026-05-29 內部決議、不在 Demo 也不在 RFP v0.6、要分 3 維追蹤
    - **AP-NEW-WRITE-5.c**：聯名雙方「對方確認」≠「我方內部決議」≠「外部已決」— 例會議只 confirm「用標準 Energy Data Panel」但電表 scope（整廠 / 分路）未明示、要在 pending tracker 列「對方未確認 vs 我方未決 vs 雙方未談」分開
    - **AP-NEW-WRITE-5.d**（per Amafans EAQS 翻車 #12、2026-05-29 user catch）：把「模組 01-02 對聯名 RFP N/A」過度簡化成「不需做」— **錯**。模組 01-02 有 **2 重任務**：(A) Marketing（外向、說服客戶）→ 聯名 RFP N/A；(B) Intelligence（內向、產業 / 競品 / 客戶 deployment / 應用情境 / 文章報導 / 法規動態作為規格設計輸入）→ 聯名 RFP **仍 mandatory**、寫進 research/ 不寫進 RFP 本文。實際本 session 已產 8+ 份 Intelligence research (對手監控 inventory / 客戶 deployment 案例 / 跨類別對標 / TAM / 節能 benchmark / sensor brand / 法規 / GoodLinker 電力規格) — 全屬模組 01-02 Intelligence 維度
    - **AP-NEW-WRITE-5.e**（per Amafans EAQS 翻車 #13 + #14、2026-05-29 user 雙重 catch）：「聯名」+「RFP」是 **orthogonal 2 dimension**、不要 collapse 成 1 term、但**也不要 over-correct 把兩者拆開**。本案 = 兩者複合「聯名 RFP」accurate phrasing。
      - **2 dimension matrix**：

      | 商業關係 \ 文件類型 | 有 RFP | 沒 RFP（pitch / 口頭 / 合約 only）|
      |---|---|---|
      | **客戶提案**（賣家→客戶）| 客戶提案 RFP | 一般 pitch deck |
      | **聯名合作**（雙方對等）| **聯名 RFP**（本案）| 聯名 pitch（如 GoodLinker × GCP）|
      | **內部 review** | 內部 RFP（少見）| ADR / status update |

      - **2 dimension orthogonal**：
        - 不是所有聯名都有 RFP（聯名可 skip RFP、走 pitch / 口頭 align / 合約附件）
        - 不是所有 RFP 都是聯名（客戶提案 / 政府標案 / 內部 RFP 都用 RFP）
      - **本案 = 聯名 + RFP both yes** = 「聯名 RFP」accurate case type description
      - **過度簡化錯誤 #1 (翻車 #13)**：把「聯名 RFP」collapse 成 1 term、忽略「聯名」是商業關係、「RFP」是文件類型
      - **過度簡化錯誤 #2 (翻車 #14)**：reverse 把「聯名」全砍改「對等合作 RFP」、誤導本案 not 聯名（actually 是）
      - **正確 framing**：保留「聯名 RFP」描述本案、framework 加 2D matrix note、強調 orthogonal、提醒 generalization warning（不是所有聯名都有 RFP）
- **對應模組**：[SKILL.md 案件類型判斷段](../skills/proposal-os/SKILL.md)

### AP-NEW-ANTI-HALLUC-1：Temporal attribution drift（日期戳隱含新決議、實則 inherit）

- **發生**：寫「✅ YYYY-MM-DD 內部決議：[既有 default state]」、但該 state 是更早既有 production / framework 沿用、user 只是 confirm 沿用、不是 today 才決定
- **後果**：被 user 質疑「有這個決議嗎」、需 git archaeology 驗起源、loss of trust、文件被當「過度宣示」
- **根因**：寫文件時自動加日期戳當「彰顯時效」、忘了區分「today 真決議」vs「today confirm 沿用既有」
- **教訓**：
  - 日期戳前必驗 — 真的 today 才決定的？還是 confirm 沿用？
  - phrasing 對齊：
    - ✅ 「2026-X-XX 確認」（today 真做決議）
    - ✅ 「沿用 [system X] 既有 production 架構（[version Y]）」（既有 inherit）
    - ❌ 「2026-X-XX 內部決議」+ 既有 default state（attribution drift）
  - 案例：Amafans EAQS 2026-05-29 — 「2026-05-29 GoodLinker 確認 Tokyo 主」phrasing 錯（AWS Tokyo 是 warroom v3.17 既有 production 架構沿用）、改「沿用 GoodLinker 既有 production 架構（warroom v3.17）」OK
- **對應模組**：[強制檢查項 C 決策紀錄](8-mandatory-checks/C-decision-log.md)

### AP-NEW-ANTI-HALLUC-2：Ghost attribution（「per X 決策」無 cite、變 ghost 起點）

- **發生**：寫「per [某決策]」附 claim 但無 cite source / 日期 / 決策人、claim 流傳到下游 file、後來被質疑時找不到起源
- **後果**：claim 變成 ghost、影響範圍擴散後無法 retract、anti-hallucination gate 在源頭失守
- **根因**：起草 draft 時 attribute「per 目標市場決策」「per 內部共識」這類含糊 phrasing、沒留 cite、半年後自己也忘是誰決定
- **教訓**：
  - 每個 attribution 必含 4 元素：**cite source（file path / commit hash）+ 日期 + 決策人 + 簽核狀態**
  - 找不到 source 就標 ⚠️ unverified、不要編造 attribute
  - 案例：Amafans EAQS rfp-v07-draft 既有「不存中國境內 per 目標市場決策」commit `7ac1ba6` 寫的 draft 構想、user 不記得有此決議、變 mis-attribution 起點、跨 11 個 file propagate
  - **git archaeology preflight**：寫 phrasing 引用既有 claim 前先 `git log -p` / `git log --all -p -- <file>` 找起源 commit
- **對應模組**：[強制檢查項 C 決策紀錄](8-mandatory-checks/C-decision-log.md)

### AP-NEW-ANTI-HALLUC-3：Evidence scope mismatch（單一 evidence 推到 over-scope claim、跳過 intermediate 層）

- **發生**：從一個 narrow evidence（如 grep static code 沒找到）直接推到 scope 大很多的 claim（如「production 不存在 / 平台不收 / 沒人用」）、跳過 raw / process / aggregate / display / persist 中間層
- **後果**：reviewer / user 有 production data 反證、claim 立刻破、loss of trust、信譽連鎖損
- **根因**：未區分 evidence 跟 claim 的 scope match — 「absence of evidence ≠ evidence of absence」基本科學方法被忽略
- **教訓**：
  - 寫 claim 前自問「我的 evidence scope 涵蓋什麼層？claim scope 涵蓋什麼層？」— 兩者必須 match
  - 「grep code 不到」evidence 只覆蓋「source code static reference」layer、**不覆蓋**：
    - runtime data flow（raw payload 收）
    - DB / time-series persist（資料落地）
    - cache / dashboard / display（即時顯示）
    - aggregation / report 邏輯（月報計算）
  - 數據系統 5 層 checklist：
    | 層 | grep 哪裡 |
    |---|---|
    | raw 收（MQTT / API 進）| MQTT subscribe / API endpoint code |
    | persist（DDB / RDS / shadow）| DB schema / migration / model |
    | process（backfill / cron）| Console Commands / Lambda handlers |
    | aggregate（月報 / KPI）| controller / service 計算邏輯 |
    | display（dashboard / chart）| frontend component / API response |
  - 反例 dogfood（per Amafans EAQS 2026-05-29）：
    - 我 grep `war_room app/` 沒找到 A/V/Vn/Hz/PF 處理邏輯 → claim「production 不處理」
    - User 給實際 production sensor data 反證：EM01_PF=0.94 / EM01_V=125.3 / EM01_A=63.5 / EM01_Hz=60 / EM01_kW=77890 / EM01_kWh=51265.5 6 量全送
    - 精準 stance 應是：「grep evidence 顯示 backfill / 月報計算邏輯不主用 A/V/Hz/PF、但 raw / persist / display 層**未驗**、不能 claim 平台不收」
- **對應模組**：[強制檢查項 C 決策紀錄](8-mandatory-checks/C-decision-log.md) + [7 問 Sanity Check](anti-patterns.md#7-問-sanity-check從真實案例提煉) 第 6 問擴充

### AP-NEW-ANTI-HALLUC-4：Single-tool over-confidence（一個工具就下結論、不交叉、不 hedging）

- **發生**：用一個工具（grep / Read / WebFetch / 對話脈絡）取得 evidence、就用「✅ verified」strong claim phrasing、沒交叉其他 layer authoritative source、也沒用 hedged language 反映 partial evidence
- **後果**：reviewer / user 用其他 layer authoritative source（如 api-nexus / PROD query / 廠商官網）反證、claim 立刻破、累積 loss of trust
- **根因（4 個 sub-cause 互相強化）**：
  - **Speed bias**：搶答覆速度、跳過「evidence scope 是否 cover claim scope」自檢
  - **Single-tool bias**：每次只用一個工具、漏掉其他 layer authoritative source（特別是 api-nexus / 文件平台 / PROD query 這類 abstraction-layer authoritative tool）
  - **Claim scope creep**：evidence 1 層、claim 默默 inflate 到 10 層（grep 1 個 controller → claim「平台不處理」）
  - **過度 confident phrasing**：default「✅ verified」、不 default「⚠️ partial-verified、[layer X] 未查」
- **教訓**：
  - **Multi-tool default sequence**（對「外部狀態事實主張」、≥ 2 個工具交叉）：
    | Claim type | 預設工具 sequence |
    |---|---|
    | API 數量 / spec | api-nexus / 文件平台（authoritative 文件層）+ git branch + PHP grep（implementation 層）|
    | production data state | PROD query / DDB 真實 traffic + DB schema grep |
    | 既有 default state（region / stack / version）| git log first-commit + CLAUDE.md / README + user confirm |
    | 業界 / 公司主張 | WebSearch / WebFetch 廠商官網 + 第三方 industry report 交叉 |
  - **Single-tool answer 永遠標 partial-verified**、不能用「✅ verified」
  - **Hedging language default**（per evidence 完整度）：
    | 證據完整度 | phrasing |
    |---|---|
    | ≥ 2 tool 交叉 verified | ✅ 「per [source A] + [source B] verified」 |
    | 1 tool verified、其他 layer 未查 | ⚠️ 「[source A] 顯示 X、[layer B] 未驗、需 [tool] 補」 |
    | 推測 / 印象 | ❓ 「unverified、訓練資料印象、需 [tool] 查」 |
  - **預檢 3 問**（寫 claim 前 30 秒問完）：
    1. 我的 evidence 哪一層？（implementation / abstraction / runtime / doc）
    2. 我的 claim 哪一層？（同上）
    3. 兩者 scope match 嗎？不 match → claim scope 縮到 evidence 真涵蓋
  - 案例（per Amafans EAQS 2026-05-29 retro、本 session 累計 4 次翻車）：
    - 翻車 #1：「不存中國境內」用 7ac1ba6 既有 phrasing 不 git archaeology 驗起源（→ AP-NEW-ANTI-HALLUC-2 trigger）
    - 翻車 #2：「Tokyo 確認」加日期戳當新決議、沒 user 確認是「today 真決議 vs 沿用既有」（→ AP-NEW-ANTI-HALLUC-1 trigger）
    - 翻車 #3：grep code 0 推「production 不收 A/V/Hz/PF」、被 EM01 sensor data 反證（→ AP-NEW-ANTI-HALLUC-3 trigger）
    - 翻車 #4：grep ElectricityController 4 支推「implementation 只 4 支」、被 api-nexus module 12 reveal 10 支 + 6 支共用 跨多 controller 反證（→ 本 AP-4 trigger）
    - 翻車 #5：multi-step edit 加新 §4.0-4.5 但沒刪舊 §4.2/4.3、file 同主題重複多段、user catch redundancy（→ commit checkpoint #6: edit 後 `grep -n "^### " file` 驗 header 無重複 / `git diff --stat` 看 add line >>> delete line 表示舊段沒刪）
    - 翻車 #6：local grep `EnergyMonthlyReportController` / `ElectricitySetupController` 0 result → claim「local 沒有、可能在 Lambda repo」、user catch「沒有要看 remote？」、`git fetch origin && git grep origin/dev` reveal controller 在 `origin/dev` remote、local 跟 origin/dev 不 sync（→ multi-tool sequence 加 3rd-fallback「local grep 0 → 必驗 remote」）
    - 翻車 #7：`search_apis(q=energyMonthlyReport)` return 6 支、漏 `markHandled`（api_key 是 `anomalyEvent.markHandled` 不是 `energyMonthlyReport.markHandled`）、claim「沒 register / 可能 internal use」、user catch「這是什麼功」後 `search_apis(q=markHandled)` reveal api_id=620 manual_verified 是正式 customer-facing API（PDCA 閉環關鍵）（→ multi-tool sequence 加 1st 規則「search_apis 用多 keyword 廣搜、不要只 query 1 個 namespace」）
    - 翻車 #8：本檔 §4.0 寫「API Nexus dotted namespace 是 abstraction、不一定 1-to-1 對應 PHP route、可能含 generic Tag CRUD 加總」— stale claim、是 翻車 #4 single-tool over-confidence 時寫的、後續 search_apis verified 證明 dotted namespace 跟 HTTP route 永遠 1-to-1、但我沒回頭 fix §4.0、user 讀到「什麼意思」問才發現（→ commit checkpoint #7：multi-step session 結束前 **回頭重讀自己早段寫過的 hedged claim**、看後續 evidence 是否已 verify 反證）
    - 翻車 #9：§7.1 hedge「sandbox 無 PROD access、未走 PROD 重 query」— default 假設「無 PROD access = 必 hedge」、實際本機 `proposal-intelligence/clients/amafans/2026-05-28_facts.md` 已有同事 PROD pull verified data + war_room production cron hard-coded thingName 雙重證明 active production、grep 一下就有、不需 hedge。User 一句 quote 後 grep 才發現（→ commit checkpoint #8：hedge「需 PROD / 需外部資料」前先 `grep -r <keyword> <ground-truth-folder>/` 看本機是否已有他人 pull 過的 cached verified data、再決定 hedge level）
    - 翻車 #10：§2「無 peer 修正」/「模組 01-02 N/A」這類 dense claim 寫完、user 一句「什麼意思」就 trigger explain — dense claim 沒配 inline example、reviewer 必問（→ commit checkpoint #9 Level 1+2：dense claim 後一定加 ❌/✅ phrasing example or 2×2 table 拆 case、documentation clarity 默認姿態）
    - 翻車 #11：§2 模組 01-02 N/A 已配 2×2 table、user 仍 quote 同 row 第 2 次「什麼意思」— Level 2 例（binary case table）對 multi-case 抽象結論不夠、reviewer 仍想不到具體場景（→ checkpoint #9 升級 Level 3：multi-case 抽象結論配「場景對比」3+ row table + 每 row 具體 example phrasing、讓 reviewer 看到具體什麼場景對應什麼 action / phrasing）
    - 翻車 #12：把「模組 01-02 對聯名 RFP N/A」過度簡化成 marketing 任務、忽略 Intelligence 維度 — user catch「同類型公司 / 客戶工廠 / 監控 / 產品分析 / 文章報導」這些 Intelligence 工作算不算？實際上**全算 module 01-02 Intelligence 任務、聯名 RFP 仍 mandatory（寫 research/ 不寫 RFP 本文）**。本 session 已產 8+ 份 Intelligence research、但 §2 phrasing 沒精確描述、誤導對方以為「N/A = 不需做」（→ AP-NEW-WRITE-5.d：module 01-02 永遠拆「Marketing 外向 + Intelligence 內向」2 重任務、聯名 RFP N/A 限 Marketing、Intelligence 仍 mandatory）
    - 翻車 #13：把「聯名」+「RFP」揉成一個 case type「聯名 RFP」— **錯方向 #1**。User 第一次 catch「聯名是商業合作模式、跟 RFP 文件類型是 orthogonal 2 dimension」、不要 collapse 成 1 term
    - 翻車 #14：reverse 過度 correction、一刀切把「聯名 RFP」全砍改「對等合作 RFP」— **錯方向 #2**。User 第二次 catch「這個案子是聯名沒錯」 — 本案 actually 是聯名、砍掉「聯名」反而 lose 重要 context、誤導對方「本案非聯名」。**正確 framing：「聯名」+「RFP」是 orthogonal 2 dimension、本案剛好 both yes、保留「聯名 RFP」accurate**、framework 加 2D matrix（商業關係 × 文件類型）標 generalization warning（不是所有聯名都有 RFP、不是所有 RFP 都是聯名）。AP-NEW-WRITE-5.e 已升級加 2D matrix。
    - **Meta lesson #14**：correction 不要 over-swing — 第一次 catch 修正後、不要 reverse 走另一極端、要找 middle ground（本案這條 lesson 對應 commit checkpoint #10「avoid pendulum over-correction」）
    - 翻車 #19（per Amafans EAQS 2026-05-29 user 5th correction round）：framework 用「hedged 範圍」當 jargon 對 user 不解釋、user catch「這是什麼？」。應該加 glossary：
      - **Verified（已驗）** = 已 cross-check 多 source、有 evidence、可放心 ship
      - **Hedged（保留條件）** = 有 draft / partial evidence、**但 NOT 100% ship-ready**、需補件 / sign-off 才能對外 release
      - **Unverified（未驗）** = 純印象 / 推測、無 evidence、不可寫進對外文件
      - 用「hedged」對 reviewer 必同段加 inline glossary、avoid jargon 困惑（per documentation clarity 維度）
    - 翻車 #18（per Amafans EAQS 2026-05-29 user 4th correction round）：framework 沒 explicit 標 **B2B-only scope**、缺 B2C 對照。User catch「B2B、B2C」短 query 暗示 framework gap。
      - **ProposalOS 是 B2B-focused framework**（Proposal OS = 提案 OS、B2B concept）
      - **不適用 B2C** 廣義消費品行銷（D2C / paid acquisition / brand / growth hacking）
      - **B2B vs B2C 5-dimension 差別**：
        | 維度 | B2B | B2C |
        |---|---|---|
        | 客戶 | 企業 / 政府 / NGO | 個人消費者 |
        | 流程 | 5-stage 接案（初步提案 → 簽約 → 上線）| Marketing → 試用 → 購買（不用 Proposal）|
        | 銷售週期 | 月 - 年 | 分 - 週 |
        | 客單價 | 百萬 - 億 | 百 - 萬 |
        | 文件 | RFP / Proposal / SA / SOW | landing page / 廣告 / D2C 平台 |
      - **B2B2B / B2B2C 混合 case**：產品商透過 channel 賣終端、framework 仍用 B2B 流程（如 Amafans × GoodLinker = B2B2B、GoodLinker→Amafans→終端工廠 B2B 客戶）
      - Framework correction：anti-patterns / methodologies 加 explicit「scope: B2B（含 B2B2B / B2B2C）」標籤、B2C 案件 redirect 其他 framework
    - 翻車 #17（per Amafans EAQS 2026-05-29 user 3rd correction round、跟翻車 #16 同 conceptual layer）：framework 用「台灣 SI」label 太狹窄、誤導 framework readership。User catch「不一定是 SI 啦、你指的 SI 是什麼」。
      - **SI = System Integrator** 嚴格定義：reseller + 整合他人 product 進客戶 IT 系統、不做自家 product（鼎新 / 精誠 / 凌群 / 緯軟）
      - **台灣 B2B 接案類型有 5 種、SI 只是其中一種**：
        | 類型 | 自家 product? | 範例 |
        |---|---|---|
        | SI 系統整合商 | ❌ | 鼎新 / 精誠 |
        | SaaS 平台 + 接案 | ✅ | GoodLinker (warroom PaaS) |
        | 顧問公司 | △ | KPMG / Deloitte |
        | 產品公司 / 新創 | ✅ | 多數新創 |
        | 接案 freelance | ❌ | 個人 / 小團隊 |
      - **「5-stage 接案流程」是 B2B 軟體 / 顧問接案通用、不限 SI**（SaaS + 接案 hybrid / 顧問 / 產品公司 / 工作室 都用）
      - Framework correction：「台灣 SI」全 sweep 改「**台灣 B2B 軟體 / 顧問接案**」廣義 phrasing
    - 翻車 #16：framework 過度 emphasize「RFP」當 case type、忽略 **台灣 B2B 軟體 / 顧問接案 / 中小企業案件實際慣用流程**。User catch「業界當用 RFP 嗎？我接案流程是初步提案 → 需求訪談 → 完整提案 → 簽約 → 施工 → 驗收 → 上線、完整提案含 SA 文件 + 功能模組」。
      - **台灣 B2B 軟體 / 顧問接案 案件 5-stage 慣用流程**（user 自己接案 SOP、是台灣中小企業 typical）：
        1. **初步提案**（brief pitch / 簡報、~5-10 slide）
        2. **需求訪談**（requirements discovery / 多輪會議）
        3. **完整提案**（Full Proposal = **SA spec + 功能模組 + 報價** 一起、不分開）
        4. **簽約**（SOW / MSA / 合約附件）
        5. **施工 / 測試 / 驗收 / 上線**（implementation / UAT / go-live）
      - **RFP 不是台灣 B2B 軟體 / 顧問接案 慣用 term**：
        | 場景 | 用 RFP 嗎？|
        |---|---|
        | 大型企業 procurement department | ✅ 常用 |
        | 政府 / 公部門標案 | ✅ **強制**（採購法）|
        | 跨國 US/EU 企業 IT 採購 | ✅ 常用 |
        | 上市櫃公司 > 千萬預算 | ✅ 可能 |
        | **台灣中小企業 / 一般 SI** | ❌ **不常用**（老闆 / IT 主管直接決策、走「完整提案」流程）|
      - **本案 GoodLinker × Amafans「RFP V0.6」對齊台灣 B2B 軟體 / 顧問接案 流程位置**：
        - 西式 / 大企業 procurement vocabulary 借用
        - 嚴格意義不是 RFP（無甲乙方、雙方對等）
        - 對應台灣 B2B 軟體 / 顧問接案 流程 = **完整提案的 SA 文件部分**（雙方共擬版）
        - 跟「完整提案」+「SA 文件」+「功能模組」同層級
      - Framework correction：ProposalOS 應該 default 台灣 B2B 軟體 / 顧問接案 5-stage 流程、RFP 作為 sub-stage doc（只大型企業 / 政府用）、不是 main case type axis
    - 翻車 #15：framework 用「客戶提案 RFP」當 case type、忽略 **RFP procurement 嚴格 definition**。User catch「向客戶提案、我們也會產 RFP 嗎？」答案：**不會**。
      - **RFP = Request for Proposal = 客戶 (甲方) 出**、徵求供應商 (乙方) 提案
      - 流程：**客戶寫 RFP → 供應商寫 Proposal Response → 簽 SOW / MSA**
      - 「客戶提案案件」實際包含 2 個 doc：**客戶 RFP** + **我方 Proposal**、不是「客戶提案 RFP」單一 doc
      - 本案 GoodLinker 寫的「RFP V0.6」**technically 不是 RFP** — 雙方對等、無甲乙方、無 procurement 流程、actually 是 **「聯名技術規格書 (Joint Spec)」informal 借用 RFP 命名**
      - Framework 該分清：
        - **客戶 RFP**：甲方（客戶）出
        - **我方 Proposal**：乙方（供應商）寫、回應 RFP
        - **Joint Spec**：雙方對等規格書（聯名案件常用、informally 也叫 RFP）
        - **Pitch deck**：無 RFP 時的提案（投資、聯名 pitch、客戶簡報）
        - **ADR**：內部架構決策紀錄
        - **SOW / MSA**：簽約 doc
      - 案件描述 phrasing 對齊嚴格 def：本案 = 「**聯名 Spec**（借用 RFP 名）」、不是「聯名 RFP」嚴格意義
- **對應模組**：[methodologies/multi-tool-verification](methodologies/multi-tool-verification.md) + [強制檢查項 C 決策紀錄 checklist](8-mandatory-checks/C-decision-log.md)

## Sensor Scheme 相關 Anti-Patterns（per Module 13 §9 Decision Matrix）

源自 Amafans EAQS 2026-05-29 顧問案 dogfood（HVLS fan + IAQ sensor placement、see `amafans-eaqs-proposal/research/09-sensor-placement-consultancy.md`）、generalize 跨產業 IoT / data-collection 案件。

### AP-NEW-SENSOR-1：「1 device 1 組 5 sensor 全配」over-deploy
- **產業**：IIoT / 智慧建築 / IoT / 資料採集
- **階段**：架構 / 商務 / 提案
- **發生**：每 device 配 ambient + asset-local + process + safety 全 5+ 類 sensor、1:1 全配
- **後果**：
  - BOM 推高 2-3× 推薦 mixed 解（per Amafans M 廠 case 估算 ~NT$ 420k-760k vs C mixed ~NT$ 200k-370k）
  - Ambient sensor placement 錯（集中在 device 不在 breathing zone、PM2.5 受 fan 氣流 noise）
  - 維護成本爆炸（年度校正 / 清潔 PM laser）
- **根因**：把「精細」誤當「準確」、忽略物理量空間特性差異
- **教訓**：套 [模組 13 §9.5 Option C mixed](modules/13-system-design-mvp.md#95-trade-off-framework--三種錯解-vs-推薦解)、Layer 1 走 site grid 不走 per-device、Layer 2 才走 per-asset
- **對應模組**：[模組 13 §9.2 4-layer 分類](modules/13-system-design-mvp.md#92-物理量四層分類4-layer-physical-quantity-classification)

### AP-NEW-SENSOR-2：「1 場域 1 組 5 sensor」under-deploy
- **產業**：IIoT / 智慧建築 / IoT / 資料採集
- **階段**：架構 / 商務 / 提案
- **發生**：整場域 1 組 5 類 sensor，asset-local sensor 也只 1 點
- **後果**：
  - Asset-local 量測 representativeness 失敗（per-asset 失準、device variation 量不出）
  - ROI / 節能 quantify 失敗（無 device-level baseline vs delta）
  - 告警 false negative（PM grid 單點漏異常 source）
- **根因**：cost-cutting 過頭、忽略 asset-local 需 1:1 or 抽樣
- **教訓**：套 [模組 13 §9.5 Option C mixed](modules/13-system-design-mvp.md#95-trade-off-framework--三種錯解-vs-推薦解)、Layer 2 至少抽樣 30-50%
- **對應模組**：[模組 13 §9.2 + §9.3 decision matrix](modules/13-system-design-mvp.md#93-decision-matrix--physical-quantity--placement--density--regulatory--sampling--cost)

### AP-NEW-SENSOR-3：從 vendor 默認 sensor scheme copy-paste、不對齊客戶廠房 layout
- **產業**：IIoT / 智慧建築 / IoT / 資料採集
- **階段**：架構 / 商務 / Phase 0 onboarding
- **發生**：照 vendor reference design / 同行案例 copy-paste sensor BOM、跳過客戶 site survey
- **後果**：
  - Phase 0 site survey 才發現 layout mismatch（樓層 / 分區 / 既有 sensor 殘留）
  - Onboarding 工時 + 50-100%
  - 客戶端不信任（「你連我廠房都沒看過怎麼報價」）
- **根因**：把「reference design」當「one-size-fits-all」、忽略客戶 layout 異質性
- **教訓**：Phase 0 必跑 [模組 13 §9.6.1 9-point site survey](modules/13-system-design-mvp.md#961-site-survey-checklist共通-9-點)、tier 套 §9.4 S/M/L preset、然後再客製
- **對應模組**：[模組 13 §9.4 + §9.6](modules/13-system-design-mvp.md#94-bom-tier-framework--s--m--l-presetgeneralized)

### AP-NEW-SENSOR-4：Sensor placement 當 RFP / proposal 後補的 afterthought
- **產業**：IIoT / 智慧建築 / IoT / 資料採集
- **階段**：提案 / 商務 / RFP draft
- **發生**：RFP V0.1-V0.5 寫到 sensor 章節用「5 類感測器整合」一句話帶過、V0.6+ 才補 placement 細節
- **後果**：
  - 簽約前 BOM 沒對齊（sensor 數量 / placement 都待補）
  - 報價 ±50% drift（per Amafans M 廠 case、不同 placement scheme 差 NT$ 100k-300k）
  - 安裝期間客戶 CR 滿天飛（per-fan vs per-site / 抽樣 vs 1:1 反覆改）
- **根因**：把 sensor scheme 當「實作細節」放後期、忽略它是商務報價 + 量測準確度雙因子的 critical input
- **教訓**：Phase 1 訪談階段即啟動 [模組 13 §9.2 4-layer 分類](modules/13-system-design-mvp.md#92-物理量四層分類4-layer-physical-quantity-classification)、§9.4 tier 預估、Phase 2 鎖定 BOM、RFP V0.1 就含 sensor scheme draft
- **對應模組**：[模組 13 §9.1 + §9.6](modules/13-system-design-mvp.md#91-何時適用本節trigger-condition) + [強制檢查項 H sensor coverage verification](8-mandatory-checks/H-evidence-pack.md)

### AP-NEW-SENSOR-5：法規 anchor 用 training-data 印象寫進 RFP、未 verify
- **產業**：IIoT / 智慧建築 / 醫療 / 食品 / 跨產業
- **階段**：提案 / 法務 review
- **發生**：在 RFP / proposal 直接寫「per ASHRAE 62.1 §6.1」/「per NFPA 72 §17.7.3」/「per OSHA 1910.1000 Table Z-1」等 clause 編號、未跑 WebSearch verify 該 clause 確切版本是否仍有效
- **後果**：
  - 客戶法務 / 工安 catch、信譽損
  - 真實 audit 對不上（法規版本更新 / clause 編號重排）
  - 重寫返工、簽約延遲
- **根因**：違反 [methodologies/multi-tool-verification.md](methodologies/multi-tool-verification.md) — Single-tool over-confidence（用訓練資料印象當 evidence）
- **教訓**：
  - 任何 clause 編號 ⚠️ 標 unverified、site survey / RFP draft 期 WebSearch + 客戶 jurisdiction 確切版本驗
  - phrasing pattern：
    - ❌ 「per ASHRAE 62.1-2022 §6.1.1 breathing zone」（confident but unverified）
    - ✅ 「per ASHRAE 62.1-2022 §6 ventilation rate procedure（breathing zone 規範、確切 sub-clause ⚠️ 待 deployment 期 verify per [methodologies/multi-tool-verification.md]）」
  - cross-ref: [模組 13 §9.10 + §9.11](modules/13-system-design-mvp.md#910-open-question--boundarygeneralization-限制) 法規 anchor cited + hedging 規則
- **對應模組**：[模組 13 §9.11](modules/13-system-design-mvp.md#911-verification-status--websearch-sources) + [methodologies/multi-tool-verification.md](methodologies/multi-tool-verification.md) + [AP-NEW-ANTI-HALLUC-4 Single-tool over-confidence](#ap-new-anti-halluc-4single-tool-over-confidence一個工具就下結論不交叉不-hedging)

## Session Retrospective 相關 Anti-Patterns

源自 [methodologies/session-retrospective.md](methodologies/session-retrospective.md) — framework 自我演化方法論本身的失敗模式（meta-anti-pattern、retrospective process 怎麼會踩雷）。

⚠️ 本框架原創 per Amafans EAQS 2026-05 case dogfood 累計、未在業界 retrospective methodology 文獻找到等同設計。

### AP-NEW-SESSION-RETRO-1：Retro 結束不 spawn upgrade agent

- **發生**：跑完 session retrospective、寫了 framework upgrade proposal、但沒 spawn agent 執行、proposal 變 dead doc / 進 backlog 永不執行
- **後果**：framework 沒進步、下次 same gap 又出現、retro 變形式主義
- **根因**：retro 報告寫完當 deliverable、忘記「retro 真正 value 是 framework 升級執行、不是報告本身」
- **教訓**：retro §4 upgrade proposal **必含 Status 欄**、Immediate 項必同 session spawn agent 跑完、Near-term 開 issue 進 backlog、Long-term 入 v2 RFC。每筆 upgrade commit message 帶「per <case> retrospective」便於追蹤
- **對應模組**：[methodologies/session-retrospective.md §3 Step 5](methodologies/session-retrospective.md) + [強制檢查項 C 決策紀錄](8-mandatory-checks/C-decision-log.md)

### AP-NEW-SESSION-RETRO-2：Cross-session learning 散落、無 consolidation

- **發生**：每 case retrospective 自己跑、anti-patterns / framework upgrade 沒跨 case 整合、N case 後 anti-patterns.md 600 條雜亂、reviewer / new author 找不到 pattern
- **後果**：framework 名義上有 retrospective、實際上每案重新學、framework 沒長期 leverage
- **根因**：retro 預設「per-case scope」、沒設計 cross-case consolidation hook
- **教訓**：每 N case（每 5 case 或每季）跑一次 **cross-case consolidation retrospective**、把零散 AP 歸納成 pattern、framework 整體升級。配套未來 `/cross-case-consolidate` skill
- **對應模組**：[methodologies/session-retrospective.md §8 AP-RETRO-6](methodologies/session-retrospective.md)

### AP-NEW-SESSION-RETRO-3：Framework upgrade 沒 dogfood example、變抽象規範

- **發生**：升級 framework 加新 methodology / module / AP、但沒 cite 真實 case dogfood、變抽象「應該這樣做」條款
- **後果**：framework reader 看不懂「為何加這條」、抽象難內化、執行率低
- **根因**：upgrade 寫 author 知道原因、但沒寫進 file、傳給 reader 時 context 漏
- **教訓**：每 framework upgrade **必含 dogfood case cite**（commit hash + case name + 日期 + 翻車 # 編號）、無 dogfood → 標 hypothesis / draft、不入 main framework
- **範例**：本檔 AP-NEW-WRITE-5.e 含「per Amafans EAQS 2026-05 真實案例累積」cite + 翻車 #13/14 編號 = 對的 dogfood example；不要寫純抽象「proposal type should be classified by 2D matrix」without dogfood
- **對應模組**：[methodologies/session-retrospective.md §8 AP-RETRO-4](methodologies/session-retrospective.md)

### AP-NEW-SESSION-RETRO-4：Pendulum over-correction（per Amafans 翻車 #14、retro layer）

- **發生**：retrospective catch 第 1 個 gap、修正後 reverse 走另一極端、產生新 gap、user 再 catch 第 2 次
- **後果**：correction loop 跑兩次以上、user 累、framework upgrade 來回擺盪、信譽損
- **根因**：correction 第 1 次的 push 把心理錨點打到另一端、failed to find middle ground
- **教訓**：correction 後尋找 **middle ground**、不要 reverse 走另一極端、保留 user 第 1 次 correction 對的部分。寫 correction commit 前自問「我是不是 over-correct 砍掉 user 認可的部分？」
- **範例**：Amafans 翻車 #14：user catch「聯名 ≠ RFP」第一次 → 我全砍「聯名」改「對等合作 RFP」、user 第二次 catch「本案 actually 是聯名」、middle ground 應是「保留聯名 RFP 描述 + 加 2D matrix note + 標 generalization warning」
- **對應模組**：[methodologies/multi-tool-verification.md commit checkpoint #10](methodologies/multi-tool-verification.md) + [methodologies/session-retrospective.md §8 AP-RETRO-5](methodologies/session-retrospective.md)

### AP-NEW-SESSION-RETRO-5：Retro 不在 session end 跑、累到下案才跑

- **發生**：session 結束沒跑 retrospective、deliverable ship 完直接結案、user-push gap 沒系統化 capture、下案 kickoff 才嘗試回想
- **後果**：gap 細節遺失（user 原句、framework miss 具體點、root cause）、retrospective 失去 80% leverage、變「印象總結」
- **根因**：retro 沒 schedule 進 session-end ritual、被當「有空才做」optional task
- **教訓**：retrospective **必在 session end natural trigger 點立即跑**（deliverable ship 完 / case milestone 到 / 連續 work 段落結束）、不等下案 kickoff。配套 proposal-os Phase 6 結尾 auto trigger retrospective、verify-pipeline 結束 trigger、wiki-lint 跑出 contradiction trigger
- **對應模組**：[methodologies/session-retrospective.md §2 Retrospective 觸發條件](methodologies/session-retrospective.md) + [skills/proposal-os SKILL.md Phase 6 結尾](../skills/proposal-os/SKILL.md)

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
| Sensor / IoT 部署（模組 13 §9）| AP-NEW-SENSOR-1、AP-NEW-SENSOR-2、AP-NEW-SENSOR-3、AP-NEW-SENSOR-4、AP-NEW-SENSOR-5 |

## 紅線提醒

⚠️ Anti-pattern 紀錄**不准寫真實客戶名**、所有 case 去敏感（用代號）。
⚠️ 紀錄前確認**雙方都同意分享**（或完全去到無可識別程度）。
⚠️ 不要把 anti-pattern 當作「批判」、是「學習」。
