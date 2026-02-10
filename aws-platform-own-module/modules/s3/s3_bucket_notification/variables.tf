variable "bucket_name" {
  default = null
  type    = string
}
variable "eventbridge_enabled" {
  default = null
  type    = bool
}
variable "lambda_function1_events" {
  default = null
  type    = list(string)
}
variable "lambda_function1_filter_prefix" {
  default = null
  type    = string
}
variable "lambda_function1_id" {
  default = null
  type    = string
}
variable "lambda_function1_filter_suffix" {
  default = null
  type    = string
}
variable "lambda_function1_lambda_function_arn" {
  default = null
  type    = string
}