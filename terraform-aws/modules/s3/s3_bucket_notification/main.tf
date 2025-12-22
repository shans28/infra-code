resource "aws_s3_bucket_notification" "bucket_notification" {
    bucket      = var.bucket_name  #"s3-dev-core-001-video-analytics"
    eventbridge = var.eventbridge_enabled  #false
    

    lambda_function {
        events              = var.lambda_function1_events    #["s3:ObjectCreated:*"]
        filter_prefix       = var.lambda_function1_filter_prefix  #"composed_recordings/"
        filter_suffix       = var.lambda_function1_filter_suffix  #".webm"
        id                  = var.lambda_function1_id        #"call-transcribe-mp3-to-json"
        lambda_function_arn = var.lambda_function1_lambda_function_arn  #"arn:aws:lambda:ap-south-1:334455221100:function:call-transcribe-for-all-speaker-at-one-audio"
    }
    lambda_function {
        events              = var.lambda_function2_events    #["s3:ObjectCreated:*"]
        filter_prefix       = var.lambda_function2_filter_prefix  #"composed_recordings/"
        filter_suffix       = var.lambda_function2_filter_suffix  #".webm"
        id                  = var.lambda_function2_id        #"call-transcribe-mp3-to-json"
        lambda_function_arn = var.lambda_function2_lambda_function_arn  #"arn:aws:lambda:ap-south-1:334455221100:function:call-transcribe-for-all-speaker-at-one-audio"
    }
    lambda_function {
        events              = var.lambda_function3_events    #["s3:ObjectCreated:*"]
        filter_prefix       = var.lambda_function3_filter_prefix  #"composed_recordings/"
        filter_suffix       = var.lambda_function3_filter_suffix  #".webm"
        id                  = var.lambda_function3_id        #"call-transcribe-mp3-to-json"
        lambda_function_arn = var.lambda_function3_lambda_function_arn  #"arn:aws:lambda:ap-south-1:334455221100:function:call-transcribe-for-all-speaker-at-one-audio"
    }
    lambda_function {
        events              = var.lambda_function4_events    #["s3:ObjectCreated:*"]
        filter_prefix       = var.lambda_function4_filter_prefix  #"composed_recordings/"
        filter_suffix       = var.lambda_function4_filter_suffix  #".webm"
        id                  = var.lambda_function4_id        #"call-transcribe-mp3-to-json"
        lambda_function_arn = var.lambda_function4_lambda_function_arn  #"arn:aws:lambda:ap-south-1:334455221100:function:call-transcribe-for-all-speaker-at-one-audio"
    }
    /*lambda_function {
        events              = var.lambda_function5_events    #["s3:ObjectCreated:*"]
        filter_prefix       = var.lambda_function5_filter_prefix  #"composed_recordings/"
        filter_suffix       = var.lambda_function5_filter_suffix  #".webm"
        id                  = var.lambda_function5_id        #"call-transcribe-mp3-to-json"
        lambda_function_arn = var.lambda_function5_lambda_function_arn  #"arn:aws:lambda:ap-south-1:334455221100:function:call-transcribe-for-all-speaker-at-one-audio"
    }
*/
}