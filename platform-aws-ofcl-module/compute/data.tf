data "aws_ssm_parameter" "eks_ami" {
  name = "/aws/service/eks/optimized-ami/${var.eks_cluster_version}/amazon-linux-2/recommended/image_id"
}

data "aws_caller_identity" "current" {}

# data "terraform_remote_state" "networking_state" {
#   backend = "s3"
#   config = {
#     bucket  = "s3_bucket_name" # Replace with  S3 bucket name where networking state is stored
#     key     = "${var.region}/${var.networking_state_key}"
#     region  = "us-east-1"
#     acl     = "private"
#     encrypt = true
#   }
# }
