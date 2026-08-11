# ============================================================
# VPC ID
# ============================================================
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

# ============================================================
# Public Subnet IDs
# ============================================================
variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
}

# ============================================================
# ALB Security Group ID
# ============================================================
variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}

# ============================================================
# ALB Security Group ID
# ============================================================
variable "acm_certificate_arn" {
  description = "ACM Certificate ARN"
  type        = string
}