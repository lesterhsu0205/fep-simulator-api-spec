# 簡單的 Node.js Alpine 版本
FROM node:20.19.4-alpine3.22

# 設定工作目錄
WORKDIR /app

# 複製所有專案檔案
COPY package.json pnpm-lock.yaml index.js ./
COPY api/ ./api/
COPY node_modules/ ./node_modules/

# 開放 8080 port
EXPOSE 8080

# 以非 root 用戶執行
USER node

# 啟動應用
CMD ["node", "index.js"]
