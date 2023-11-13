variable "control_plane_instance_count" {
    description = "Número de instâncias control plane desejado"
}

variable "nodes_instance_count" {
    description = "Número de instâncias node"
}

variable "kubernetes_control_plane_instance_type" {
    description = "Tipo de instância do Kubernetes control plane"
}

variable "kubernetes_nodes_instance_type" {
    description = "Tipo de instância do Kubernetes node"
}

variable "ami_x64" {
    description = "Ubuntu 22.04 LTS AMD64 AMI"
}

variable "ami_arm64" {
    description = "Ubuntu 22.04 LTS arm64 AMI"
}

variable "key_name" {
    description = "Cluster Key name"
}

variable "subnet_a_id" {
    description = "Subnet A ID"  
}

variable "subnet_b_id" {
    description = "Subnet B ID"  
}

variable "sg" {
    description = "Security Group ID do cluster Kubernetes"    
}