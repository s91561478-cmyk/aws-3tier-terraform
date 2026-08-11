# ============================================================
# Elastic IP 01
# ============================================================
resource "aws_eip" "ecom_dev_eip_01" {
  domain = "vpc" # VPC Domain

  tags = {
    Name  = "ecom-dev-eip-01" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}

# ============================================================
# Elastic IP 02
# ============================================================
resource "aws_eip" "ecom_dev_eip_02" {
  domain = "vpc" # VPC Domain

  tags = {
    Name  = "ecom-dev-eip-02" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}