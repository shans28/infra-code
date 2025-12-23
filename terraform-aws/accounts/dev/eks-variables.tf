
#eks_cluster_apps
variable "eks_cluster_apps_enabled_cluster_log_types" {
  default     = ["audit"]
  type        = list(string)
  description = "List of the desired control plane logging to enable."
}

#*******Must change the cluster_name in tags If the cluster_name is changed******
variable "eks_cluster_apps_name" {
  default = "eks-dev-core-001-apps"
  type    = string
  description = "Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores"
}


variable "eks_cluster_apps_tags" {
  default     = null
  type        = map(string)
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "eks_cluster_apps_tags_all" {
  default     = null
  type        = map(string)
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

variable "eks_cluster_apps_version" {
  default     = "1.21"
  type        = string
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS."
}

#eks_cluster_apps_vpc_config
variable "eks_cluster_apps_vpc_config_endpoint_private_access" {
  default     = true
  type        = bool
  description = "Whether the Amazon EKS private API server endpoint is enabled"
}

variable "eks_cluster_apps_vpc_config_endpoint_public_access" {
  default     = true
  type        = bool
  description = "Whether the Amazon EKS public API server endpoint is enabled"
}



#eks_cluster_apps_kubernetes_network_config
variable "eks_cluster_apps_kubernetes_network_config_ip_family" {
  default     = "ipv4"
  type        = string
  description = "The IP family used to assign Kubernetes pod and service addresses. Valid values are ipv4 (default) and ipv6"
}

variable "eks_cluster_apps_kubernetes_network_config_service_ipv4_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks.Within one of the following private IP address blocks: 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16.Doesn't overlap with any CIDR block assigned to the VPC that you selected for VPC."
}

#eks_node_group_apps
variable "eks_node_group_apps_ami_type" {
  default     = "AL2_x86_64"
  type        = string
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group."
}

variable "eks_node_group_apps_capacity_type" {
  default     = "ON_DEMAND"
  type        = string
  description = "Type of capacity associated with the EKS Node Group."
}

variable "eks_node_group_apps_disk_size" {
  default     = 30
  type        = number
  description = "Disk size in GiB for worker nodes. Defaults to 20"
}

variable "eks_node_group_apps_force_update_version" {
  default     = false
  type        = bool
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
}

variable "eks_node_group_apps_instance_types" {
  default     = ["t3a.medium"]
  type        = list(string)
  description = "List of instance types associated with the EKS Node Group."
}

variable "eks_node_group_apps_name" {
  default     = "eks-node-group-dev-core-001-apps"
  type        = string
  description = "Name of the EKS Node Group."
}

variable "eks_node_group_apps_version" {
  default     = "1.20"
  type        = string
  description = "Kubernetes version. Defaults to EKS Cluster Kubernetes version. "
}

variable "eks_node_group_apps_remote_access_ec2_ssh_key" {
  default     = "eks-dev-core-001-apps-key-pair"
  type        = string
  description = "EC2 Key Pair name that provides access for SSH communication with the worker nodes in the EKS Node Group. If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group, port 22 on the worker nodes is opened to the Internet (0.0.0.0/0)"
}

variable "eks_node_group_apps_scaling_config_desired_size" {
  default     = 1
  type        = number
  description = "Desired number of worker nodes."
}
variable "eks_node_group_apps_scaling_config_max_size" {
  default     = 1
  type        = number
  description = "Maximum number of worker nodes."
}

variable "eks_node_group_apps_scaling_config_min_size" {
  default     = 1
  type        = number
  description = "Minimum number of worker nodes."
}

variable "eks_spot_node_group_apps_ami_type" {
  default     = "AL2_x86_64"
  type        = string
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group."
}

variable "eks_spot_node_group_apps_capacity_type" {
  default     = "SPOT"
  type        = string
  description = "Type of capacity associated with the EKS Node Group."
}

variable "eks_spot_node_group_apps_disk_size" {
  default     = 30
  type        = number
  description = "Disk size in GiB for worker nodes. Defaults to 20"
}

variable "eks_spot_node_group_apps_force_update_version" {
  default     = false
  type        = bool
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
}

variable "eks_spot_node_group_apps_instance_types" {
  default     = ["t3a.medium","t3.medium"]
  type        = list(string)
  description = "List of instance types associated with the EKS Node Group."
}

variable "eks_spot_node_group_apps_name" {
  default     = "eks-node-group-dev-core-001-apps-spot-instances"
  type        = string
  description = "Name of the EKS Node Group."
}

variable "eks_spot_node_group_apps_version" {
  default     = "1.20"
  type        = string
  description = "Kubernetes version. Defaults to EKS Cluster Kubernetes version. "
}

variable "eks_spot_node_group_apps_remote_access_ec2_ssh_key" {
  default     = "eks-dev-core-001-apps-key-pair"
  type        = string
  description = "EC2 Key Pair name that provides access for SSH communication with the worker nodes in the EKS Node Group. If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group, port 22 on the worker nodes is opened to the Internet (0.0.0.0/0)"
}

variable "eks_spot_node_group_apps_scaling_config_desired_size" {
  default     = 2
  type        = number
  description = "Desired number of worker nodes."
}
variable "eks_spot_node_group_apps_scaling_config_max_size" {
  default     = 7
  type        = number
  description = "Maximum number of worker nodes."
}

variable "eks_spot_node_group_apps_scaling_config_min_size" {
  default     = 1
  type        = number
  description = "Minimum number of worker nodes."
}
variable "eks_node_group_apps_spot_tag_key" {
  default     = "Name"
  type        = string
  description = "Name of the EKS Cluster"
}  
variable "eks_node_group_apps_spot_tag_value" {
  default     = "eks_worker_node_spot"
  type        = string
  description = "Name of the EKS Cluster"
}  
