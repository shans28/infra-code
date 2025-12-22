variable "bucket_name" {
    default     = null
    type        = string
    description = " The name of the source S3 bucket we want Amazon S3 to monitor "
}

variable "role_arn" {
    default     = null
    type        = string
    description = "The ARN of the IAM role for Amazon S3 to assume when replicating the objects"
  
}
variable "markers_status" {
    default     = null
    type        = string
    description = " markers status set for delete markers should be replicated. Either Enabled or Disabled."
  
}
variable "destination_bucket_arn" {
    default     = null
    type        = string
    description = "The ARN of the S3 bucket where we want Amazon S3 to store replicas of the objects identified by the rule"
}
variable "objects_storage_class" {
    default     = null
    type        = string
    description = "The storage class used to store the object"
}    
variable "access_control_translation_owner" {
    default     = null
    type        = string
    description = "replica ownership to the AWS account that owns the destination bucket"
}
variable "cross_account_id" {
    default     = null
    type        = number
    description = "The Account ID to specify the replica ownership"
}
variable "delete_marker" {
    default      = null
    type         = string
    description = "Whether delete markers should be replicated. Either Enabled or Disabled"  
}

