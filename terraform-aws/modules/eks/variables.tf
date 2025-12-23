#eks_cluster 
variable "eks_cluster_enabled_cluster_log_types" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list(string)
  description = "List of the desired control plane logging to enable."
}

#*******Must change the cluster_name in tags If the cluster_name is changed******
variable "eks_cluster_name" {
  default = null
  type    = string
  description = "Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores"
}

variable "eks_cluster_role_arn" {
  default = null
  type    = string
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
}

variable "eks_cluster_tags" {
  default     = null
  type        = map(string)
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "eks_cluster_tags_all" {
  default     = null
  type        = map(string)
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

variable "eks_cluster_version" {
  default     = null
  type        = string
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS."
}

#eks_cluster_vpc_config
variable "eks_cluster_vpc_config_endpoint_private_access" {
  default     = true
  type        = bool
  description = "Whether the Amazon EKS private API server endpoint is enabled"
}

variable "eks_cluster_vpc_config_endpoint_public_access" {
  default     = false
  type        = bool
  description = "Whether the Amazon EKS public API server endpoint is enabled"
}

variable "eks_cluster_vpc_config_subnet_id" {
  default     = null
  type        = list(string)
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
}

#eks_cluster_kubernetes_network_config
variable "eks_cluster_kubernetes_network_config_ip_family" {
  default     = "ipv4"
  type        = string
  description = "The IP family used to assign Kubernetes pod and service addresses. Valid values are ipv4 (default) and ipv6"
}

variable "eks_cluster_kubernetes_network_config_service_ipv4_cidr" {
  default     = null
  type        = string
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks.Within one of the following private IP address blocks: 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16.Doesn't overlap with any CIDR block assigned to the VPC that you selected for VPC."
}
 variable "cluster_addons" {
  description = "Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name`"
  type        = any
  default     = {}
}

variable "create" {
  description = "Controls if EKS resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}