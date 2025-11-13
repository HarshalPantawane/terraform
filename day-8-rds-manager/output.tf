output "rds_secret_arn" {
  value = aws_db_instance.name.master_user_secret[0].secret_arn
}