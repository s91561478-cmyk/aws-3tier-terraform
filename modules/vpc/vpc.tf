# ============================================================
# VPC
# ============================================================
resource "aws_vpc" "ecom_dev_vpc" {
  cidr_block           = "172.16.0.0/16" # VPC CIDR
  instance_tenancy     = "default"       # Default tenancy
  enable_dns_support   = true            # Enable DNS support
  enable_dns_hostnames = true            # Enable DNS hostnames

  tags = {
    Name  = "ecom-dev-vpc" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}

# ============================================================
# Internet Gateway
# ============================================================
resource "aws_internet_gateway" "ecom_dev_igw" {
  vpc_id = aws_vpc.ecom_dev_vpc.id # Attach to VPC

  tags = {
    Name  = "ecom-dev-igw" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}