output "endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "Database connection endpoint"
}

output "port" {
  value       = aws_db_instance.main.port
  description = "Database connection port"
}
