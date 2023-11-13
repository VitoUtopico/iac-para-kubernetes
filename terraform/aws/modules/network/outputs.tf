# VPC
output "cluster_vpc_id" {
  value = aws_vpc.cluster_vpc.id
}

# Subnets
output "subnet_a_id" {
  value = aws_subnet.public_subnet_a.id
}

output "subnet_b_id" {
  value = aws_subnet.public_subnet_b.id
}