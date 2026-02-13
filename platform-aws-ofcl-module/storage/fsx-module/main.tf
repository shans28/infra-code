resource "aws_fsx_lustre_file_system" "this" {
  storage_capacity    = var.storage_capacity
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
  deployment_type     = var.deployment_type
  per_unit_storage_throughput = var.per_unit_storage_throughput

  tags = merge(
    var.tags,
    {
      "Name" = var.fsx_name,
    })
}
