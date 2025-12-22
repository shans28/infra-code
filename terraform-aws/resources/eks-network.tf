#data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "tls_certificate" "eks_cluster_apps_certificate" {
  depends_on = [module.eks_cluster_apps]
  url        = module.eks_cluster_apps.identity_oidc
}
# Create public subnets
module "eks_cluster_apps_public_subnets" {

  source = "../../modules/subnet"

  count                            = var.eks_cluster_apps_public_subnets_count   
  vpc_id                           = var.eks_cluster_apps_vpc_id
  subnets_cidr_block               = element(var.eks_cluster_apps_public_subnets_cidr_block, count.index)
  availability_zone                = element(var.eks_cluster_apps_availability_zone, count.index)
  subnets_map_public_ip_on_launch = var.eks_cluster_apps_subnets_map_public_ip_on_launch   
  subnets_tags = merge(
    {
      "Name"                                               = "${var.eks_cluster_apps_name}-public-subnet-${count.index + 1}"
      "kubernetes.io/cluster/${var.eks_cluster_apps_name}" = "shared"
      "kubernetes.io/role/elb"                             = 1
    }
  )
}

# Create private subnets
module "eks_cluster_apps_private_subnets" {
  source = "../../modules/subnet"

  count                             = var.eks_cluster_apps_private_subnets_count   
  vpc_id                            = var.eks_cluster_apps_vpc_id
  subnets_cidr_block                = element(var.eks_cluster_apps_private_subnets_cidr_block, count.index)
  availability_zone                 = element(var.eks_cluster_apps_availability_zone, count.index)
  subnets_tags = merge(
    {
      "Name"                                               = "${var.eks_cluster_apps_name}-private-subnet-${count.index + 1}"
      "kubernetes.io/cluster/${var.eks_cluster_apps_name}" = "shared"
      "kubernetes.io/role/internal-elb"                    = 1
    }
  )
}

# Create Elastic IP

module "eks_cluster_apps_nat_eip" {

  source = "../../modules/eip"

  eip_vpc   = var.eks_cluster_apps_nat_eip_vpc 
  eip_tags =  merge({
    Name                  = "${var.eks_cluster_apps_name}-nat-elastic-ip"
  })
}


# Create NAT Gateway

module "eks_cluster_apps_nat_gateway" {

  source = "../../modules/nat_gateway"

  allocation_id    = module.eks_cluster_apps_nat_eip.eip_id
  subnet_id        = element(module.eks_cluster_apps_public_subnets.*.subnet_id, 0)
  nat_gateway_tags =  merge({
    Name           = "${var.eks_cluster_apps_name}-nat-gateway"
  })
  depends_on = [
    module.eks_cluster_apps_public_subnets,
    module.eks_cluster_apps_nat_eip
  ]

}



# Create Public route table

module "eks_cluster_apps_public_route_table" {

  source = "../../modules/route_table/route_table"

  vpc_id = var.eks_cluster_apps_vpc_id
  route_table_tags =  {
    Name                  = "${var.eks_cluster_apps_name}-public-route-table"
  }  
}


# Attach public subnets to the public route table

module "eks_cluster_apps_public_route_table_association" {

  source = "../../modules/route_table/route_table_association"

  count          = var.eks_cluster_apps_public_route_table_association_count     
  subnet_id      = element(module.eks_cluster_apps_public_subnets.*.subnet_id, count.index)
  route_table_id = module.eks_cluster_apps_public_route_table.route_table_id
  depends_on = [
    module.eks_cluster_apps_public_subnets,
    module.eks_cluster_apps_public_route_table
  ]
}

# add ip to the public route table

module "eks_cluster_apps_public_internet_gateway" {

  source = "../../modules/route_table/route"

  route_table_id         = module.eks_cluster_apps_public_route_table.route_table_id
  destination_cidr_block = var.eks_cluster_apps_public_internet_gateway_destination_cidr_block   
  internet_gateway_id    = var.eks_cluster_apps_igw_id
  depends_on = [
    module.eks_cluster_apps_public_route_table
  ]
}

# Create Private route table

module "eks_cluster_apps_private_route_table" {

  source = "../../modules/route_table/route_table"

  count  = var.eks_cluster_apps_private_route_table_count     
  vpc_id = var.eks_cluster_apps_vpc_id
  route_table_tags =merge({
    Name                  = "${var.eks_cluster_apps_name}-private-route-table-${count.index + 1}"
  }) 
}

# Attach private subnets

module "eks_cluster_apps_private_route_table_association" {

  source = "../../modules/route_table/route_table_association"

  count          = var.eks_cluster_apps_private_route_table_association_count   
  subnet_id      = element(module.eks_cluster_apps_private_subnets.*.subnet_id, count.index)
  route_table_id = element(module.eks_cluster_apps_private_route_table.*.route_table_id, count.index)
  depends_on = [
    module.eks_cluster_apps_private_subnets,
    module.eks_cluster_apps_private_route_table
  ]
}

# add ip to the private route table

module "eks_cluster_apps_private_nat_gateway" {

  source = "../../modules/route_table/route"

  count          = var.eks_cluster_apps_private_nat_gateway_count
  route_table_id = element(module.eks_cluster_apps_private_route_table.*.route_table_id, count.index)
  destination_cidr_block = var.eks_cluster_apps_private_nat_gateway_destination_cidr_block  
  gateway_id         = module.eks_cluster_apps_nat_gateway.nat_gateway_id
  depends_on = [
    module.eks_cluster_apps_nat_gateway,
    module.eks_cluster_apps_private_route_table
  ]
}

/*
#security group
module "eks_cluster_apps_load_balancer_security_group" {

  source = "../../modules/security_group"

  description              = var.eks_cluster_apps_load_balancer_security_group_description
  egress_cidr_blocks       = var.eks_cluster_apps_load_balancer_security_group_egress_cidr_blocks
  egress_description       = var.eks_cluster_apps_load_balancer_security_group_egress_description
  egress_from_port         = var.eks_cluster_apps_load_balancer_security_group_egress_from_port
  egress_ipv6_cidr_blocks  = var.eks_cluster_apps_load_balancer_security_group_egress_ipv6_cidr_blocks
  egress_prefix_list_ids   = var.eks_cluster_apps_load_balancer_security_group_egress_prefix_list_ids
  egress_protocol          = var.eks_cluster_apps_load_balancer_security_group_egress_protocol
  egress_security_groups   = var.eks_cluster_apps_load_balancer_security_group_egress_security_groups
  egress_self              = var.eks_cluster_apps_load_balancer_security_group_egress_self
  egress_to_port           = var.eks_cluster_apps_load_balancer_security_group_egress_to_port
  ingress_cidr_blocks      = var.eks_cluster_apps_load_balancer_security_group_ingress_cidr_blocks
  ingress_description      = var.eks_cluster_apps_load_balancer_security_group_ingress_description
  ingress_from_port        = var.eks_cluster_apps_load_balancer_security_group_ingress_from_port
  ingress_ipv6_cidr_blocks = var.eks_cluster_apps_load_balancer_security_group_ingress_ipv6_cidr_blocks
  ingress_prefix_list_ids  = var.eks_cluster_apps_load_balancer_security_group_ingress_prefix_list_ids
  ingress_protocol         = var.eks_cluster_apps_load_balancer_security_group_ingress_protocol
  ingress_security_groups  = var.eks_cluster_apps_load_balancer_security_group_ingress_security_groups
  ingress_self             = var.eks_cluster_apps_load_balancer_security_group_ingress_self
  ingress_to_port          = var.eks_cluster_apps_load_balancer_security_group_ingress_to_port
  name                     = var.eks_cluster_apps_load_balancer_security_group_name
  tags                     = merge({
        "elbv2.k8s.aws/cluster"    = "eks-dev-core-001-apps"
        "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
        "ingress.k8s.aws/stack"    = "prj1-apps"
    })
  tags_all                 = merge({
        "elbv2.k8s.aws/cluster"    = "eks-dev-core-001-apps"
        "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
        "ingress.k8s.aws/stack"    = "prj1-apps"
    })
  vpc_id                   = var.eks_cluster_apps_vpc_id
}
*/

#security_group_rule
module "eks_cluster_apps_security_group_rule_allow_vpc_ingress_to_cluster" {

  source = "../../modules/security_group_rule"

  type              = var.eks_cluster_apps_security_group_rule_type       
  from_port         = var.eks_cluster_apps_security_group_rule_from_port    
  to_port           = var.eks_cluster_apps_security_group_rule_to_port    
  protocol          = var.eks_cluster_apps_security_group_rule_protocol    
  cidr_blocks       = var.eks_cluster_apps_vpc_cidr
  security_group_id = module.eks_cluster_apps.security_group_id
  depends_on = [
    module.eks_cluster_apps  
    ]
}
 

#oidc
module "eks_cluster_apps_oidc_connect" {
  
  source = "../../modules/oidc"

  client_id_list  = var.eks_cluster_apps_client_id_list
  thumbprint_list = [data.tls_certificate.eks_cluster_apps_certificate.certificates.0.sha1_fingerprint]
  url             = module.eks_cluster_apps.identity_oidc
  depends_on = [
    module.eks_cluster_apps_security_group_rule_allow_vpc_ingress_to_cluster
  ]
}







