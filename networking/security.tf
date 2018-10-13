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
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "${var.cluster_name}"
    }
}

