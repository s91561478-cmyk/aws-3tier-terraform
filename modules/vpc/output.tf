output "vpc_id" {
  description = "VPC ID"                # Output description
  value       = aws_vpc.ecom_dev_vpc.id # VPC ID
}

output "public_subnet_ids" {
  description = "Public Subnet IDs" # Output description

  value = [
    aws_subnet.ecom_dev_pub_subnet_01.id, # Public Subnet 01
    aws_subnet.ecom_dev_pub_subnet_02.id  # Public Subnet 02
  ]
}

output "app_subnet_ids" {
  description = "App Subnet IDs" # Output description

  value = [
    aws_subnet.ecom_dev_app_subnet_01.id, # App Subnet 01
    aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  ]
}

output "db_subnet_ids" {
  description = "DB Subnet IDs" # Output description

  value = [
    aws_subnet.ecom_dev_db_subnet_01.id, # DB Subnet 01
    aws_subnet.ecom_dev_db_subnet_02.id  # DB Subnet 02
  ]
}

output "alb_sg_id" {
  description = "ALB Security Group ID"               # Output description
  value       = aws_security_group.ecom_dev_alb_sg.id # ALB Security Group ID
}

output "app_sg_id" {
  description = "App Security Group ID"               # Output description
  value       = aws_security_group.ecom_dev_app_sg.id # App Security Group ID
}

output "db_sg_id" {
  description = "DB Security Group ID"               # Output description
  value       = aws_security_group.ecom_dev_db_sg.id # DB Security Group ID
}

output "efs_sg_id" {
  description = "EFS Security Group ID"               # Output description
  value       = aws_security_group.ecom_dev_efs_sg.id # EFS Security Group ID
}