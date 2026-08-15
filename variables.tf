variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "waf_admin_ip_address" {
  description = "waf-admin ip address"
  type        = list(string)
}