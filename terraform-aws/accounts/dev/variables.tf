#provider
variable "region" {
  default     = "ap-south-1"
  type        = string
  description = "Name of the region the resource present"
}

variable "profile" {
  # default     = "prj1-core-tf"
  default     = null
  type        = string
  description = "Name of the profile name present in the configuration"

}

variable "tags" {
  default = {
    client = "prj1"
    env     = "dev"
    project = "prj1"
    created_by = "Terraform"
    #create_date_time = "12/08/2022 - 11.50am"

  }
  type = map(string)
}

#S3 Bucket Creation
variable "s3_bucket_name" {
  default     = "testbucket-prj1"
  type        = string
  description = "Name of the s3 bucket needed for Cloudtrail "
}


variable "s3_bucket_force_destroy" {
  default     = true
  type        = bool
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "s3_tags" {
  default = {
    "prj1" = "terraform testing"
  }
  description = "(Optional) A mapping of tags to assign the S3 bucket. (A Name tag is added based on name or name_prefix)"
  type        = map(string)
}


#Cloud Trail Creation
variable "cloudtrail_global_service_events" {
  default     = true
  type        = bool
  description = "capturing events from services like IAM, include_global_service_events must be enabled "
}

variable "cloudtrail_s3_prefix" {
  default     = null
  type        = string
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with name"
}


variable "cloudtrail_name" {
  default     = "test_trail"
  type        = string
  description = "Name of the Cloudtrail service"
}

variable "cloudtrail_tags" {
  default = {
    "cost-center" = "terraform training"
  }
  description = "(Optional) A mapping of tags to assign the S3 bucket. (A Name tag is added based on name or name_prefix)"
  type        = map(string)
}

variable "Cloudtrail_s3_bucket_name" {
  default     = "testbucket"
  type        = string
  description = "Name of the s3 bucket needed for Cloudtrail "
}










