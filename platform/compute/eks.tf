module "eks" {
  source                                 = "terraform-aws-modules/eks/aws"
  version                                = "~>21.0"
  name                                   = var.eks_cluster_name
  region                                 = var.region
  deletion_protection                    = var.eks_cluster_deletion_protection
  dataplane_wait_duration                = var.eks_cluster_dataplane_wait_duration
  cloudwatch_log_group_class             = var.eks_cluster_cloudwatch_log_group_class
  cloudwatch_log_group_retention_in_days = var.eks_cluster_cloudwatch_log_group_retention_in_days
  kubernetes_version                     = var.eks_cluster_version
  # vpc_id                                 = data.terraform_remote_state.networking.outputs.vpc_id
  # subnet_ids                             = data.terraform_remote_state.networking.outputs.private_subnets
  vpc_id                                 = "vpc-0b471fd504ce56640"
  subnet_ids                             = ["subnet-012294d58ff163611", "subnet-03b1b1975a1eb4697"]
  self_managed_node_groups               = local.self_managed_node_groups
  access_entries                         = local.access_entries
}
