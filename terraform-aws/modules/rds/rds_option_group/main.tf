
resource "aws_db_option_group" "rds" {

  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version
  name                     = var.name
  name_prefix              = var.name_prefix
  option_group_description = var.description
  tags                     = var.option_tags
  tags_all                 = var.option_tags_all

}
