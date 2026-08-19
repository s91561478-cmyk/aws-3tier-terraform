variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "waf_admin_ip_address" {
  description = "waf-admin ip address"
  type        = list(string)
}

variable "sns_email" {
  description = "SNS Email"
  type        = string
}

variable "ec2_instance_id" {
  description = "EC2 Instance ID for disk alarm"
  type        = string
}