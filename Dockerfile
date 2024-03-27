# docker build . -t registry.cn-shanghai.aliyuncs.com/ayaka/ayaka-home:latest
FROM node:16.19.1-alpine as build

# 设置工作目录
WORKDIR /app

# 拷贝项目文件到工作目录中
COPY . .

# 安装依赖
RUN npm install

# 构建项目
RUN npm run build --prod


# 用Nginx镜像作为基础镜像
FROM nginx:1.21.3-alpine

COPY --from=build /app/dist/ /usr/share/nginx/html

# 暴露 Nginx 端口
EXPOSE 80

# 启动 Nginx 服务器
CMD ["nginx", "-g", "daemon off;"]
