
variable "storage_capacity" {
  description = "The storage capacity of the FSx file system in GiB"
  type        = number
}

variable "subnet_ids" {
  description = "The subnet IDs for the FSx file system"
  type        = list(string)
}

variable "deployment_type" {
  description = "The deployment type of the FSx file system"
  type        = string
}
variable "per_unit_storage_throughput" {
  description = "The per unit storage throughput of the FSx file system in MB/s/TiB"
  type        = number
}

variable "security_group_ids" {
  description = "The security group IDs for the FSx file system"
  type        = list(string)
}

variable "fsx_name" {
  description = "The name of the FSx file system"
  type        = string
}

variable "tags" {
  type = map(string)
}
