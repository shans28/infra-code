
variable "aws_cloudfront_distribution_aliases" {
   default     = null
   type        = list(string)
}
variable "aws_cloudfront_distribution_locations" {
   default     = null
   type        = list(string)
}
variable "aws_cloudfront_distribution_allowed_methods" {
   default     = ["GET","HEAD"]
   type        = list(string)
}
variable "aws_cloudfront_distribution_cached_methods" {
   default     = ["GET","HEAD"]
   type        = list(string)
}


variable "aws_cloudfront_distribution_enabled" {
   default     = true
   type        = bool
}
variable "aws_cloudfront_distribution_http_version" {
   default     = "http2"
   type        = string
}
variable "aws_cloudfront_distribution_is_ipv6_enabled" {
   default     = true
   type        = bool
}

variable "aws_cloudfront_distribution_price_class" {
   default     = "PriceClass_All"
   type        = string
}
variable "aws_cloudfront_distribution_wait_for_deployment" {
   default     = true
   type        = bool
}
variable "aws_cloudfront_distribution_compress" {
   default     = false
   type        = bool
}

variable "aws_cloudfront_distribution_default_ttl" {
   default     = 0
   type        = number
}
variable "aws_cloudfront_distribution_max_ttl" {
   default     = 0
   type        = number
}
variable "aws_cloudfront_distribution_min_ttl" {
   default     = 0
   type        = number
}
variable "core_common_cdn_data_connection_attempts_1" {
   default     = 3
   type        = number
}
variable "core_common_cdn_data_connection_timeout_1" {
   default     = 10
   type        = number
}
variable "connection_attempts_1" {
   default     = null
   type        = number
}
variable "connection_timeout_1" {
   default     = null
   type        = number
}

variable "aws_cloudfront_distribution_connection_attempts" {
   default     = 3
   type        = number
}
variable "aws_cloudfront_distribution_connection_timeout" {
   default     = 10
   type        = number
}


variable "aws_cloudfront_distribution_smooth_streaming" {
   default     = true
   type        = bool
}
variable "aws_cloudfront_distribution_target_origin_id" {
   default     = null
   type        = string
}

variable "aws_cloudfront_distribution_viewer_protocol_policy" {
   default     = "allow-all"
   type        = string
}
variable "aws_cloudfront_distribution_domain_name" {
   default     = null
   type        = string
}
variable "aws_cloudfront_distribution_origin_access_control_id" {
   default     = null
   type        = string
}
variable "aws_cloudfront_distribution_origin_id" {
   default     = null
   type        = string
}
variable "aws_cloudfront_distribution_restriction_type" {
   default     = "none"
   type        = string
}
variable "aws_cloudfront_distribution_cloudfront_default_certificate" {
   default     = true
   type        = bool
}


variable "origin_access_control_origin_type" {
   default     = "s3"
   type        = string
}
variable "signing_behavior" {
   default     = "always"
   type        = string
}
variable "signing_protocol" {
   default     ="sigv4"
   type        = string
}

variable "core_common_cdn_data_origin_access_control_origin_type" {
   default     = "s3"
   type        = string
}
variable "core_common_cdn_data_signing_behavior" {
   default     = "always"
   type        = string
}
variable "core_common_cdn_data_signing_protocol" {
   default     ="sigv4"
   type        = string
}