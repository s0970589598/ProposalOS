# V11｜落地補強版

## 主題

V7-V10 架構完整了，但落地會爆炸。
V11 補上 8 個容易被埋的細節。

## V11 提出的 8 強制檢查項

| 代號 | 項目 | 過去出事情境 |
|---|---|---|
| A | RTM 需求追蹤矩陣 | 客戶說「我以為包含 X」找不回需求源 |
| B | 專案溝通計畫 | PM 異動、跨部門協調卡住 |
| C | 變更紀錄與決策紀錄 | 半年後爭執「為什麼這樣設計」 |
| D | Secure SDLC / AppSec | 客戶資安問「你們怎麼開發」答不出 |
| E | SBOM、License、供應鏈 | log4j 爆出來不知道有沒有用 |
| F | RTO / RPO、備份、回滾 | 「壞了多久能回來」沒承諾 |
| G | 退出機制 | 客戶法務卡「資料怎麼帶走」 |
| H | 提案證據包 | 客戶老闆問「做過幾個」拿不出 |

## 為什麼是這 8 個

V11 強調這些**不是 12 模組漏掉**，而是**容易被埋在模組裡看不到**：

- RTM 概念上在模組 03/08/11，但不單獨列就會被忘
- SBOM 在模組 07 一句帶過，不夠
- 退出機制在模組 10 商務條款一行，被當作小字

→ 提升成獨立檢查項才有保障。

## 對應到 V12

→ 完整保留進 [framework/8-mandatory-checks/](../../framework/8-mandatory-checks/)
→ 提案模板 [templates/proposal-template-standard.md](../../templates/proposal-template-standard.md) 每個對應章節都引用

## V11 與專業框架對齊

8 項都對應到成熟框架：

| V11 項 | 對應框架 |
|---|---|
| A RTM | IIBA BABOK Traceability |
| B 溝通計畫 | PMBOK Communications |
| C 決策紀錄 | ADR (Architecture Decision Records) |
| D Secure SDLC | NIST SSDF、OWASP SAMM |
| E SBOM | NIST SP 800-218、EO 14028 |
| F RTO/RPO | NIST CSF Recover、ITIL Service Continuity |
| G 退出機制 | EU GDPR Article 28、雲委外法規 |
| H 證據包 | 銷售方法論（SPIN、Challenger）|

## 保留的價值

- 把「容易被埋」的細節獨立出來
- 每項對應一個過去出事情境（不是憑空想）
- 對齊國際成熟框架，有引用基礎
