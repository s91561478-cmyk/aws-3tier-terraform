# ============================================================
# Target Group ARN
# ============================================================
output "target_group_arn" {
  description = "Target Group ARN"                # Output description
  value       = aws_lb_target_group.ecom_dev_alb_tg.arn # Target Group ARN
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