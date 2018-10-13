
variable "cluster_name" {
    type = "string"
    description = "The cluster name to use for tagging VPC resources"
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}
variable "public_subnet_cidr" {
    default = "192.168.56.0/27"
}
