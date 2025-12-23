module "aws_cloudfront_origin_access_control" {
source = "../../modules/cloudfront/cloudfront_origin_access_control"
    name                              = module.s3_bucket_common.bucket_domain_name    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
    origin_access_control_origin_type = var.origin_access_control_origin_type  #"s3"
    signing_behavior                  = var.signing_behavior   #"always"
    signing_protocol                  = var.signing_protocol   #"sigv4"
    
}

module "aws_cloudfront_distribution" {
source = "../../modules/cloudfront/cloudfront_distribution"
    aliases                        = var.aws_cloudfront_distribution_aliases    #[]
    enabled                        = var.aws_cloudfront_distribution_enabled    #true
    http_version                   = var.aws_cloudfront_distribution_http_version   #"http2"
    is_ipv6_enabled                = var.aws_cloudfront_distribution_is_ipv6_enabled   #true
    price_class                    = var.aws_cloudfront_distribution_price_class   #"PriceClass_All
    wait_for_deployment            = var.aws_cloudfront_distribution_wait_for_deployment    #true
    allowed_methods        = var. aws_cloudfront_distribution_allowed_methods  
    cached_methods         = var.aws_cloudfront_distribution_cached_methods
    compress               = var.aws_cloudfront_distribution_compress   #false
        default_ttl            = var.aws_cloudfront_distribution_default_ttl    #0
        max_ttl                = var.aws_cloudfront_distribution_max_ttl        #0
        min_ttl                = var.aws_cloudfront_distribution_min_ttl        #0
        smooth_streaming       = var.aws_cloudfront_distribution_smooth_streaming   #false
        target_origin_id       = module.s3_bucket_common.bucket_domain_name    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        viewer_protocol_policy = var.aws_cloudfront_distribution_viewer_protocol_policy   #"allow-all"
        connection_attempts      = var.aws_cloudfront_distribution_connection_attempts    #3
        connection_timeout       = var.aws_cloudfront_distribution_connection_timeout     #10
        domain_name              = module.s3_bucket_common.bucket_domain_name           #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        origin_access_control_id = module.aws_cloudfront_origin_access_control.id  #"E4BBT3R5TXZUH"
        origin_id                = module.s3_bucket_common.bucket_domain_name   #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        locations        = var.aws_cloudfront_distribution_locations    #[]
        restriction_type = var.aws_cloudfront_distribution_restriction_type   #"none
        cloudfront_default_certificate = var.aws_cloudfront_distribution_cloudfront_default_certificate     #true
        connection_attempts_1      = var.core_common_cdn_data_connection_attempts_1    #3
        connection_timeout_1       = var.core_common_cdn_data_connection_timeout_1    #10
        domain_name_1              = module.s3_core_common_cdn_data.bucket_domain_name          #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        origin_access_control_id_1 = module.aws_cloudfront_origin_access_control.id  #"E4BBT3R5TXZUH"
        origin_id_1        = module.s3_core_common_cdn_data.bucket_domain_name
}

module "aws_cloudfront_origin_access_control_core_common_cdn_data" {
source = "../../modules/cloudfront/cloudfront_origin_access_control"
    name                              = module.s3_core_common_cdn_data.bucket_domain_name    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
    origin_access_control_origin_type = var.core_common_cdn_data_origin_access_control_origin_type  #"s3"
    signing_behavior                  = var.core_common_cdn_data_signing_behavior   #"always"
    signing_protocol                  = var.core_common_cdn_data_signing_protocol   #"sigv4"
    
}
