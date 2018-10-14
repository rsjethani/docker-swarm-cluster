locals {
    all_ips = "0.0.0.0/0"
}

resource "aws_default_security_group" "default" {
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_security_group" "ssh_for_all" {
    name = "ssh_for_all"
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${local.all_ips}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${local.all_ips}"]
    }

    ingress {
        from_port = 3000
        to_port = 4000
        protocol = "tcp"
        cidr_blocks = ["${local.all_ips}"]
    }

    tags {
        Name = "${var.cluster_name}"
    }
}

resource "aws_security_group" "swarm_nodes_sg" {
    name = "swarm_nodes_sg"
    vpc_id = "${aws_vpc.cluster_vpc.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${local.all_ips}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${aws_subnet.public_subnet.cidr_block}"]
    }

    ingress {
        from_port = 2377
        to_port = 2377
        protocol = "tcp"
        cidr_blocks = ["${aws_subnet.public_subnet.cidr_block}"]
    }

    ingress {
        from_port = 7946
        to_port = 7946
        protocol = "tcp"
        cidr_blocks = ["${aws_subnet.public_subnet.cidr_block}"]
    }

    ingress {
        from_port = 7946
        to_port = 7946
        protocol = "udp"
        cidr_blocks = ["${aws_subnet.public_subnet.cidr_block}"]
    }

    ingress {
        from_port = 4789
        to_port = 4789
        protocol = "udp"
        cidr_blocks = ["${aws_subnet.public_subnet.cidr_block}"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${aws_subnet.private_subnet.cidr_block}"]
    }

    tags {
        Name = "${var.cluster_name}"
    }
}

