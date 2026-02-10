output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "cluster_name" {
  value = module.eks.cluster_name
}
output "oidc_provider" {
  value = module.eks.oidc_provider
}
output "node_iam_role_arn" {
    value = module.eks.node_iam_role_arn
}