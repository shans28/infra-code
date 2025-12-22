resource "aws_cloudfront_distribution" "distribution" {
    aliases                        = var.aliases    #[]
    enabled                        = var.enabled    #true
    http_version                   = var.http_version   #"http2"
    is_ipv6_enabled                = var.is_ipv6_enabled   #true
    price_class                    = var.price_class   #"PriceClass_All
    wait_for_deployment            = var.wait_for_deployment    #true

    default_cache_behavior {
        allowed_methods        = var. allowed_methods  
        # [
        #     "GET",
        #     "HEAD",
        # ]
        cached_methods         = var.cached_methods
        # [
        #     "GET",
        #     "HEAD",
        # ]
        forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
        compress               = var.compress   #false
        default_ttl            = var.default_ttl    #0
        max_ttl                = var.max_ttl        #0
        min_ttl                = var.min_ttl        #0
        smooth_streaming       = var.smooth_streaming   #false
        target_origin_id       = var.target_origin_id    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        viewer_protocol_policy = var.viewer_protocol_policy   #"allow-all"
    }

    origin {
        connection_attempts      = var.connection_attempts    #3
        connection_timeout       = var.connection_timeout     #10
        domain_name              = var.domain_name           #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        origin_access_control_id = var.origin_access_control_id  #"E4BBT3R5TXZUH"
        origin_id                = var.origin_id    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
    }
    origin {
        connection_attempts      = var.connection_attempts_1    #3
        connection_timeout       = var.connection_timeout_1    #10
        domain_name              = var.domain_name_1          #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
        origin_access_control_id = var.origin_access_control_id_1  #"E4BBT3R5TXZUH"
        origin_id                = var.origin_id_1    #"s3-dev-core-001-email-template-data.s3.ap-south-1.amazonaws.com"
    }
    

    restrictions {
        geo_restriction {
            locations        = var.locations    #[]
            restriction_type = var.restriction_type   #"none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = var.cloudfront_default_certificate     #true
    }
}

