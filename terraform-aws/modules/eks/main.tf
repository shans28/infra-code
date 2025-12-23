resource "aws_eks_cluster" "eks_cluster" {
  enabled_cluster_log_types = var.eks_cluster_enabled_cluster_log_types
  name                      = var.eks_cluster_name
  role_arn                  = var.eks_cluster_role_arn 
  tags                      = var.eks_cluster_tags
  tags_all                  = var.eks_cluster_tags_all
  version                   = var.eks_cluster_version

  vpc_config {
    endpoint_private_access = var.eks_cluster_vpc_config_endpoint_private_access 
    endpoint_public_access  = var.eks_cluster_vpc_config_endpoint_public_access
    subnet_ids              = var.eks_cluster_vpc_config_subnet_id
  }

  kubernetes_network_config {
    ip_family         = var.eks_cluster_kubernetes_network_config_ip_family 
    service_ipv4_cidr = var.eks_cluster_kubernetes_network_config_service_ipv4_cidr 
  }
  /*lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }*/

}
locals {
  create = var.create
}

resource "aws_eks_addon" "this" {
  for_each = { for k, v in var.cluster_addons : k => v if local.create }

  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = try(each.value.name, each.key)

  addon_version            		= lookup(each.value, "addon_version", null)
  resolve_conflicts_on_create   = lookup(each.value, "resolve_conflicts", null)
  service_account_role_arn    = lookup(each.value, "service_account_role_arn", null)

  tags = var.eks_cluster_tags
}