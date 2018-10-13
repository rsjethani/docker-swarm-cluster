
output "Manager IPs" {
    value = "${aws_instance.managers.*.private_ip}"
}

output "Worker IPs" {
    value = "${aws_instance.workers.*.private_ip}"
}

output "Bastion IPs" {
    value = "${aws_instance.bastion.*.public_ip}"
}
