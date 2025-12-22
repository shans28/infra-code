resource "aws_s3_bucket" "bucketcreation" {
  bucket        = var.bucket_name                                             #null
  force_destroy = var.bucket_force_destroy    
  object_lock_enabled         = var.object_lock_enabled #false
  tags = var.tags  
  policy = var.policy
  versioning {
    enabled = var.enabled    #true
  }
                                                           
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucketcreation.id

  block_public_acls   = var.block_public_acls  #true
  block_public_policy = var.block_public_policy   #true
  ignore_public_acls      = var.ignore_public_acls #true
  restrict_public_buckets = var.restrict_public_buckets # true
}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucketcreation.id

  rule {
    object_ownership =  var.bucket_object_ownership
  }
}