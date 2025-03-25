resource "null_resource" "jupyter" {
    depends_on = [
        null_resource.get_credentials
    ]

    # 部署jupyter到GKE集群
    provisioner "local-exec" {
        command = <<-EOT
            kubectl apply -f k8s-config/deployment_jupyter.yaml --record &&
            kubectl apply -f k8s-config/service_jupyter.yaml
        EOT
    }
}