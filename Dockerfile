#FROM registry.access.redhat.com/ubi8/nodejs-20:1-73
FROM node:20.19.4-alpine3.22

USER root

# 設定工作目錄
WORKDIR /app

# 複製所有專案檔案
COPY package.json pnpm-lock.yaml index.js ./
COPY api/ ./api/
COPY node_modules/ ./node_modules/

# 以 wasadmin 用戶執行
RUN addgroup -g 201 was && adduser -u 2001 -G was -h /app -D  wasadmin
#USER node

#RUN groupadd -g 201 was && useradd -u 2001 -g was -d /app wasadmin
USER wasadmin

EXPOSE 8080

# 啟動應用
CMD ["node", "index.js"]