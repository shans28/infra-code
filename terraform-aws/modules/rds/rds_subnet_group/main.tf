resource "aws_db_subnet_group" "rds" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids
  tags        = var.subnet_tags
  tags_all    = var.subnet_tags_all
  name_prefix = var.name_prefix
}
