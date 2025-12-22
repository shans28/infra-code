
module "eks_cluster_apps" {
  source = "../../modules/eks"

  eks_cluster_enabled_cluster_log_types = var.eks_cluster_apps_enabled_cluster_log_types
  eks_cluster_name                      = var.eks_cluster_apps_name
  eks_cluster_role_arn                  = aws_iam_role.eks_cluster_apps_role.arn
  eks_cluster_tags                      = var.eks_cluster_apps_tags
  eks_cluster_tags_all                  = var.eks_cluster_apps_tags_all
  eks_cluster_version                   = var.eks_cluster_apps_version

  #vpc_config 
  eks_cluster_vpc_config_endpoint_private_access = var.eks_cluster_apps_vpc_config_endpoint_private_access 
  eks_cluster_vpc_config_endpoint_public_access  = var.eks_cluster_apps_vpc_config_endpoint_public_access
  eks_cluster_vpc_config_subnet_id               = module.eks_cluster_apps_private_subnets.*.subnet_id
  
  #kubernetes_network_config 
  eks_cluster_kubernetes_network_config_ip_family               = var.eks_cluster_apps_kubernetes_network_config_ip_family 
  eks_cluster_kubernetes_network_config_service_ipv4_cidr       = var.eks_cluster_apps_kubernetes_network_config_service_ipv4_cidr   
  depends_on = [
    aws_iam_role.eks_cluster_apps_role,
    module.eks_cluster_apps_private_subnets,
  ]
}
/*
module "eks_node_group_apps" {
  source = "../../modules/eks_node_group"

  eks_node_group_ami_type             = var.eks_node_group_apps_ami_type
  eks_node_group_capacity_type        = var.eks_node_group_apps_capacity_type
  eks_node_group_cluster_name         = var.eks_cluster_apps_name
  eks_node_group_disk_size            = var.eks_node_group_apps_disk_size
  eks_node_group_force_update_version = var.eks_node_group_apps_force_update_version
  eks_node_group_instance_types       = var.eks_node_group_apps_instance_types
  eks_node_group_name                 = var.eks_node_group_apps_name
  eks_node_group_role_arn             = aws_iam_role.eks_node_groups_apps_role.arn
  eks_node_group_subnet_ids           = module.eks_cluster_apps_private_subnets.*.subnet_id
  eks_node_group_version              = var.eks_node_group_apps_version  

  eks_node_group_tags                 = {
    "k8s.io/cluster-autoscaler/enabled"                      = "TRUE"
    "k8s.io/cluster-autoscaler/${var.eks_cluster_apps_name}" = "owned"
  }
  
  #remote_access
  eks_node_group_remote_access_ec2_ssh_key = var.eks_node_group_apps_remote_access_ec2_ssh_key
  eks_node_group_source_security_group_ids = [module.eks_cluster_apps.security_group_id]
   
  #scaling_config 
  eks_node_group_scaling_config_desired_size = var.eks_node_group_apps_scaling_config_desired_size
  eks_node_group_scaling_config_max_size     = var.eks_node_group_apps_scaling_config_max_size
  eks_node_group_scaling_config_min_size     = var.eks_node_group_apps_scaling_config_min_size
  
  depends_on = [
    module.eks_cluster_apps,
    aws_iam_role.eks_node_groups_apps_role
  ]
}*/

module "eks_spot_node_group_apps" {
  source = "../../modules/eks_node_group"

  eks_node_group_ami_type             = var.eks_spot_node_group_apps_ami_type
  eks_node_group_capacity_type        = var.eks_spot_node_group_apps_capacity_type
  eks_node_group_cluster_name         = var.eks_cluster_apps_name
  eks_node_group_disk_size            = var.eks_spot_node_group_apps_disk_size
  eks_node_group_force_update_version = var.eks_spot_node_group_apps_force_update_version
  eks_node_group_instance_types       = var.eks_spot_node_group_apps_instance_types
  eks_node_group_name                 = var.eks_spot_node_group_apps_name
  eks_node_group_role_arn             = aws_iam_role.eks_node_groups_apps_role.arn
  eks_node_group_subnet_ids           = module.eks_cluster_apps_private_subnets.*.subnet_id
  eks_node_group_version              = var.eks_spot_node_group_apps_version  

  eks_node_group_tags                 = {
    "k8s.io/cluster-autoscaler/enabled"                      = "TRUE"
    "k8s.io/cluster-autoscaler/${var.eks_cluster_apps_name}" = "owned"
  }
  
  tag_key   = var.eks_node_group_apps_spot_tag_key
  tag_value = var.eks_node_group_apps_spot_tag_value
  #remote_access
  eks_node_group_remote_access_ec2_ssh_key = var.eks_spot_node_group_apps_remote_access_ec2_ssh_key
  eks_node_group_source_security_group_ids = [module.eks_cluster_apps.security_group_id]
   
  #scaling_config 
  eks_node_group_scaling_config_desired_size = var.eks_spot_node_group_apps_scaling_config_desired_size
  eks_node_group_scaling_config_max_size     = var.eks_spot_node_group_apps_scaling_config_max_size
  eks_node_group_scaling_config_min_size     = var.eks_spot_node_group_apps_scaling_config_min_size
  
  depends_on = [
    module.eks_cluster_apps,
    aws_iam_role.eks_node_groups_apps_role
  ]
}



