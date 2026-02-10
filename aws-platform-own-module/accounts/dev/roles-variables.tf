#role-dev-core-001-admin
variable "role_prj1_001_dev_admin_role_name" {
  default = "role-dev-core-001-admin"
}

variable "role_prj1_001_dev_admin_policy_name" {
  default = "role-dev-core-001-admin"
}

variable "role_prj1_001_dev_admin_policy_description" {
  default = "Provides full access to AWS services and resources."
}

#username
variable "role_prj1_001_dev_admin_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}


variable "role_dev_core_001_pwusr_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "role_dev_core_001_suppwusr_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "service_role_dev_core_001_kube_deployments_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "role_prj1_001_dev_admin_role_tags" {
  default = null
  type    = map(string)
}

#role-dev-core-001-pwusr
variable "role_dev_core_001_pwusr_role_name" {
  default = "role-dev-core-001-pwusr"
}

variable "role_dev_core_001_pwusr_policy_name" {
  default = "role-dev-core-001-pwusr"
}

variable "role_dev_core_001_pwusr_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "role_dev_core_001_pwusr_role_tags" {
  default = null
  type    = map(string)
}

#role-dev-core-001-suppwusr
variable "role_dev_core_001_suppwusr_role_name" {
  default = "role-dev-core-001-suppwusr"
}

variable "role_dev_core_001_suppwusr_policy_name" {
  default = "role-dev-core-001-suppwusr"
}

variable "role_dev_core_001_suppwusr_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "role_dev_core_001_suppwusr_role_tags" {
  default = null
  type    = map(string)
}

#service-role-dev-core-001-kube-deployments
variable "service_role_dev_core_001_kube_deployments_role_name" {
  default = "service-role-dev-core-001-kube-deployments"
}

variable "service_role_dev_core_001_kube_deployments_policy_name" {
  default = "service-role-dev-core-001-kube-deployments"
}

variable "service_role_dev_core_001_kube_deployments_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "service_role_dev_core_001_kube_deployments_role_tags" {
  default = null
  type    = map(string)
}

variable "role_prj1_001_dev_admin" {
  default = "ROLE-prj1-001-DEV-ADMIN"
}

variable "role_prj1_core_001_tf" {
  default = "ROLE-prj1-CORE-001-TF"
}
