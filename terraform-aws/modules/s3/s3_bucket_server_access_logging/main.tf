resource "aws_s3_bucket_logging" "s3_server_access_logging" {
    bucket        = var.bucket_name
    target_bucket = var.target_bucket
    target_prefix = var.target_prefix
}