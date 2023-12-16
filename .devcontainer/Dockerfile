# 备用的Dockerfile，如果需要自定义开发环境，可以使用这个Dockerfile
FROM mcr.microsoft.com/devcontainers/javascript-node:18

WORKDIR /app

# 复制剩余的应用源代码到工作目录
COPY . .

# 安装依赖
RUN npm install -g pnpm && \
    pnpm install && \
    pnpm build 
