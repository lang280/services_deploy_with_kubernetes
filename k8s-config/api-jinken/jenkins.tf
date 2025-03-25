resource "null_resource" "jenkins" {
    depends_on = [
        null_resource.get_credentials
    ]

    # 部署jenkins到GKE集群
    provisioner "local-exec" {
        command = <<-EOT
            brew install helm
            helm repo add jenkinsci https://charts.jenkins.io
            helm repo update
            kubectl apply -f jenkins-volume.yaml
            kubectl apply -f jenkins-sa.yaml
            chart=jenkinsci/jenkins
            helm install jenkins -n jenkins -f jenkins-values.yaml $chart

        EOT
    }
}
