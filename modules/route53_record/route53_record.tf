# ============================================================
# Route53 Alias A Record
# ============================================================
resource "aws_route53_record" "ecom_dev_alb_alias" {
  zone_id = var.route53_zone_id # Route53 Hosted Zone ID
  name    = "jinsiklab.com"                # Domain name
  type    = "A"                            # Record type

  alias {
    name                   = var.alb_dns_name # ALB DNS Name
    zone_id                = var.alb_zone_id  # ALB Zone ID
    evaluate_target_health = true                    # Evaluate target health
  }
}