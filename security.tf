resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.cluster_vpc.id}"

  tags {
      Name = "${var.cluster_name}-default-sg"
  }
}

resource "aws_security_group" "master_sg" {
    name = "${var.cluster_name}_master_sg"
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
        Name = "${var.cluster_name}_master_sg"
    }
}
