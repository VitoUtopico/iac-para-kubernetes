output "cluster_key_name" {
    value = aws_key_pair.cluster_key.key_name
}

output "kubernetes_security_group_ids" {
  value = aws_security_group.kubernetes.id
}