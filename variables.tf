# project variables
variable "project_id" {
  type        = string
  description = "The project ID"
}

variable "credentials_json" {
  type        = string
  description = "The path to the credentials JSON file"
}

# terraform cluster variables
variable "region" {
  type        = string
  description = "The region of the cluster"
  default = "us-west4"
}

variable "k8s_cluster_name" {
  type        = string
  description = "The name of the GKE cluster"
  default = "default-cluster1"
}

variable "k8s_cluster_pool_name" {
  type        = string
  description = "The name of the GKE cluster pool"
  default = "default-pool1"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the node pool"
  default = 1
}

variable "node_machine_type" {
  type        = string
  description = "The machine type of the nodes in the node pool"
  default = "e2-standard-4"
}

variable "node_disk_size_gb" {
  type        = number
  description = "The disk size of the nodes in the node pool"
  default = 100
}
