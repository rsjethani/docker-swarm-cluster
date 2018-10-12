resource "aws_vpc" "cluster-vpc" {
    cidr_block = "172.16.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "rjethani"
    }
}

resource "aws_subnet" "cluster-subnet" {
    vpc_id = "${aws_vpc.cluster-vpc.id}"
    cidr_block = "172.16.10.0/24"
    map_public_ip_on_launch = true
    tags {
        Name = "rjethani"
    }
}

