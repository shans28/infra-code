output "eks_cluster_apps_role" {
  value = aws_iam_role.eks_cluster_apps_role.arn
}
output "cp_lambda_deployeks_cluster_apps_alb_role" {
  value = aws_iam_role.eks_cluster_apps_alb_role.arn
}
