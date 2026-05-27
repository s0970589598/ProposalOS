# MLOps + AI Governance

提案含 AI / ML 功能時必看。
**ML 系統不是普通軟體、有特殊維運與治理需求**。

## MLOps Maturity Model（Google / Microsoft 都有版本）

把 ML 系統的 maturity 分 3 級：

| Level | 內容 | 適合誰 |
|---|---|---|
| **Level 0：手動** | Data Scientist 手動跑 notebook、手動部署 | PoC、研究 |
| **Level 1：ML Pipeline 自動化** | 訓練 / 驗證 / 部署 pipeline 自動、模型 retrain 半自動 | 中型生產應用 |
| **Level 2：CI/CD 自動化** | 整個 ML 系統 CI/CD、模型自動 retrain、自動部署、自動監控漂移 | 大規模、Mission Critical |

→ 提案要明標：客戶目前在哪 Level、我們提案到哪 Level。
→ 客戶在 Level 0、我們提 Level 2 全自動 = over-engineering。

## ML 系統的 7 個 ML-specific 問題（傳統軟體沒有）

| 問題 | 範例 |
|---|---|
| **Data drift** | 上線 6 個月、輸入資料分布變了 |
| **Concept drift** | 「客訴」的定義改了、模型還用舊定義 |
| **Model decay** | 準確率隨時間下降 |
| **Training-serving skew** | 訓練時的 data 跟 prod 不一樣 |
| **Reproducibility** | 換個人 / 換時間 retrain，結果不一樣 |
| **Explainability** | 客戶問「為什麼這筆判為異常」、答不出來 |
| **Bias / Fairness** | 模型對某類客戶偏差大 |

提案要明標：每個問題怎麼處理。

## Model Cards（Google 提出）

每個 ML 模型的「規格書」，內含：

```
- 模型描述
- 訓練資料
- 預期使用情境
- 不適合使用情境
- 評估指標（accuracy / precision / recall / F1）
- 偏見與限制（fairness across subgroups）
- 倫理考量
- 版本與更新歷史
```

→ 提案內含 AI 時、附 Model Card 範例。Google、Meta、Hugging Face 都有公開 Model Card 標準。

## Datasheets for Datasets（MIT / Microsoft）

訓練資料的「規格書」：

```
- 資料來源與蒐集方式
- 蒐集者
- 蒐集時間
- 樣本數、分布
- 是否含個資、敏感資料
- 偏見來源（地域、語言、人口統計）
- 處理（清洗、標註、增量）
- 授權
```

→ 訓練資料是 AI 系統的關鍵風險、不能黑盒。

## Responsible AI 原則（Microsoft、Google）

Microsoft 6 原則：

1. **Fairness** 公平
2. **Reliability & Safety** 可靠安全
3. **Privacy & Security** 隱私資安
4. **Inclusiveness** 包容性
5. **Transparency** 透明
6. **Accountability** 課責

提案 AI 章節對齊這 6 原則、客戶治理會輕鬆過。

## 法規對應（必標）

| 法規 / 標準 | 內容 | 觸發 |
|---|---|---|
| **NIST AI RMF** | Govern / Map / Measure / Manage 四功能 | 通用最佳實務 |
| **EU AI Act** | 風險分級、High-Risk 系統嚴格規範 | 歐盟用戶 / 跨國 |
| **ISO 42001** | AI Management System | 治理框架 |
| **NIST AI 100-1** | AI RMF 1.0 | NIST 標準 |
| **AI Bill of Rights**（US） | 自願原則 | 美國 |
| **台灣 AI 基本法** | （草案） | 台灣未來 |

## Retrieval-Augmented Generation（RAG）架構

如果用 LLM（Claude / GPT / Gemini）、80% 的企業應用是 RAG。

```
[使用者問題]
    ↓
[Embed Query] → 向量
    ↓
[Vector DB 搜] → 找相關文件
    ↓
[組合 prompt] = Query + 文件
    ↓
[LLM 生成]
    ↓
[輸出 + 引用源]
```

關鍵架構決策（提案要寫）：

| 決策 | 選項 |
|---|---|
| Vector DB | Pinecone / Weaviate / Qdrant / PostgreSQL pgvector |
| Embedding 模型 | OpenAI text-embedding-3 / Cohere / 自訓 |
| LLM | Claude / GPT-4 / Gemini / Llama 3 自架 |
| Chunking 策略 | Fixed / Semantic / Hybrid |
| Retrieval | BM25 / Dense / Hybrid (RRF) |
| Re-ranking | Cohere / Cross-encoder / 無 |
| Guardrails | 輸入 / 輸出過濾 |
| Evaluation | RAGAS / DeepEval / TruLens / 自製 |

## AI Cost 控管

LLM 成本失控是常見災難。提案必含：

| 控管 | 內容 |
|---|---|
| Max tokens | 每次 input / output 上限 |
| Rate limit | 每 user / 每秒 |
| Budget alert | 達 50% / 80% / 100% 通知 |
| Hard cutoff | 達 100% 暫停 |
| Cheaper model fallback | 流量高時切便宜模型 |
| Caching | 重複問題快取 |
| Prompt 優化 | 減少 token |

→ 對應模組 10 的「用量上限與成本控管」段落。

## AI 評估指標

不能只說「準確」、要量化：

| 維度 | 指標 |
|---|---|
| 正確性 | Accuracy、Precision、Recall、F1 |
| 一致性 | 同樣 input 多次 output 一致 |
| 引用 | 是否引用 / 引用源是否準確 |
| 拒答 | 該拒答時是否拒答 |
| 幻覺 | Hallucination rate |
| 偏見 | Bias across subgroups |
| 速度 | P95 latency |
| 成本 | Token / call、$ / call |

每個 AI 功能都要設**驗收門檻**。

## 跟 ProposalOS 整合

### 模組 07 合規 AI 風險 加深

- NIST AI RMF 4 功能（Govern / Map / Measure / Manage）
- EU AI Act 風險分級
- Model Card + Datasheets for Datasets
- Responsible AI 6 原則

### 模組 08 架構 加 AI 子架構

- RAG 架構（如有）
- 模型版本管理
- Prompt 版控
- Eval 系統

### 模組 10 報價 加 AI 成本控管

- 對應 LLM token 成本
- Cost cap、budget alert

### 模組 11 驗收 加 AI 特有

- Accuracy、Hallucination、Bias 等驗收指標
- Eval 系統交付

### 強制檢查項 D Secure SDLC 加 AI 段

- Prompt injection 防禦
- Model security
- 訓練資料毒化防禦

## 適用情境

| 情境 | 適用度 |
|---|---|
| 提案含 LLM / GenAI | 必看 |
| 提案含 ML 模型 | 必看 |
| 提案只有規則型自動化 | 跳過 |
| 提案只是 ChatGPT 包裝 | 也要看（不能說「都是 OpenAI 負責」）|

## 常見錯誤

- ❌ 把 AI 寫成「魔法」、不寫評估方式
- ❌ 沒寫 model version、客戶不知道哪個版本在跑
- ❌ Prompt 沒版控、被改了不知道
- ❌ Cost 沒上限、客戶帳單炸
- ❌ 沒告訴客戶「資料會不會用於訓練」
- ❌ 沒寫人工 review 點

## 推薦讀物

- 《Designing Machine Learning Systems》Chip Huyen
- Google《Responsible AI Practices》
- Microsoft《Responsible AI Standard》
- NIST AI RMF 1.0（免費 PDF）
- Andrew Ng《AI Transformation Playbook》

## 相關 GoodLinker 經驗

- AI 輸出 anti-hallucination gate（從 ~/.claude/CLAUDE.md ADR-009 繼承）
- cove-verify、verify-pipeline、pair-review skill 整合
