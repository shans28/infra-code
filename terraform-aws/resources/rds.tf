
module "rds_subnet_group" {
  source = "../../modules/rds/rds_subnet_group"

  description     = var.subnet_description
  name            = var.subnet_name
  name_prefix     = var.subnet_name_prefix
  subnet_ids      = var.subnet_ids
  subnet_tags     = var.db_subnet_tags
  subnet_tags_all = var.db_subnet_tags_all

}

module "rds_instance_dev" {
  source                                    = "../../modules/rds/rds_instance"
  
  arn_secretmanager                         = module.secret_manager_dev_db.arn  #var.rds_dev_db_secretmanager
  db_subnet_group_name                      = module.rds_subnet_group.db_subnet_group_id
  multi_az                                  = var.rds_dev_db_multi_az
  option_group                              = var.rds_dev_db_option_group_id                #module.rds_option_group.rds_dev_db_option_group_id
  parameter_group_name_id                   = var.rds_dev_db_parameter_group_id          #module.rds_parameter_group.rds_dev_db_parameter_group_id
  rds_allocated_storage                     = var.rds_dev_db_allocated_storage
  rds_auto_minor_version_upgrade            = var.rds_dev_db_auto_minor_version_upgrade
  rds_allow_major_version_upgrade           = var.rds_dev_db_allow_major_version_upgrade
  rds_apply_immediately                     = var.rds_dev_db_apply_immediately
  rds_availability_zone                     = var.rds_dev_db_availability_zone
  rds_backup_retention_period               = var.rds_dev_db_backup_retention_period
  rds_backup_window                         = var.rds_dev_db_backup_window
  rds_ca_cert_identifier                    = var.rds_dev_db_ca_cert_identifier
  rds_character_set_name                    = var.rds_dev_db_character_set_name
  rds_copy_tags_to_snapshot                 = var.rds_dev_db_copy_tags_to_snapshot
  rds_customer_owned_ip_enabled             = var.rds_dev_db_customer_owned_ip_enabled
  rds_delete_automated_backups              = var.rds_dev_db_delete_automated_backups
  rds_deletion_protection                   = var.rds_dev_db_deletion_protection
  rds_domain                                = var.rds_dev_db_domain
  rds_domain_iam_role_name                  = var.rds_dev_db_domain_iam_role_name
  rds_enabled_cloudwatch_logs_exports       = var.rds_dev_db_enabled_cloudwatch_logs_exports
  rds_engine                                = var.rds_dev_db_engine
  rds_engine_version                        = var.rds_dev_db_engine_version
  rds_final_snapshot_identifier             = var.rds_dev_db_final_snapshot_identifier
  rds_iam_database_authentication_enabled   = var.rds_dev_db_iam_database_authentication_enabled
  rds_identifier                            = var.rds_dev_db_identifier
  rds_identifier_prefix                     = var.rds_dev_db_identifier_prefix
  rds_instance_class                        = var.rds_dev_db_instance_class
  rds_iops                                  = var.rds_dev_db_iops
  #rds_lards_test_db_restorable_time                = var.rds_dev_db_lards_test_db_restorable_time
  rds_license_model                         = var.rds_dev_db_license_model
  rds_kms_key_id                            = var.rds_dev_db_kms_key_id
  rds_maintenance_window                    = var.rds_dev_db_maintenance_window
  rds_max_allocated_storage                 = var.rds_dev_db_max_allocated_storage
  rds_monitoring_role_arn                   = var.rds_dev_db_monitoring_role_arn
  rds_monitoring_interval                   = var.rds_dev_db_monitoring_interval
  rds_name                                  = var.rds_dev_db_instance_name
  rds_nchar_character_set_name              = var.rds_dev_db_nchar_character_set_name
  rds_password                              = module.rds_dev_db_random_password.password
  rds_performance_insights_enabled          = var.rds_dev_db_performance_insights_enabled
  rds_performance_insights_kms_key_id       = var.rds_dev_db_performance_insights_kms_key_id
  rds_performance_insights_retention_period = var.rds_dev_db_performance_insights_retention_period
  rds_port                                  = var.rds_dev_db_port  
  rds_publicly_accessible                   = var.rds_dev_db_publicly_accessible
  #rds_replicas                              = var.rds_dev_db_replicas
  rds_replicate_source_db                   = var.rds_dev_db_replicate_source_db
  rds_skip_final_snapshot                   = var.rds_dev_db_skip_final_snapshot
  rds_snapshot_identifier                   = var.rds_dev_db_snapshot_identifier
  rds_storage_encrypted                     = var.rds_dev_db_storage_encrypted
  rds_storage_type                          = var.rds_dev_db_storage_type
  rds_tags                                  = var.rds_dev_db_tags
  rds_tags_all                              = var.rds_dev_db_tags_all
  rds_timezone                              = var.rds_dev_db_timezone
  rds_username                              = var.rds_dev_db_username
  security_groupid                          = var.rds_dev_db_security_group_id

}
module "rds_instance_dev_event_notification" {
  source                                    = "../../modules/rds/rds_db_event_notification"

  name                                      = var.rds_instance_dev_event_notification_name
  sns_topic_arn                             = module.sns_prj1_monitoring.arn
  source_type                               = var.rds_instance_dev_event_notification_source_type
  source_ids                                = [module.rds_instance_dev.id]
  event_categories                          = var.rds_instance_dev_event_notification_event_categories
  
}

/*locals {
  json_data_dev  = sensitive(module.rds_instance_dev.sensitive_example_hash)
  json_data_test = sensitive(module.rds_instance_test.sensitive_example_hash)
  
}*/