#roles
variable "eks_cluster_apps_role" {
  default     = "service-role-dev-core-001-eks-cluster-apps-role"
  type        = string
  description = "roles needed for the cluster "
}

variable "eks_worker_apps_role_name" {
  default     = "service-role-dev-core-001-eks-worker-apps-role"
  type        = string
  description = "roles needed for the worker node"
}


variable "eks_worker_apps_policy" {
  default     = "allow-get-secret-value-from-secrets-manager"
  type        = string
  description = "policy needed for the worker node"
}

variable "eks_cluster_apps_autoscaler_role" {
  default     = "service-role-dev-core-001-eks-autoscaler-apps-role"
  type        = string
  description = "roles needed for the autoscaler"
}

variable "eks_cluster_apps_alb_role" {
  default     = "service-role-dev-core-001-eks-loadbalancer-apps-role"
  type        = string
  description = "roles needed for the alb"
}

variable "eks_cluster_apps_pod_role" {
  default     = "service-role-dev-core-001-eks-pod-api-role"
  type        = string
  description = "roles needed for the pod"
}

variable "eks_cluster_apps_service_account_name_space" {
  default     = "api"
  type        = string
  description = "service account name space needed for the pod role" 
}

variable "eks_cluster_apps_service_account_name" {
  default     = "prj1-api-pod-sa"
  type        = string
  description = "service account name needed for the pod role"
}
variable "eks_worker_apps_demo_role_name" {
  default     = "service-role-demo-core-001-eks-worker-apps-pod-role"
  type        = string
  description = "roles needed for the worker node"
}