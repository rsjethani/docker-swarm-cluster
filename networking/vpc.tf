
resource "aws_vpc" "cluster_vpc" {
    cidr_block = "${var.vpc_cidr}"

    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_internet_gateway" "internet_gw" {
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internet_gw.id}"
    }

    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    cidr_block = "${var.public_subnet_cidr}"
    map_public_ip_on_launch = true
    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_route_table_association" "public_subnet_with_public_rt" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

