

resource "aws_db_parameter_group" "rds" {

  name        = var.name
  description = var.description
  family      = var.family
  tags        = var.parameter_tags
  tags_all    = var.parameter_tags_all
  name_prefix = var.name_prefix

}
