# ============================================================
# NAT Gateway 01
# ============================================================
resource "aws_nat_gateway" "ecom_dev_nat_01" {
  allocation_id = aws_eip.ecom_dev_eip_01.id           # Elastic IP 01
  subnet_id     = aws_subnet.ecom_dev_pub_subnet_01.id # Public Subnet 01

  tags = {
    Name  = "ecom-dev-nat-01" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }

  depends_on = [
    aws_internet_gateway.ecom_dev_igw # Internet Gateway
  ]
}

# ============================================================
# NAT Gateway 02
# ============================================================
resource "aws_nat_gateway" "ecom_dev_nat_02" {
  allocation_id = aws_eip.ecom_dev_eip_02.id           # Elastic IP 02
  subnet_id     = aws_subnet.ecom_dev_pub_subnet_02.id # Public Subnet 02

  tags = {
    Name  = "ecom-dev-nat-02" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }

  depends_on = [
    aws_internet_gateway.ecom_dev_igw # Internet Gateway
  ]
}