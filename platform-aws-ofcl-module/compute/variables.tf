variable "eks_cluster_name" {
  default     = "apps-cluster"
  description = "name of the eks cluster"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region for the EKS cluster"
}

variable "eks_cluster_deletion_protection" {
  default     = true
  description = "Whether to enable deletion protection for the EKS cluster"
}

variable "eks_cluster_dataplane_wait_duration" {
  default     = "10m"
  description = "The amount of time to wait for the EKS cluster dataplane to become active before timing out. The value is specified in ISO 8601 duration format."

}

variable "eks_cluster_cloudwatch_log_group_class" {
  default     = "STANDARD"
  description = "The class of CloudWatch log group to create for the EKS cluster. Valid values are aws_eks_cluster and aws_eks_fargate_pod."
}

variable "eks_cluster_cloudwatch_log_group_retention_in_days" {
  default     = 30
  description = "The number of days to retain CloudWatch logs for the EKS cluster."
}

variable "eks_cluster_version" {
  default     = "1.33"
  description = "The Kubernetes version for the EKS cluster."
}


variable "aws_account_name" {
  description = "The name of the AWS account (e.g., dev, staging, prod)"

}

variable "networking_state_key" {
  description = "The key for the remote state of the networking module in S3 (e.g., networking.tfstate)"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the EKS cluster and its resources"
}

variable "jumpserver_ami" {
  default     = "ami-0c94855ba95c71c99"
  description = "The AMI ID for the jumpserver instances"
}

variable "jumpserver_sg_name" {
  default     = "jumpserver-sg"
  description = "The name of the security group for jumpserver instances"
}

variable "app_test_sg_name" {
  default     = "app-test-sg"
  description = "The name of the security group for app test instances"
}

variable "app_test_sg_ingress_rule" {
  default = [ 
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 22
      to_port =22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ]
  
}