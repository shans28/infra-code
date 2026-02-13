variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}
variable "create_vpc" {
  description = "Check if VPC creation required"
  type        = bool

}
variable "enable_nat_gateway" {
  description = "provision NAT Gateways for each of your private networks"
  type        = bool
}
variable "single_nat_gateway" {
  description = "single shared NAT Gateway across all of your private networks"
  type        = bool

}
variable "one_nat_gateway_per_az" {
  description = "only one NAT Gateway per availability zone"
  type        = bool
}

variable "create_database_subnet_group" {
  description = "database subnet group will be  created"
  type        = bool
}
variable "enable_ipv6" {
  description = "IPv6 CIDR block for VPC"
  type        = bool
}