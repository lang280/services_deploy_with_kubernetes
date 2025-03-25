resource "null_resource" "spark" {
    depends_on = [
        null_resource.get_credentials
    ]

    # 部署spark到GKE集群
    provisioner "local-exec" {
        command = <<-EOT
            kubectl apply -f k8s-config/deployment_spark.yaml --record &&
            kubectl apply -f k8s-config/service_spark.yaml
        EOT
    }
}