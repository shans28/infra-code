variable "rds_name" {
  type        = string
  description = "The allocated storage in gigabytes"
}

variable "rds_username" {
  default = null
  type    = string
}

variable "rds_password" {
  default = null
  type    = string
}

variable "rds_auto_minor_version_upgrade" {
  default = true
  type    = bool
  
}

variable "rds_skip_final_snapshot" {
  default = true
  type    = bool

}
variable "rds_port" {
  default     = 3306
  type        = number
  description = "The port on which the DB accepts connections"
}

variable "rds_engine" {
  default     = "mysql"
  description = "The database engine to use"
  type        = string
}

variable "rds_engine_version" {
  default     = "8.0.23"
  type        = string
  description = "The engine versions that support the database features"
}

variable "rds_instance_class" {
  default     = "db.t3.micro"
  type        = string
  description = "The instance type of the RDS instance"
}

variable "rds_allocated_storage" {
  default     = 20
  type        = number
  description = "The allocated storage in gigabytes"
}

variable "rds_max_allocated_storage" {
  default     = 1000
  type        = number
  description = "The maximum allocated storage in gigabytes"
}

variable "rds_identifier" {
  type        = string
  description = "Name in which DB is created"
}


variable "arn_secretmanager" {
  default   = null
  sensitive = true
}


variable "multi_az" {
  default     = false
  description = "The deployment options for mysql"
  type        = bool
}

variable "security_groupid" {
  type        = list(string)
  description = "List of VPC security groups to associate"
}

variable "db_subnet_group_name" {
}

variable "parameter_group_name_id" {
}

variable "option_group" {
}

variable "rds_allow_major_version_upgrade" {
  default = false
  type    = bool
}

variable "rds_apply_immediately" {
  default = false
  type    = bool
}

variable "rds_availability_zone" {
  default = null
  type    = string
}

variable "rds_character_set_name" {
  default = null
  type    = string
}

variable "rds_copy_tags_to_snapshot" {
  default = false
  type    = bool

}

variable "rds_domain" {
  default = null
  type    = string

}

variable "rds_domain_iam_role_name" {
  default = null
  type    = string
}

variable "rds_enabled_cloudwatch_logs_exports" {
  default = null
  type    = list(string)
}


variable "rds_final_snapshot_identifier" {
  default = null
  type    = string
}

variable "rds_identifier_prefix" {
  default = null
  type    = string
}

variable "rds_iops" {
  default = 0
  type    = number
}

variable "rds_kms_key_id" {
  default = null
  type    = string
}

variable "rds_monitoring_role_arn" {
  default = null
  type    = string
}

variable "rds_nchar_character_set_name" {
  default = null
  type    = string
}

variable "rds_performance_insights_enabled" {
  default = false
  type    = bool
}
variable "rds_performance_insights_kms_key_id" {
  default = null
  type    = string
}

variable "rds_performance_insights_retention_period" {
  default = 0
  type    = number
}

variable "rds_publicly_accessible" {
  default = false
  type    = bool
}

variable "rds_replicate_source_db" {
  default = null
  type    = string
}

variable "rds_snapshot_identifier" {
  default = null
  type    = string
}

variable "rds_storage_encrypted" {
  default = false
  type    = bool
}

variable "rds_timezone" {
  default = null
  type    = string
}

variable "rds_storage_type" {
  default = "gp2"
  type    = string

}

variable "rds_tags" {
  default = null
  type    = map(string)
}

variable "rds_tags_all" {
  default = null
  type    = map(string)
}

variable "rds_backup_retention_period" {
  default = 0
  type  = number
  
}

variable "rds_backup_window" {
  default = null
  type    = string
  
}

variable "rds_ca_cert_identifier" {
  default = null
  type    = string    
}

variable "rds_customer_owned_ip_enabled" {
  default = false
  type    = bool
}

variable "rds_delete_automated_backups" {
  default = false
  type    = bool
}

variable "rds_deletion_protection" {
  default = false
  type    = bool
}

variable "rds_iam_database_authentication_enabled" {
  default = false
  type    = bool  
}

variable "rds_latest_restorable_time" {
  default = null
  type    = string  
}

variable "rds_license_model" {
  default = null
  type    = string  
}

variable "rds_maintenance_window" {
  default = null
  type    = string
}

variable "rds_monitoring_interval" {
  default = null
  type    = number
}

variable "rds_replicas" {
  default = null
  type    = list(string)
}
