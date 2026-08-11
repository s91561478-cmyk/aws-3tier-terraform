# ============================================================
# ACM Certificate
# ============================================================
resource "aws_acm_certificate" "ecom_dev_acm" {
  domain_name       = "jinsiklab.com" # Domain name
  validation_method = "DNS"           # Validation method
  key_algorithm     = "RSA_2048"      # Key algorithm

  options {
    export = "DISABLED" # Disable certificate export
  }

  lifecycle {
    create_before_destroy = true # Create new certificate before deletion
  }

  tags = {
    Name  = "ecom-dev-acm" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}

# ============================================================
# ACM DNS Validation Record
# ============================================================
resource "aws_route53_record" "ecom_dev_acm_dnsrecord" {

  for_each = {
    for dvo in aws_acm_certificate.ecom_dev_acm.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name  # Validation record name
      type   = dvo.resource_record_type  # Validation record type
      record = dvo.resource_record_value # Validation record value
    }
  }

  zone_id = var.route53_zone_id # Hosted Zone ID
  name    = each.value.name     # Record name
  type    = each.value.type     # Record type
  ttl     = 300                 # Record TTL
  records = [each.value.record] # Record value
}

# ============================================================
# ACM Certificate Validation
# ============================================================
resource "aws_acm_certificate_validation" "ecom_dev_acm_validation" {
  certificate_arn = aws_acm_certificate.ecom_dev_acm.arn # Certificate ARN

  validation_record_fqdns = [
    for record in aws_route53_record.ecom_dev_acm_dnsrecord :
    record.fqdn # Validation record FQDN
  ]
}