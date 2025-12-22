variable "bucket_name" {
    default     = null
    type        = string
    description = "Name of the s3 bucket needed for server logs"
}

variable "target_bucket"{
    default     = null
    type        = string
    description = "The name of the bucket where you want Amazon S3 to store server access logs."
}

variable "target_prefix"{
    default     = null
    type        = string
    description = " A prefix for all log object keys."
}