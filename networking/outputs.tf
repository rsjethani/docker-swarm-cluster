
output "vpc_id" {
    value = "${aws_vpc.cluster_vpc.id}"
}

output "public_subnet_id" {
    value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet_id" {
    value = "${aws_subnet.private_subnet.id}"
}

output "ssh_for_all_id" {
    value = "${aws_security_group.ssh_for_all.id}"
}

output "swarm_nodes_sg_id" {
    value = "${aws_security_group.swarm_nodes_sg.id}"
}
