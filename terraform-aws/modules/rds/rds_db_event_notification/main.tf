resource "aws_db_event_subscription" "default" {
  name      = var.name
  sns_topic = var.sns_topic_arn
  source_type = var.source_type
  source_ids  = var.source_ids
  event_categories = var.event_categories
}