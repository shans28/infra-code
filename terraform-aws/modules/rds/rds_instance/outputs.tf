/*output "sensitive_example_hash" {
  value = jsondecode(sensitive(data.aws_secretsmanager_secret_version.rds_secret.secret_string))
}*/

output "engine" {
  value = aws_db_instance.rds.engine
}
output "port" {
  value = aws_db_instance.rds.port
}
output "identifier" {
  value = aws_db_instance.rds.identifier
}
output "name" {
  value = aws_db_instance.rds.db_name
}
output "username"{
  value = aws_db_instance.rds.username
}
output "host" {
  value = aws_db_instance.rds.address
}
output "password"{
  value = aws_db_instance.rds.password
}
output "id" {
  value = aws_db_instance.rds.id
}


