# ============================================================
# Route 53 Public Hosted Zone ID
# ============================================================
output "route53_zone_id" {
  description = "Route53 Public Hosted Zone ID"
  value       = aws_route53_zone.ecom_dev_phz.id
}