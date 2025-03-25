resource "null_resource" "get_credentials" {
    depends_on = [
        google_container_node_pool.default
    ]

    # 配置本地kubectl客户端来访问和管理GKE集群
    provisioner "local-exec" {
        command = "gcloud container clusters get-credentials ${google_container_cluster.default.name} --region=${google_container_cluster.default.location}"        
    }
}

resource "null_resource" "print_service_ip" {
    depends_on = [
        null_resource.spark,
        null_resource.jupyter,
        null_resource.hadoop
    ]

    # 打印service信息
    provisioner "local-exec" {
        command = <<-EOT
            sleep 60 &&
            kubectl get svc
        EOT
    }
}