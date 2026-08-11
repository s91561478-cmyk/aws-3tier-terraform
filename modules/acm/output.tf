# ============================================================
# ACM Certificate ARN
# ============================================================
output "acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = aws_acm_certificate.ecom_dev_acm.arn
}