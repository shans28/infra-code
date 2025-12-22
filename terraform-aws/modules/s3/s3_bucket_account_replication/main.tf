resource "aws_s3_bucket_replication_configuration" "replication" {
  role       = var.role_arn
  bucket     = var.bucket_name 
  rule {
    filter {}

    status     = var.markers_status
    delete_marker_replication {
      status = var.delete_marker
    }
    destination {
      bucket        = var.destination_bucket_arn
      storage_class = var.objects_storage_class
      account       = var.cross_account_id
    }
  }
}