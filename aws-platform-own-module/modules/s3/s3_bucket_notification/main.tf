resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket      = var.bucket_name         
  eventbridge = var.eventbridge_enabled 


  lambda_function {
    events              = var.lambda_function1_events              
    filter_prefix       = var.lambda_function1_filter_prefix       
    filter_suffix       = var.lambda_function1_filter_suffix       
    id                  = var.lambda_function1_id                  
    lambda_function_arn = var.lambda_function1_lambda_function_arn 
  }

}