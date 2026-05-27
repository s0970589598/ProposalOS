# E｜SBOM、License、供應鏈風險

🔴 簽前必交

## 為什麼必有

log4j、xz、各種上游漏洞爆出來時，客戶會問：「我們系統有用嗎？」

沒 SBOM = 答不出來 = 客戶要把整套系統重做風險分析 = 信任崩潰。

## SBOM 是什麼

**Software Bill of Materials** — 軟體元件清單。
列出系統用了哪些第三方套件、版本、來源、License。

### SBOM 標準格式

| 格式 | 用途 |
|---|---|
| SPDX | Linux Foundation 主推、法律導向 |
| CycloneDX | OWASP 主推、資安導向 |
| SWID | ISO/IEC 19770-2、IT 資產管理 |

## SBOM 必含欄位

| 欄位 | 說明 |
|---|---|
| 元件名稱 | npm / pip / maven 套件名 |
| 版本號 | 精確版本（不是 ^x.y.z） |
| 供應商 / 維護者 | 誰維護 |
| License | MIT / Apache 2.0 / GPL / 商用 |
| 來源 URL | npm / GitHub repo |
| Hash / 簽章 | 完整性驗證 |
| 已知漏洞 | CVE ID |
| 相依關係 | 上下游 |

## License 風險分類

| 類別 | 範例 | 風險 |
|---|---|---|
| 寬鬆 | MIT、BSD、Apache 2.0 | 低，注意專利條款 |
| 商業友善 | Apache 2.0、MPL | 中 |
| 弱 Copyleft | LGPL、MPL | 中，動態連結可避 |
| 強 Copyleft | GPL、AGPL | 高，整個系統可能要開源 |
| 商業授權 | 各家 EULA | 看條款 |
| 不明 / 無 License | GitHub 無 LICENSE 檔 | 高，預設保留全權 |

⚠️ **AGPL** 特別小心：你的 SaaS 用了 AGPL 元件，整個 SaaS 可能要開源。

## 供應鏈風險

不只是 software，硬體、雲端、第三方服務全算。

### 風險清單

| 類別 | 風險 |
|---|---|
| 開源套件 | 漏洞、廢棄、License 變更 |
| 商業軟體 | 廠商倒、漲價、停更 |
| 雲端服務 | 服務停、漲價、區域故障 |
| 硬體 | 缺料、停產、地緣政治 |
| 第三方 API | 異動、停服、限流 |
| 委外開發 | 程式碼品質、後門 |
| 內含 AI 模型 | 模型偏見、訓練資料、版本 |
| 取得管道 | GitHub Action、npm 仿冒 |

### 對策

| 對策 | 內容 |
|---|---|
| Lock file | 版本鎖死、不准浮動 |
| Mirror | 內部 mirror、不直連公開 registry |
| 漏洞自動掃描 | Dependabot / Snyk / Trivy |
| 套件審查 | 新加套件必審 License、維護狀況 |
| 替代方案 | 關鍵元件至少有 2 個選項 |
| 合約備援 | 商業軟體留 escrow agreement |
| 多雲 / 多 region | 避免單一雲廠商鎖定 |
| 元件汰除 | EOL 元件強制下架計畫 |

## SBOM 生成工具

| 語言 / 平台 | 工具 |
|---|---|
| 通用 | Syft、Trivy、Tern |
| Node.js | npm-sbom、cyclonedx-node-npm |
| Python | cyclonedx-bom、pip-audit |
| Java | cyclonedx-maven-plugin |
| Go | cyclonedx-gomod |
| Container | Syft、Anchore、Docker Scout |
| AWS | Inspector、ECR 內建 |

## 提案中要附

- SBOM 檔（SPDX 或 CycloneDX JSON）
- License 清單與分類
- 高風險元件處理計畫
- 供應鏈安全政策
- 元件更新節奏（多久檢視）
- 漏洞通報 / 處理 SLA

## 常見地雷

- ❌ 不知道用了什麼套件 → 客戶 IT 直接拒絕
- ❌ 沒鎖版本 → 上線後悄悄升級炸掉
- ❌ AGPL / GPL 混在 SaaS 裡 → 法務噩夢
- ❌ 用個人 GitHub repo 沒 License 檔 → 法律上等於保留全權
- ❌ Docker base image 不掃 → 整層漏洞繼承
- ❌ 「不會用 AI 訓練客戶資料」沒寫合約 → 客戶不信

## 與其他模組的關係

- ← 模組 07：合規、AI 風險
- ← 強制檢查項 D：Secure SDLC 的 SCA 階段

## 反方審查問題

- 給我 SBOM
- 用了 GPL 嗎？哪個元件？
- log4j 爆漏洞那天，你多久知道你系統有用？
- 第三方 API 停服，你的系統還能運作嗎？
- 雲端供應商漲價 50%，你的合約鎖價了嗎？
- 你的 docker base image 多久更新一次？
