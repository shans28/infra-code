output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}
output "subnet_id" {
  value       = module.vpc.private_subnets
  description = "ID of subnets in VPC"
}