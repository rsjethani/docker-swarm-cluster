
output "manager_private_ips" {
    value = "${aws_instance.managers.*.private_ip}"
}

output "worker_private_ips" {
    value = "${aws_instance.workers.*.private_ip}"
}

output "Bastion IPs" {
    value = "${aws_instance.bastion.*.public_ip}"
}


output "manager_public_ips" {
    output = "${aws_instance.managers.*.public_ip}"
}

