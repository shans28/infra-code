variable "name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the DB parameter group"
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = null
}

variable "type" {
  description = "option of DB Parameter Group or DB Cluster Parameter Group"
  type        = string
  default     = "DB Parameter Group"
}

variable "name_prefix" {
  default = null
  type    = string

}

variable "parameter_tags" {
  default = null
  type    = map(string)
}

variable "parameter_tags_all" {
  default = null
  type    = map(string)
}
