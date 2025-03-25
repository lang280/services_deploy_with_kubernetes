resource "null_resource" "hadoop" {
    depends_on = [
        null_resource.get_credentials
    ]

    # 部署jenkins到GKE集群
    provisioner "local-exec" {
        command = <<-EOT
            kubectl apply -f k8s-config/deployment_hadoop.yaml --record &&
            kubectl apply -f k8s-config/service_hadoop.yaml
        EOT
    }
}