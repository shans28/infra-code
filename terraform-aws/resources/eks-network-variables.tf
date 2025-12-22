#eks_apps
#network

variable "eks_cluster_apps_vpc_id" {
  default     = "vpc-062be58b7c208deb8"
  type        = string
  description = "The ID of the VPC in which eks to be created"
}

variable "eks_cluster_apps_availability_zone" {
  default     = ["ap-south-1a","ap-south-1b","ap-south-1c"]
  type        = list(string)
  description = " Availabilitty zone for the subnet in the vpc."
}

variable "eks_cluster_apps_vpc_cidr" {
  default     = ["192.168.0.0/16"]
  type        = list(string)
  description = "The IPv4 CIDR block for the VPC in which eks to be created."
}

variable "eks_cluster_apps_igw_id" {
  default     = "igw-0828dc09e9d3489e4"
  type        = string
  description = "The ID of the Internet Gateway."
}


#public_subnets
variable "eks_cluster_apps_public_subnets_count" {
  default     = 2 
  type        = number
  description = " The Number of public subnets need to be created  "
}

variable "eks_cluster_apps_public_subnets_cidr_block" {
  default     = ["192.168.210.0/24", "192.168.211.0/24"]
  type        = list(string)
  description = "The IPv4 CIDR block for the public subnet."
}

variable "eks_cluster_apps_subnets_map_public_ip_on_launch" {
  default     = true
  type        = bool
  description = " Specify true to indicate that network interfaces created in the public subnet should be assigned a customer owned IP address."
}

# Create private subnets
variable "eks_cluster_apps_private_subnets_count" {
  default     = 3
  type        = number
  description = " The Number of prvate subnets need to be created  "
}

variable "eks_cluster_apps_private_subnets_cidr_block" {
  default     = ["192.168.192.0/20","192.168.208.0/24","192.168.209.0/24"]
  type        = list(string)
  description = "The IPv4 CIDR block for the private subnet."
}

# Create Elastic IP
variable "eks_cluster_apps_nat_eip_vpc" {
  default     = true
  type        = bool
  description = "The ID of the Internet Gateway."
}

# Attach public subnets to the public route table
variable "eks_cluster_apps_public_route_table_association_count" {
  default     = 2
  type        = number
  description = "The Number of public route table association need to be created"
}


# add ip to the public route table

variable "eks_cluster_apps_public_internet_gateway_destination_cidr_block" {
  default     = "0.0.0.0/0"
  type        = string
  description = "The destination CIDR block."
}


# Create Private route table
variable "eks_cluster_apps_private_route_table_count" {
  default     = 3
  type        = number
  description = "The Number of private route table subnets need to be created "
}

# Attach private subnets
variable "eks_cluster_apps_private_route_table_association_count" {
  default     = 3
  type        = number
  description = "The Number of private route table association need to be created "
}

# add ip to the private route table
variable "eks_cluster_apps_private_nat_gateway_destination_cidr_block" {
  default     = "0.0.0.0/0"
  type        = string
  description = "The destination CIDR block."
}

variable "eks_cluster_apps_private_nat_gateway_count" {
  default     = 3
  type        = number
  description = "The Number of private route table association need to be created "
}

#security_group_rule
variable "eks_cluster_apps_security_group_rule_type" {
  default     = "ingress"
  type        = string
  description = "Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "eks_cluster_apps_security_group_rule_from_port" {
  default     = 0
  type        = number
  description = "Start port"
}

variable "eks_cluster_apps_security_group_rule_to_port" {
  default     = 0
  type        = number
  description = "End port"
}

variable "eks_cluster_apps_security_group_rule_protocol" {
  default     = "-1"
  type        = string
  description = "Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
}

#oidc
variable "eks_cluster_apps_client_id_list" {
  default        = ["sts.amazonaws.com"]
  type           = list(string)
  description = "When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application." 
}