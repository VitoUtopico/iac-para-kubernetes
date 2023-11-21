module "instancias_k8s" {
  source = "./modules/instancias_k8s"

  control_plane_instance_count = 1
  nodes_instance_count = 1
  kubernetes_control_plane_instance_type = "t2.medium"
  kubernetes_nodes_instance_type = "t2.medium"
  # kubernetes_control_plane_instance_type = "t2.nano"
  # kubernetes_nodes_instance_type = "t2.nano"
  ami_x64 = "ami-0c38efb4f5f15205f"
  ami_arm64 = "ami-09177003832581ac1"
  
  key_name = module.security.cluster_key_name
  subnet_a_id = module.network.subnet_a_id
  subnet_b_id = module.network.subnet_b_id
  sg = module.security.kubernetes_security_group_ids
}

module "security" {
  source = "./modules/security"

  cluster_vpc_id = module.network.cluster_vpc_id
}

module "network" {
  source = "./modules/network"

  aws_region = var.aws_region
}