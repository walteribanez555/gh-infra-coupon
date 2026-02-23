output "db_username" {
	value = random_password.db_username.result
}

output "db_password" {
	value = random_password.db_password.result
}

output "database_url" {
	value = "postgresql://${random_password.db_username.result}:${random_password.db_password.result}@${aws_db_instance.db-test1.endpoint}/${aws_db_instance.db-test1.db_name}"
}
