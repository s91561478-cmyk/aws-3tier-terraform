# ============================================================
# Target Group ARN
# ============================================================
output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.ecom_dev_alb_tg.arn
}

# ============================================================
# Target Group Arn Suffix
# ============================================================
output "target_group_arn_suffix" {
  description = "Target Group Arn Suffix"
  value       = aws_lb_target_group.ecom_dev_alb_tg.arn_suffix
}

# ============================================================
# ALB DNS Name
# ============================================================
output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.ecom_dev_alb.dns_name
}

# ============================================================
# ALB Zone ID
# ============================================================
output "alb_zone_id" {
  description = "ALB Zone ID"
  value       = aws_lb.ecom_dev_alb.zone_id
}

# ============================================================
# ALB ARN
# ============================================================
output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.ecom_dev_alb.arn
}

# ============================================================
# ALB ARN Suffix
# ============================================================
output "alb_arn_suffix" {
  description = "ALB ARN Suffix"
  value       = aws_lb.ecom_dev_alb.arn_suffix
}