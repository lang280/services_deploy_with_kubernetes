# Peer Worker: Lanting Hou
# Videso Link:
in folder videos

# Steps
## kubernetes cluster
use k8s-cluster.tf mainly for deployment

## Jupyter
docker image: jupyter/base-notebook  
deploy the deployment with k8s-config/deployment_jupyter.yaml  
deploy the service with k8s-config/service_jupyter.yaml  
### note: 
must explicitly specify the port number, otherwise the environment variables of GCP k8s pods will crash jupyter image

## Spark
docker image: apache/spark  
deploy the deployment with k8s-config/deployment_spark.yaml  
deploy the service with k8s-config/service_spark.yaml
### note:
need to clarify stdin: true in the deployment.yaml to keep the pod running without crash, for the same reason, need to have "/opt/spark/bin/spark-shell" as argument for k8s

## Hadoop
docker image: harisekhon/hadoop
deploy the deployment with k8s-config/deployment_hadoop.yaml
deploy the service with k8s-config/service_hadoop.yaml

## Frontend
docker image: henrylong280/my-simple-server:latest
deploy the deployment with k8s-config/deployment_frontend.yaml
deploy the service with k8s-config/service_frontend.yaml
### notes:
need to run "/start.sh" using "/bin/bash", and define the args as mentioned in the deployment_frontend.yaml

# 2nd part of the write up is in ReadMe-Jenkins+SonarQube.pdf