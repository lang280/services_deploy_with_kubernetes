#这个Dockerfile将复制你的静态页面到镜像中，并添加一个启动脚本来替换HTML文件中的占位符
FROM nginx
COPY ./start.sh /start.sh
COPY ./index.html /usr/share/nginx/html/index.html
RUN chmod +x /start.sh
ENTRYPOINT ["bash", "/start.sh"]