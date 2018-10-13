/*
data "aws_ami" "centos7" {
    most_recent = true
    owners = ["679593333241"]
    filter {
        name = "product-code"
        values = ["aw0evgkw8e5c1q413zgy5pjce"]
    }
}
*/

resource "aws_instance" "managers" {
    count = 1
    #ami = "${data.aws_ami.centos7.image_id}"
    ami = "ami-3ecc8f46"
    instance_type = "t2.micro"
    key_name = "rjethani-kce-core"
    subnet_id = "${module.networking.public_subnet_id}"
    vpc_security_group_ids = ["${module.networking.ssh_for_all_id}"]
    tags {
        Name = "${format("master-%d", count.index)}"
    }
}

