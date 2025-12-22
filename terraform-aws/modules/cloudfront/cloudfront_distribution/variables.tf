
variable "aliases" {
   default     = null
   type        = list(string)
}
variable "locations" {
   default     = null
   type        = list(string)
}
variable "allowed_methods" {
   default     = null
   type        = list(string)
}
variable "cached_methods" {
   default     = null
   type        = list(string)
}


variable "enabled" {
   default     = null
   type        = string
}
variable "http_version" {
   default     = null
   type        = string
}
variable "is_ipv6_enabled" {
   default     = null
   type        = string
}

variable "price_class" {
   default     = null
   type        = string
}
variable "wait_for_deployment" {
   default     = null
   type        = string
}
variable "compress" {
   default     = null
   type        = string
}

variable "default_ttl" {
   default     = null
   type        = number
}
variable "max_ttl" {
   default     = null
   type        = number
}
variable "min_ttl" {
   default     = null
   type        = number
}
variable "connection_attempts" {
   default     = null
   type        = number
}
variable "connection_timeout" {
   default     = null
   type        = number
}



variable "smooth_streaming" {
   default     = null
   type        = string
}
variable "target_origin_id" {
   default     = null
   type        = string
}

variable "viewer_protocol_policy" {
   default     = null
   type        = string
}
variable "domain_name" {
   default     = null
   type        = string
}
variable "origin_access_control_id" {
   default     = null
   type        = string
}
variable "origin_id" {
   default     = null
   type        = string
}
variable "restriction_type" {
   default     = null
   type        = string
}
variable "cloudfront_default_certificate" {
   default     = null
   type        = string
}

variable "connection_attempts_1" {
   default     = null
   type        = number
}
variable "connection_timeout_1" {
   default     = null
   type        = number
}

variable "domain_name_1"{
   default = null
   type = string
}
variable "origin_id_1" {
   default     = null
   type        = string
}
variable "origin_access_control_id_1"{
   default  = null
   type     = string
}