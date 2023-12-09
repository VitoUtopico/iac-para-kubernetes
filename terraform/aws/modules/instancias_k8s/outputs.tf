output "control_planes_public_ip" {
    value = aws_instance.control_planes.*.public_ip
}

output "control_planes_private_ip" {
    value = aws_instance.control_planes[*].private_ip
}

output "nodes_public_ip" {
    value = aws_instance.nodes[*].public_ip
}

output "nodes_private_ip" {
    value = aws_instance.nodes[*].private_ip
}