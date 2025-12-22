resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_configuration" {
    bucket = var.bucket_name
  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_s3_algorithm
      
    }
}
}