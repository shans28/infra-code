module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.6.0"
  #   region = "us-west-2"
  name                         = var.vpc_name
  create_vpc                   = var.create_vpc
  cidr                         = local.vpc_cidr
  azs                          = local.azs
  enable_ipv6                  = var.create_vpc
  enable_nat_gateway           = var.enable_nat_gateway
  single_nat_gateway           = var.single_nat_gateway
  one_nat_gateway_per_az       = var.one_nat_gateway_per_az
  create_database_subnet_group = var.create_database_subnet_group
  private_subnets              = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k + 10)]
  public_subnets               = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  tags                         = local.tags
}