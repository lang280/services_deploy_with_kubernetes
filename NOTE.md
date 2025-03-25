
# 获取访问集群的认证信息
使用下面的命令来配置kubectl访问你的GCP Kubernetes集群。这条命令会更新你的~/.kube/config文件，添加新的集群、用户、上下文信息，从而允许kubectl与集群通信
gcloud container clusters get-credentials [CLUSTER_NAME] --zone [ZONE] --project [PROJECT_ID]

# 需要开始cluster pod egree, 否则jenkins无法下载插件
gcloud compute firewall-rules create allow-pod-outbound --direction=EGRESS --priority=1000 --network=default --action=ALLOW --rules=all --destination-ranges=0.0.0.0/0

# Spark
需要使用stdin: true + args: ["/opt/spark/bin/spark-shell"], 这样才能保持运行


# jenkins
https://hub.docker.com/r/jenkins/jenkins

# 配置jenkins
https://youtu.be/8Qzp9KhvCkM?feature=shared
# 配置jenkins的sonar scanner插件
https://youtu.be/KsTMy0920go?feature=shared

# token

args: ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]


# jenkins docker run
docker run --rm -p 8080:8080 jenkins/jenkins:lts

# spark docker run
docker run -it apache/spark /opt/spark/bin/spark-shell

# front end run
docker run -d --rm -p 80:80 henrylong280/my-simple-server 'http://34.162.123.130:8888/' 'https://hadoop.apache.org/' 'http://34.162.37.65:4040/' 'http://34.162.100.239:8080/' 'https://en.wikipedia.org/wiki/SonarQube'
