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
/*RDS variable or output
======================
secretsmanager_test_master_cred_engine = "mysql"
secretsmanager_test_master_cred_port = 3306
secretsmanager_rds_test_db_engine = "mysql"
secretsmanager_rds_test_db_port = 3306
secretsmanager_rds_dev_db_engine = "mysql"
secretsmanager_rds_dev_db_port = 3306
secretsmanager_rds_test_db_dbInstanceIdentifier = "rds-dev-core-001-test-db"
secretsmanager_rds_dev_db_dbInstanceIdentifier = "rds-dev-core-001-development-db"
secretsmanager_test_master_cred_dbInstanceIdentifier = "rds-aps1-prj1-test"
secretsmanager_test_master_cred_dbname = "prj1_test"
secretsmanager_rds_test_db_dbname = "prj1_test"
secretsmanager_rds_dev_db_dbname = "prj1_dev"
secretsmanager_test_master_cred_host = "rds-aps1-prj1-test.cqkmiayfudhj.ap-south-1.rds.amazonaws.com"
secretsmanager_rds_test_db_host = "rds-dev-core-001-test-db.cqkmiayfudhj.ap-south-1.rds.amazonaws.com"  
secretsmanager_rds_dev_db_host = "rds-dev-core-001-development-db.cqkmiayfudhj.ap-south-1.rds.amazonaws.com"*/


