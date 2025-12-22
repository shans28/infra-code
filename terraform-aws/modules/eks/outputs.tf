output "security_group_id" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  description = "security group id for the cluster "
}

output "identity_oidc" {
  value = aws_eks_cluster.eks_cluster.identity.0.oidc.0.issuer
  description = "oidc for the cluster "
}
output "name" {
  value = aws_eks_cluster.eks_cluster.name
}