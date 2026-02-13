module "aws_tmp_storage" {
  source                          = "./modules/fsx-module"
  fsx_name                        = var.tmp_stg_fsx_name
  storage_type                    = var.tmp_stg_storage_type
  deployment_type                 = var.tmp_stg_deployment_type
  per_unit_storage_throughput     = var.tmp_stg_per_unit_storage_throughput
  storage_capacity                = var.tmp_stg_storage_capacity
  subnet_ids                      = data.terraform_remote_state.networking.outputs.private_subnets
  security_group_ids              = var.tmp_stg_security_group_ids
  tags                            = merge({ "Name" = var.tmp_stg_fsx_name }, local.tags)
}
