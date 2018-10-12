
resource "aws_vpc" "cluster-vpc" {
    cidr_block = "172.16.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.cluster_name}_vpc"
    }
}

resource "aws_internet_gateway" "internet-gw" {
    vpc_id = "${aws_vpc.cluster-vpc.id}"
    tags {
        Name = "${var.cluster_name}_internet-gw"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = "${aws_vpc.cluster-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internet-gw.id}"
    }

    tags {
        Name = "${var.cluster_name}_public-rt"
    }
}

resource "aws_subnet" "public-sn" {
    vpc_id = "${aws_vpc.cluster-vpc.id}"
    cidr_block = "172.16.10.0/24"
    map_public_ip_on_launch = true
    tags {
        Name = "${var.cluster_name}_public-sn"
    }
}

resource "aws_route_table_association" "public-sn_with_public-rt" {
  subnet_id      = "${aws_subnet.public-sn.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}


