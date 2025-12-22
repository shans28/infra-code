variable "bucket_name" {
    default = null
    type    = string
}

variable "sse_s3_algorithm" {
  type        = string
  default     = null
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
}