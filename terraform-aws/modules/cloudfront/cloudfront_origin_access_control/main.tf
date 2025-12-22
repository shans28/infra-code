resource "aws_cloudfront_origin_access_control" "access_control" {
    name                              = var.name   #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
    origin_access_control_origin_type = var.origin_access_control_origin_type  #"s3"
    signing_behavior                  = var.signing_behavior   #"always"
    signing_protocol                  = var.signing_protocol   # "sigv4"
}


