
variable "cluster_name" {
    type = "string"
    description = "Cluster Name"
    default = "rjethani"
}

variable "manager_count" {
    default = 1
    description = "No. of managers in the cluster"
}

variable "worker_count" {
    default = 1
    description = "No. of workers in the cluster"
}
