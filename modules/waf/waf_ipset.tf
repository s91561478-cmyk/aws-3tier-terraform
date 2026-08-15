# ============================================================
# WAF IP Set - Admin
# ============================================================
resource "aws_wafv2_ip_set" "ecom_dev_waf_ipset_admin" {
  name               = "ecom-dev-waf-ipset-admin"
  description        = "ecom-dev-waf-ipset-admin"
  scope              = "REGIONAL"               # Regional Scope
  ip_address_version = "IPV4"                   # IPv4
  addresses          = var.waf_admin_ip_address # Allowed Admin IP Addresses

  tags = {
    Name  = "ecom-dev-waf-ipset-admin" # Name Tag
    env   = "dev"                      # Environment Tag
    Owner = "2313286"                  # Owner Tag
  }
}