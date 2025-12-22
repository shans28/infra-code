/*data "aws_secretsmanager_secret" "by_arn" {
  arn = var.arn_secretmanager 
}

data "aws_secretsmanager_secret_version" "rds_secret" {
  secret_id = data.aws_secretsmanager_secret.by_arn.id

}*/
resource "aws_db_instance" "rds" {

  
  allocated_storage                     = var.rds_allocated_storage
  allow_major_version_upgrade           = var.rds_allow_major_version_upgrade
  auto_minor_version_upgrade            = var.rds_auto_minor_version_upgrade
  apply_immediately                     = var.rds_apply_immediately
  availability_zone                     = var.rds_availability_zone
  backup_retention_period               = var.rds_backup_retention_period
  backup_window                         = var.rds_backup_window
  ca_cert_identifier                    = var.rds_ca_cert_identifier
  character_set_name                    = var.rds_character_set_name
  copy_tags_to_snapshot                 = var.rds_copy_tags_to_snapshot
  customer_owned_ip_enabled             = var.rds_customer_owned_ip_enabled
  db_name                               = var.rds_name
  db_subnet_group_name                  = var.db_subnet_group_name
  delete_automated_backups              = var.rds_delete_automated_backups
  deletion_protection                   = var.rds_deletion_protection
  domain                                = var.rds_domain
  domain_iam_role_name                  = var.rds_domain_iam_role_name
  enabled_cloudwatch_logs_exports       = var.rds_enabled_cloudwatch_logs_exports
  engine                                = var.rds_engine
  engine_version                        = var.rds_engine_version
  final_snapshot_identifier             = var.rds_final_snapshot_identifier
  iam_database_authentication_enabled   = var.rds_iam_database_authentication_enabled
  identifier                            = var.rds_identifier
  identifier_prefix                     = var.rds_identifier_prefix
  instance_class                        = var.rds_instance_class
  iops                                  = var.rds_iops
  #latest_restorable_time                = var.rds_latest_restorable_time
  license_model                         = var.rds_license_model
  kms_key_id                            = var.rds_kms_key_id
  maintenance_window                    = var.rds_maintenance_window
  max_allocated_storage                 = var.rds_max_allocated_storage
  monitoring_role_arn                   = var.rds_monitoring_role_arn
  monitoring_interval                   = var.rds_monitoring_interval
  multi_az                              = var.multi_az
  nchar_character_set_name              = var.rds_nchar_character_set_name
  option_group_name                     = var.option_group
  parameter_group_name                  = var.parameter_group_name_id
  password                              = var.rds_password
  performance_insights_enabled          = var.rds_performance_insights_enabled
  performance_insights_kms_key_id       = var.rds_performance_insights_kms_key_id
  performance_insights_retention_period = var.rds_performance_insights_retention_period
  port                                  = var.rds_port
  publicly_accessible                   = var.rds_publicly_accessible
  #replicas                              = var.rds_replicas
  replicate_source_db                   = var.rds_replicate_source_db
  skip_final_snapshot                   = var.rds_skip_final_snapshot
  snapshot_identifier                   = var.rds_snapshot_identifier
  storage_encrypted                     = var.rds_storage_encrypted
  storage_type                          = var.rds_storage_type
  tags                                  = var.rds_tags
  tags_all                              = var.rds_tags_all
  timezone                              = var.rds_timezone
  username                              = var.rds_username
  vpc_security_group_ids                = var.security_groupid
}
