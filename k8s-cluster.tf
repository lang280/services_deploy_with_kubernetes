# GKE集群
resource "google_container_cluster" "default" {
  name     = var.k8s_cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  
  # 设置来运行terraform未来删除k8s集群
  deletion_protection     = false
}

# GKE节点池
resource "google_container_node_pool" "default" {
  # 必须的参数
  name       = var.k8s_cluster_pool_name
  location   = var.region
  cluster    = google_container_cluster.default.name
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size_gb

    # # 节点将使用的服务账号
    # service_account = google_service_account.default.email
    # # 为节点配置特定的Google Cloud服务访问权限
    # oauth_scopes    = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]
  }
}