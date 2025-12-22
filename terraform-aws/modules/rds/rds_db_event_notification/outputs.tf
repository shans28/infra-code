output "id" {
    value             = aws_db_event_subscription.default.id
    description  = "The name of the RDS event notification subscription." 
}

output "arn" {
    value       = aws_db_event_subscription.default.arn
    description = "The Amazon Resource Name of the RDS event notification subscription."
}