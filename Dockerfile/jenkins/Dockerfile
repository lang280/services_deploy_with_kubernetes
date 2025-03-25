FROM jenkins/jenkins:lts
# 安装JCasC插件
RUN jenkins-plugin-cli --plugins configuration-as-code
# 将你的JCasC配置文件添加到镜像中
COPY my-jenkins-config.yaml /var/jenkins_home/casc_configs/my-jenkins-config.yaml
# 设置JCasC配置文件的环境变量
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/my-jenkins-config.yaml
