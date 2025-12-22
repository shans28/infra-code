
#s3bucket creation
variable "bucket_name" {
    default = null
    type = string
    description = "Name of the s3 bucket needed for Cloudtrail "
}
variable "enabled" {
  default  = false
}

variable "bucket_force_destroy" {
    default = false
    type = bool
    description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "tags" {

    description = "(Optional) A mapping of tags to assign the S3 bucket. (A Name tag is added based on name or name_prefix)"
    type        = map(string)
}

variable "object_lock_enabled" {
  default     = false 
  type = bool 
}
variable "policy" {
  default  = null
}

variable "block_public_acls" {
  default  = true
  type  = bool
}
variable "block_public_policy" {
  default  = true
  type     = bool
}
variable "ignore_public_acls" {
  default  = true
  type     = bool
}
variable "restrict_public_buckets" {
  default  = true
  type     = bool
}
#policy
  /*data "aws_iam_policy_document" "cloudtrail" {
  statement {
    sid = "AWSCloudTrailAclCheck"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl",
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    resources = [
      "${aws_s3_bucket.bucketcreation.arn}",
    ]
  }

  statement {
    sid = "AWSCloudTrailWrite"
    effect = "Allow"
    actions = [
      "s3:PutObject",
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = [
      "${aws_s3_bucket.bucketcreation.arn}/AWSLogs/*",
    ]
   
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}*/
 variable "bucket_object_ownership"{
  default = "BucketOwnerPreferred"
  type    = string
}