locals {
  self_managed_node_groups = {
    system_ng = {
      name                 = "system"
      instance_type        = "t3.small"
      desired_size         = 1
      min_size             = 1
      max_size             = 3
      ami_id               = data.aws_ssm_parameter.eks_ami.value
      bootstrap_extra_args = "--max-pods=40"
      taints = {
        system = {
          key    = "node-role"
          value  = "system"
          effect = "NO_SCHEDULE"
        }
      }
      labels = {
        nodegroup = "system"
        workload  = "management"
      }
      tags = {
        system = "yes"
      }
    }
  }

  access_entries = {
    super_user = {
      principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ROLE-PHC-${var.aws_account_name}-AWSPWUSR"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}
 