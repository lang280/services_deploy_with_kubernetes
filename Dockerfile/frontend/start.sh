#!/bin/bash

# 读取命令行参数并设置环境变量
LINK1="$1"
LINK2="$2"
LINK3="$3"
LINK4="$4"
LINK5="$5"

# 使用传递给docker run的参数替换占位符
sed -i "s|{{LINK1}}|$LINK1|g" /usr/share/nginx/html/index.html
sed -i "s|{{LINK2}}|$LINK2|g" /usr/share/nginx/html/index.html
sed -i "s|{{LINK3}}|$LINK3|g" /usr/share/nginx/html/index.html
sed -i "s|{{LINK4}}|$LINK4|g" /usr/share/nginx/html/index.html
sed -i "s|{{LINK5}}|$LINK5|g" /usr/share/nginx/html/index.html

# 启动Nginx
nginx -g 'daemon off;'
