# CLAUDE.md

此檔案為 Claude Code (claude.ai/code) 在此專案中工作時的指導文件。

## 人機協作最高指導原則

請務必全程用繁體中文回應
每次都用審視的眼光，仔細看我輸入的潛在問題，你要指出我的問題，並給出明顯在我思考框架之外的建議
你要對你自己有信心，如果你覺得我說的錯得太離譜或是概念走偏，也請厲聲指證

## 常用開發指令

### 本地開發
```bash
# Node.js 本地啟動伺服器
npm run local
# 訪問 http://localhost:8080/docs
```

### Docker 部署
```bash
# 建置並啟動容器
docker build -t fep-api .
docker run -p 8080:8080 fep-api
# 訪問 http://localhost:8080/docs
```

伺服器提供：
- **Docker 版**：http://localhost:8080/docs（Node.js Alpine 容器）
- **Node.js 版**：http://localhost:8080/docs（本地開發用）

## 架構概覽

這是一個基於 OpenAPI 3.0 規格和 oas3-tools 框架建構的 **FEP (Front End Processor) Simulator API**。專案已簡化為純 API 文檔展示用途。

### 核心元件

**入口點 (`index.js`):**
- 使用 OpenAPI 規格配置 oas3-tools
- **專注於 API 文檔展示**，不包含實際業務邏輯實作
- 在 port 8080 啟動 HTTP 伺服器

**API 規格 (`api/api-specification.yaml`):**
- FEP Simulator API v1.3.0 的完整 OpenAPI 3.0 規格
- 定義使用者管理、財金情境、聯徵情境、交易模擬、系統管理等端點
- 大多數端點使用 JWT Bearer 認證
- 包含詳細範例和錯誤代碼
- **這是專案的唯一核心**：完整的 API 規格文件

### API 功能領域

API 規格定義了幾個主要功能領域：

1. **使用者管理**: 認證、註冊、Token 驗證
2. **財金情境管理**: FISC 交易模擬設定
3. **聯徵情境管理**: JCIC 聯徵查詢模擬設定  
4. **交易模擬器**: 主要交易處理端點 (`/fes/txn/service/out`)
5. **系統管理**: 健康檢查、快取管理

### 目前實作狀態

**重要**: 已移除原本的 Swagger 自動生成 Pet Store 樣板代碼（controllers 和 services），專案現在專注於**純 API 規格展示**。如需實際功能，需要根據 `api-specification.yaml` 的完整規格來實作。

## 開發備註

- 使用 `oas3-tools` v2.2.3 提供 OpenAPI 3.0 支援
- 基於 Express.js 和 Connect 中介軟體
- 使用 js-yaml 解析 YAML 規格
- 無需建置過程或轉譯 - 直接用 Node.js 執行
- 目前未配置測試框架
- Docker 容器基於 Node.js 20.19.4 Alpine

## 依賴套件

- **oas3-tools**: OpenAPI 3.0 工具和中介軟體
- **connect**: 中介軟體層  
- **js-yaml**: YAML 解析，用於 OpenAPI 規格

## 專案狀態更新

**最新變更**:
- 專案名稱由 `fes-simulator-api-spec` 更新
- 移除了原本的 Pet Store 樣板代碼（controllers、services）
- Dockerfile 採用 Node.js Alpine 實作（非 Nginx 靜態檔案）
- 專案結構已簡化為純 API 規格展示
- 所有功能端點均定義在 `api-specification.yaml` 中

**注意事項**:
- 目前沒有 docker-compose.yaml 檔案
- Docker 部署使用標準 8080 port，非 80 port
- 容器內運行完整的 Node.js 應用程式，不是靜態檔案服務
