# FEP Simulator API 規格展示

## 專案概述
這是一個 **FEP (Front End Processor) Simulator API** 的規格展示專案。專案專注於透過 Swagger UI 展示完整的 API 規格文件，不包含實際的業務邏輯實作。

## 啟動方式

### 本地開發（Node.js）
```bash
# 安裝依賴（如果尚未安裝）
npm install

# 啟動本地展示伺服器
npm run local

# 訪問 Swagger UI 介面
# http://localhost:8080/docs
```

### Docker 部署
```bash
# 建置並啟動容器
docker build -t fep-api .
docker run -p 8080:8080 fep-api

# 訪問 http://localhost:8080/docs
```

## 技術架構

### 核心技術棧
- **oas3-tools v2.2.3**: OpenAPI 3.0 工具和中介軟體
- **Express.js**: Web 框架基礎
- **Connect**: 中介軟體層
- **js-yaml**: YAML 規格解析
- **Node.js 20.19.4**: 運行環境（Alpine Linux）

### 專案結構
```
fep-simulator-api-spec/
├── api/
│   └── api-specification.yaml    # OpenAPI 3.0 完整規格
├── index.js                     # 應用程式入口點
├── package.json                 # 專案配置和依賴
├── Dockerfile                   # 容器化配置
└── README.md                    # 專案說明
```

## API 規格重點

### FEP Simulator API v1.3.0 功能領域
1. **使用者管理**: 認證、註冊、Token 驗證
2. **財金情境管理**: FISC 交易模擬設定
3. **聯徵情境管理**: JCIC 聯徵查詢模擬設定
4. **交易模擬器**: 主要交易處理端點 (`/fes/txn/service/out`)
5. **系統管理**: 健康檢查、快取管理

### 認證機制
大多數端點使用 **JWT Bearer Token 認證**，詳細規格請參考 `api-specification.yaml`。

## 開發狀態

**目前實作狀態**: 專案專注於 **純 API 規格展示**，已移除 Swagger 自動生成的樣板代碼。如需實際功能實作，請根據 `api/api-specification.yaml` 的完整規格進行開發。

## 說明

- 無需建置過程 - 直接用 Node.js 執行
- 目前未配置測試框架
- 專案使用 Unlicense 授權
- 訪問 `/docs` 端點即可瀏覽完整 API 規格
