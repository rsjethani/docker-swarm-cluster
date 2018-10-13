
resource "aws_vpc" "cluster_vpc" {
    cidr_block = "${var.vpc_cidr}"

    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.cluster_name}"
    }
}

