# ============================================================
# Route 53 Public Hosted Zone
# ============================================================
resource "aws_route53_zone" "ecom_dev_phz" {
  name = "jinsiklab.com" # Domain name

  tags = {
    Name  = "ecom-dev-phz" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}