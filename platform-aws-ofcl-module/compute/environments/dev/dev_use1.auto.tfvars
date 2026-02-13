eks_cluster_name                                   = "apps-cluster-01"
eks_cluster_deletion_protection                    = false
eks_cluster_dataplane_wait_duration                = "10m"
eks_cluster_cloudwatch_log_group_class             = "STANDARD"
eks_cluster_cloudwatch_log_group_retention_in_days = 60
eks_cluster_version                                = "1.31"
aws_account_name                                   = "apps-dev"
networking_state_key                               = "networking.tfstate"