variable "name" {
  description = "The name of the option group"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the option group"
  type        = string
  default     = null
}

variable "engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with"
  type        = string
  default     = null
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = null
}

variable "name_prefix" {
  default = null
  type    = string

}

variable "option_tags" {
  default = null
  type    = map(string)
}

variable "option_tags_all" {
  default = null
  type    = map(string)
}