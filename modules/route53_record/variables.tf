# ============================================================
# Route53 Zone ID
# ============================================================
variable "route53_zone_id" {
  description = "Route53 Zone ID"
  type        = string
}

# ============================================================
# ALB DNS Name
# ============================================================
variable "alb_dns_name" {
  description =     "ALB DNS Name"
  type        = string
}

# ============================================================
# ALB Zone ID
# ============================================================
variable "alb_zone_id" {
  description = "ALB Zone ID"
  type        = string
}