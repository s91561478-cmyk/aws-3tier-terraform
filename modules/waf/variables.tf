# ============================================================
# WAF Admin IP Addresses
# ============================================================
variable "waf_admin_ip_address" {
  description = "waf-admin ip address"
  type        = list(string)
}

variable "alb_arn" {
  description = "ALB ARN"
  type        = string
}