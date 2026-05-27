# Cybersecurity Frameworks

我們有 NIST CSF（治理框架）和 NIST SSDF（開發），但**還有 3 個業界重要框架**沒整合：

| 框架 | 用途 |
|---|---|
| **MITRE ATT&CK** | 攻擊知識庫 |
| **Zero Trust Architecture** | 架構原則 |
| **CIS Controls v8** | 防禦清單（18 個 controls） |
| **BSIMM** | 軟體資安成熟度 |
| **CSA CCM** | 雲端資安控制矩陣 |
| **SLSA** | 供應鏈完整性 |

四者關係：

```
NIST CSF      → 治理層（管什麼）
CIS Controls  → 控制層（做什麼）
MITRE ATT&CK  → 威脅知識（防什麼）
Zero Trust    → 架構原則（怎麼設計）
BSIMM         → 開發成熟度（軟體層）
CSA CCM       → 雲端控制
SLSA          → 供應鏈完整性
```

## MITRE ATT&CK

公開的**攻擊知識庫**：列出已知攻擊技術（Tactics）、戰術（Techniques）、實際案例（Procedures）。

- **Tactics**（戰術，14 個）：Initial Access、Execution、Persistence、Privilege Escalation、Defense Evasion、Credential Access、Discovery、Lateral Movement、Collection、Command and Control、Exfiltration、Impact、Reconnaissance、Resource Development
- **Techniques**（技術，200+ 個）：每個 Tactic 下的具體做法
- **Procedures**：實際 APT / threat actor 案例

提案中怎麼用：

| 用途 | 怎麼做 |
|---|---|
| 威脅模型 | 列出本系統最可能遇到的 ATT&CK 技術（不是全部 200+）|
| 偵測策略 | 對應的 detection（Sigma rules）|
| Pen Test 範圍 | 模擬哪些 ATT&CK 技術 |
| 客戶資安回覆 | 「我們對 T1078 Valid Accounts、T1133 External Remote Services 有對應防禦」|

→ 客戶 CISO 看到 ATT&CK ID 引用 = 知道我們是行家。

## Zero Trust Architecture（NIST SP 800-207）

**架構原則**：「Never trust, always verify」。

7 個原則：

1. 所有資料源與運算服務都是資源
2. 通訊**不論位置**都要安全
3. 對個別 enterprise resource 的存取**按 session 授權**
4. 動態決策（多因素、行為、device posture）
5. 監控所有資源完整性與資安狀態
6. 認證授權**動態、嚴格執行**
7. 蒐集**資產、網路、通訊**全狀態用於改善資安

提案中應用：

| 傳統 | Zero Trust |
|---|---|
| VPN 進公司網就信任 | VPN 進公司網仍要每次驗證 |
| 內網信任 | 內網無信任 |
| 一次登入用很久 | 每次 session 重新驗 |
| 角色 RBAC | 角色 + 屬性 + 行為（ABAC + 風險）|

→ 對金融、醫療、政府客戶這是 **must-have**。

## CIS Controls v8

**Center for Internet Security** 的 18 個 controls。
比 NIST CSF 更具體、可直接查 checklist。

| # | Control | 範例 |
|---|---|---|
| 1 | Inventory of Enterprise Assets | 所有設備清單 |
| 2 | Inventory of Software Assets | 所有軟體 / 套件清單 |
| 3 | Data Protection | 資料分類、加密 |
| 4 | Secure Configuration | 設定基準 |
| 5 | Account Management | 帳號管理 |
| 6 | Access Control Management | 存取控制 |
| 7 | Continuous Vulnerability Management | 漏洞管理 |
| 8 | Audit Log Management | 日誌 |
| 9 | Email and Web Browser Protections | Email / 瀏覽器 |
| 10 | Malware Defenses | 反惡意 |
| 11 | Data Recovery | 備份還原 |
| 12 | Network Infrastructure Management | 網路設備 |
| 13 | Network Monitoring and Defense | 網路監控 |
| 14 | Security Awareness and Skills Training | 訓練 |
| 15 | Service Provider Management | 第三方管理 |
| 16 | Application Software Security | 應用資安 |
| 17 | Incident Response Management | 事件回應 |
| 18 | Penetration Testing | 滲透測試 |

每個 control 分 3 個實作組（IG1 / IG2 / IG3，從小公司到大企業）。

→ 提案資安章節對應 CIS Controls **比 NIST CSF 更具體**、客戶 IT 喜歡。

## BSIMM（Building Security In Maturity Model）

**軟體資安成熟度**模型。Synopsys 推、調查 100+ 公司資安實踐。

12 個實踐領域、每個有 maturity level：

- Governance、Intelligence、SSDL Touchpoints、Deployment 四大類
- 每類 3 個實踐
- 每實踐有 maturity level 1/2/3

→ 軟體 / SaaS 客戶會問「你 BSIMM 等級多少」。

## CSA Cloud Controls Matrix（CCM）

**雲端資安控制矩陣**。Cloud Security Alliance 推。
17 個 domain、各對應 ISO 27001、SOC 2、NIST、PCI 等映射。

雲端服務客戶法務愛問：「對應 CSA CCM 哪些 controls？」

## SLSA（Supply-chain Levels for Software Artifacts）

Google 推、現在 Linux Foundation 主管。
**軟體供應鏈完整性**標準。

4 個 level（L1-L4）：

| Level | 內容 |
|---|---|
| **L1** | Build 過程有 provenance 紀錄 |
| **L2** | 加上 host service、簽章 |
| **L3** | Build 環境安全強化 |
| **L4** | Two-party review、reproducible |

→ 補強我們的 SBOM（SBOM 是「有什麼」、SLSA 是「怎麼蓋出來的」）。

## 跟 ProposalOS 整合

### 模組 07 合規資安 加深

| 模組 07 子段 | 加什麼 |
|---|---|
| 通用資安 | NIST CSF 2.0（我們有）+ **CIS Controls v8 對應**（更具體）|
| 威脅模型 | STRIDE（我們有）+ **MITRE ATT&CK 引用** |
| 架構原則 | + **Zero Trust 7 原則** |
| 軟體資安 | NIST SSDF（我們有）+ **BSIMM 等級** |
| 雲端 | + **CSA CCM 對應** |
| 供應鏈 | SBOM（我們有）+ **SLSA Level** |

### 強制檢查項 D Secure SDLC 加深

加 MITRE ATT&CK 對應、BSIMM 等級、SLSA Level。

### 強制檢查項 E SBOM 加深

SBOM（清單）+ SLSA（產出可信）兩個一起。

### 模組 08 架構 加深

軟體 / 雲端架構引入 Zero Trust 設計、不只是「有 IAM」。

## 適用客戶

| 客戶類型 | 資安框架重點 |
|---|---|
| 政府 / 金融 / 醫療 | **全套**（NIST CSF + CIS + ATT&CK + Zero Trust + SLSA）|
| 一般企業 | NIST CSF + CIS（簡化版）|
| 中小型工具 | 簡化資安章節即可 |
| 跨國 / 上市櫃 | 需要 SOC 2 報告 + CSA CCM 對應 |

## 客戶端常見問題（提案要能答）

| 問題 | 我方答案位置 |
|---|---|
| 你符合 NIST CSF 哪些 functions？ | NIST CSF 對應表 |
| 你符合 CIS Controls 哪些 IG？ | CIS 對應表 |
| Pen Test 涵蓋哪些 ATT&CK 技術？ | Pen Test 範圍 |
| 你是 Zero Trust 架構嗎？ | 架構章節 |
| 你 BSIMM 等級？ | SDLC 章節 |
| 雲端對應 CSA CCM 哪些 domain？ | 雲端章節 |
| 你的軟體達 SLSA 哪個 Level？ | 供應鏈章節 |

## 推薦讀物

- attack.mitre.org（免費）
- NIST SP 800-207 Zero Trust Architecture
- cisecurity.org/controls
- bsimm.com
- cloudsecurityalliance.org
- slsa.dev

## 跟其他框架的關係

| 框架 | 跟資安 |
|---|---|
| NIST CSF | 治理 / 框架（我們有）|
| NIST SSDF | 開發框架（我們有）|
| ISO 27001 | 管理系統認證 |
| SOC 2 | 服務組織控制報告 |
| HIPAA / PCI-DSS | 產業特定 |
