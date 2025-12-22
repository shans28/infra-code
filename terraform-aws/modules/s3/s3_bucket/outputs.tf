output "s3_bucket_account_id" {
  value = aws_s3_bucket.bucketcreation.id
}

output "arn" {
  value = aws_s3_bucket.bucketcreation.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.bucketcreation.bucket_domain_name
}