resource "null_resource" "sonarQube" {
    depends_on = [
        null_resource.get_credentials
    ]

    # 部署jenkins到GKE集群
    provisioner "local-exec" {
        command = <<-EOT
            cd k8s
            brew install helm
            kubectl get nodes
            kubectl taint nodes gke-hadoop-cluster-default-pool-2abfa0aa-9cr3 sonarqube=true:NoSchedule
            kubectl label node gke-hadoop-cluster-default-pool-2abfa0aa-9cr3 sonarqube=true
            helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
            helm repo update
            kubectl create namespace sonarqube
            helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube -f values.yaml
        EOT
    }
}
