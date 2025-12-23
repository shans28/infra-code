module "s3_app_data" {
  source = "../../modules/s3/s3_bucket"

  bucket_name             = var.s3_app_data_bucket_name
  bucket_force_destroy    = var.s3_app_data_bucket_force_destroy
  tags                    = var.s3_app_data_tags
  object_lock_enabled     = var.s3_app_data_object_lock_enabled
  block_public_acls       = var.s3_app_data_block_public_acls       #true
  block_public_policy     = var.s3_app_data_block_public_policy     #true
  ignore_public_acls      = var.s3_app_data_ignore_public_acls      #true
  restrict_public_buckets = var.s3_app_data_restrict_public_buckets # true
  enabled                 = var.s3_app_data_versioning              # true
  }

resource "aws_s3_bucket_policy" "s3_app_data" {
  bucket = module.s3_app_data.s3_bucket_account_id
  policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.s3_app_data_bucket_name}",
                "arn:aws:s3:::${var.s3_app_data_bucket_name}/*"
            ],
            "Condition": {
                "ArnNotEquals": {
                    "aws:PrincipalArn": ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.eks_worker_apps_role_name}",
						"arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.role_prj1_001_dev_admin}",
                        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ROLE-prj1-001-DEV-PWUSR",
                        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.role_prj1_core_001_tf}"
					]
                }
            }
        },
        {
            "Sid": "AllowSSLRequestsOnly",
            "Action": "s3:*",
            "Effect": "Deny",
            "Resource": [
                "arn:aws:s3:::${var.s3_app_data_bucket_name}",
                "arn:aws:s3:::${var.s3_app_data_bucket_name}/*"
            ],
            "Condition": {
                "Bool": {
                     "aws:SecureTransport": "false"
                }
            },
           "Principal": "*"
        }
        
        
    ]
}
)
}
module "s3_app_data_sse_configuration" {
    source = "../../modules/s3/s3_bucket_sse_configuration"

    bucket_name      = module.s3_app_data.s3_bucket_account_id
    sse_s3_algorithm = var.s3_app_data_sse_configuration_sse_s3_algorithm
}
/*module "s3_app_data_server_access_logging" {
    source = "../../modules/s3/s3_bucket_server_access_logging"

    bucket_name   = module.s3_app_data.s3_bucket_account_id
    target_bucket = module.s3_infra_logs.s3_bucket_account_id
    target_prefix = var.s3_app_data_server_access_logging_target_prefix
}*/
module "s3_infra_logs" {
  source = "../../modules/s3/s3_bucket"

  bucket_name             = var.s3_infra_logs_bucket_name
  bucket_force_destroy    = var.s3_infra_logs_bucket_force_destroy
  tags                    = var.s3_infra_logs_tags
  object_lock_enabled     = var.s3_infra_logs_object_lock_enabled
  block_public_acls       = var.s3_infra_logs_block_public_acls       #true
  block_public_policy     = var.s3_infra_logs_block_public_policy     #true
  ignore_public_acls      = var.s3_infra_logs_ignore_public_acls      #true
  restrict_public_buckets = var.s3_infra_logs_restrict_public_buckets # true
}

resource "aws_s3_bucket_policy" "s3_infra_logs" {
  bucket = module.s3_infra_logs.s3_bucket_account_id
  policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_infra_logs_bucket_name}"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::718504428378:root"
            },
            "Action": "s3:PutObject",
            "Resource": [
                "arn:aws:s3:::s3-dev-core-001-infra-logs/app-elb-access-logs/AWSLogs/334455221100/*"
            # "arn:aws:s3:::${var.s3_infra_logs_bucket_name}/video-analytics-cloud-trail-logs/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
            ]
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": [ "arn:aws:s3:::${var.s3_infra_logs_bucket_name}/s3-cloud-trail-logs/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
                          "arn:aws:s3:::s3-dev-core-001-infra-logs/app-elb-access-logs/AWSLogs/334455221100/*"
                        ],
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "S3PolicyStmt-DO-NOT-MODIFY-1667470205628",
            "Effect": "Allow",
            "Principal": {
                "Service": "logging.s3.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::s3-dev-core-001-infra-logs/*"
        },
        {
            "Sid": "AllowSSLRequestsOnly",
            "Action": "s3:*",
            "Effect": "Deny",
            "Resource": [
                "arn:aws:s3:::${var.s3_infra_logs_bucket_name}",
                "arn:aws:s3:::${var.s3_infra_logs_bucket_name}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            },
            "Principal": "*"
        },
    ]
}
)
}
module "s3_infra_logs_sse_configuration" {
    source = "../../modules/s3/s3_bucket_sse_configuration"

    bucket_name      = module.s3_infra_logs.s3_bucket_account_id
    sse_s3_algorithm = var.s3_infra_logs_sse_configuration_sse_s3_algorithm  
}
/*module "s3_infra_logs_server_access_logging" {
    source = "../../modules/s3/s3_bucket_server_access_logging"

    bucket_name   = module.s3_infra_logs.s3_bucket_account_id
    target_bucket = module.s3_infra_logs.s3_bucket_account_id
    target_prefix = var.s3_infra_logs_server_access_logging_target_prefix
}*/
module "s3_video_analytics" {
  source = "../../modules/s3/s3_bucket"

  bucket_name             = var.s3_video_analytics_bucket_name
  bucket_force_destroy    = var.s3_video_analytics_bucket_force_destroy
  tags                    = var.s3_video_analytics_tags
  object_lock_enabled     = var.s3_video_analytics_object_lock_enabled
  block_public_acls       = var.s3_video_analytics_block_public_acls       #true
  block_public_policy     = var.s3_video_analytics_block_public_policy     #true
  ignore_public_acls      = var.s3_video_analytics_ignore_public_acls      #true
  restrict_public_buckets = var.s3_video_analytics_restrict_public_buckets # true
  enabled                 = var.s3_video_analytics_versioning              # true
}
resource "aws_s3_bucket_policy" "s3_video_analytics" {
  bucket = module.s3_video_analytics.s3_bucket_account_id
  policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowSSLRequestsOnly",
            "Action": "s3:*",
            "Effect": "Deny",
            "Resource": [
                "arn:aws:s3:::${var.s3_video_analytics_bucket_name}",
                "arn:aws:s3:::${var.s3_video_analytics_bucket_name}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            },
            "Principal": "*"
        }
    ]
  } 
  )
}


module "s3_video_analytics_sse_configuration" {
    source = "../../modules/s3/s3_bucket_sse_configuration"

    bucket_name      = module.s3_video_analytics.s3_bucket_account_id
    sse_s3_algorithm = var.s3_video_analytics_sse_configuration_sse_s3_algorithm
}


# module "s3_event_notification_lambda_demo" {
#     source = "../../modules/s3/s3_bucket_notification"

#     bucket_name = module.s3_video_analytics_demo.s3_bucket_account_id
# }

module "s3_video_analytics_review" {
  source = "../../modules/s3/s3_bucket"
#s3-dev-core-001-review-video-analytics

  bucket_name             = var.s3_video_analytics_review_bucket_name
  bucket_force_destroy    = var.s3_video_analytics_review_bucket_force_destroy
  tags                    = var.s3_video_analytics_review_tags
  object_lock_enabled     = var.s3_video_analytics_review_object_lock_enabled
  bucket_object_ownership = var.s3_video_analytics_review_bucket_object_ownership
  block_public_acls       = var.s3_video_analytics_review_block_public_acls       #true
  block_public_policy     = var.s3_video_analytics_review_block_public_policy     #true
  ignore_public_acls      = var.s3_video_analytics_review_ignore_public_acls      #true
  restrict_public_buckets = var.s3_video_analytics_review_restrict_public_buckets # true
  enabled                 = var.s3_video_analytics_review_enabled                 # true
}

# module "s3_event_notification_lambda_review" {
#     source = "../../modules/s3/s3_bucket_notification"

#     bucket_name = module.s3_video_analytics_review.s3_bucket_account_id
    
# }
resource "aws_s3_bucket" "public_bucketcreation" {
  bucket        = var.public_template_bucket_name                                             #null
  force_destroy = var.public_template_bucket_force_destroy    
  object_lock_enabled         = var.public_template_object_lock_enabled #false
  #acl    = public_template_acl #"public-read"
  tags = var.public_template_tags  
  #policy = var.public_template_policy
  versioning {
    enabled = var.public_template_enabled    #true
  }
}
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.public_bucketcreation.id
  acl    = "public-read"
}

module "s3_bucket_common" {
  source = "../../modules/s3/s3_bucket"


  bucket_name             = var.s3_bucket_common_bucket_name
  bucket_force_destroy    = var.s3_bucket_common_bucket_force_destroy
  tags                    = var.s3_bucket_common_tags
  object_lock_enabled     = var.s3_bucket_common_object_lock_enabled
  bucket_object_ownership = var.s3_bucket_common_bucket_object_ownership
  block_public_acls       = var.s3_bucket_common_block_public_acls       #true
  block_public_policy     = var.s3_bucket_common_block_public_policy     #true
  ignore_public_acls      = var.s3_bucket_common_ignore_public_acls      #true
  restrict_public_buckets = var.s3_bucket_common_restrict_public_buckets # true
  enabled                 = var.s3_bucket_common_enabled                 # true
}

resource "aws_s3_bucket_policy" "s3_common_email_template" {
  bucket = module.s3_bucket_common.s3_bucket_account_id
  policy = jsonencode(
    {
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::s3-dev-core-001-common-email-template/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${module.aws_cloudfront_distribution.id}"
                }
            }
        }
    ]
})
}

module "s3_core_common_cdn_data" {
  source = "../../modules/s3/s3_bucket"


  bucket_name             = var.s3_core_common_cdn_data_bucket_name
  bucket_force_destroy    = var.s3_core_common_cdn_data_bucket_force_destroy
  tags                    = var.s3_core_common_cdn_data_tags
  object_lock_enabled     = var.s3_core_common_cdn_data_object_lock_enabled
  bucket_object_ownership = var.s3_core_common_cdn_data_bucket_object_ownership
  block_public_acls       = var.s3_core_common_cdn_data_block_public_acls       #true
  block_public_policy     = var.s3_core_common_cdn_data_block_public_policy     #true
  ignore_public_acls      = var.s3_core_common_cdn_data_ignore_public_acls      #true
  restrict_public_buckets = var.s3_core_common_cdn_data_restrict_public_buckets # true
  enabled                 = var.s3_core_common_cdn_data_enabled                 # true
}

resource "aws_s3_bucket_policy" "s3_core_common_cdn_data" {
  bucket = module.s3_core_common_cdn_data.s3_bucket_account_id
  policy = jsonencode(
    {
        "Version": "2008-10-17",
        "Id": "PolicyForCloudFrontPrivateContent",
        "Statement": [
            {
                "Sid": "AllowCloudFrontServicePrincipal",
                "Effect": "Allow",
                "Principal": {
                    "Service": "cloudfront.amazonaws.com"
                },
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::s3-dev-core-001-common-cdn-data/*",
                "Condition": {
                    "StringEquals": {
                      "AWS:SourceArn": "arn:aws:cloudfront::334455221100:distribution/E76TN88BWR3GZ"
                    }
                }
            }
        ]
    })
}