variable "name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = ""
}


variable "description" {
  description = "The description of the DB subnet group"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "name_prefix" {
  default = null
  type    = string

}

variable "subnet_tags" {
  default = null
  type    = map(string)
}

variable "subnet_tags_all" {
  default = null
  type    = map(string)
}
