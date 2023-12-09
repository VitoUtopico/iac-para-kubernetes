output "control_planes_public_ip" {
    value = module.instancias_k8s.control_planes_public_ip
}

output "control_planes_private_ip" {
    value = module.instancias_k8s.control_planes_private_ip
}

output "nodes_public_ip" {
    value = module.instancias_k8s.nodes_public_ip
}

output "nodes_private_ip" {
    value = module.instancias_k8s.nodes_private_ip
}