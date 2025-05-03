output "webapp_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.websever-app.public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = data.tfe_outputs.infra-connection.values.main_vpc
  sensitive = true
}

output "public_subnets" {
  description = "List of IDs of the public subnets"
  value       = data.tfe_outputs.infra-connection.values.public_subnets
  sensitive = true
}

output "private_subnets" {
  description = "List of IDs of the private subnets"
  value       = data.tfe_outputs.infra-connection.values.private_subnets
  sensitive = true
}


output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.rds_app_db.address
  sensitive   = true
}
