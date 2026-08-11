# ============================================================
# Public Subnet 01
# ============================================================
resource "aws_subnet" "ecom_dev_pub_subnet_01" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.0.0/24"         # Subnet CIDR
  availability_zone       = "ap-northeast-2a"       # Availability Zone
  map_public_ip_on_launch = true                    # Enable public IP

  tags = {
    Name  = "ecom-dev-pub-subnet-01" # Name Tag
    env   = "dev"                    # Environment Tag
    Owner = "2313286"                # Owner Tag
  }
}

# ============================================================
# Public Subnet 02
# ============================================================
resource "aws_subnet" "ecom_dev_pub_subnet_02" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.2.0/24"         # Subnet CIDR
  availability_zone       = "ap-northeast-2c"       # Availability Zone
  map_public_ip_on_launch = true                    # Enable public IP

  tags = {
    Name  = "ecom-dev-pub-subnet-02" # Name Tag
    env   = "dev"                    # Environment Tag
    Owner = "2313286"                # Owner Tag
  }
}

# ============================================================
# App Subnet 01
# ============================================================
resource "aws_subnet" "ecom_dev_app_subnet_01" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.11.0/24"        # Subnet CIDR
  availability_zone       = "ap-northeast-2a"       # Availability Zone
  map_public_ip_on_launch = false                   # Disable public IP

  tags = {
    Name  = "ecom-dev-app-subnet-01" # Name Tag
    env   = "dev"                    # Environment Tag
    Owner = "2313286"                # Owner Tag
  }
}

# ============================================================
# App Subnet 02
# ============================================================
resource "aws_subnet" "ecom_dev_app_subnet_02" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.12.0/24"        # Subnet CIDR
  availability_zone       = "ap-northeast-2c"       # Availability Zone
  map_public_ip_on_launch = false                   # Disable public IP

  tags = {
    Name  = "ecom-dev-app-subnet-02" # Name Tag
    env   = "dev"                    # Environment Tag
    Owner = "2313286"                # Owner Tag
  }
}

# ============================================================
# DB Subnet 01
# ============================================================
resource "aws_subnet" "ecom_dev_db_subnet_01" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.21.0/24"        # Subnet CIDR
  availability_zone       = "ap-northeast-2a"       # Availability Zone
  map_public_ip_on_launch = false                   # Disable public IP

  tags = {
    Name  = "ecom-dev-db-subnet-01" # Name Tag
    env   = "dev"                   # Environment Tag
    Owner = "2313286"               # Owner Tag
  }
}

# ============================================================
# DB Subnet 02
# ============================================================
resource "aws_subnet" "ecom_dev_db_subnet_02" {
  vpc_id                  = aws_vpc.ecom_dev_vpc.id # Attach to VPC
  cidr_block              = "172.16.22.0/24"        # Subnet CIDR
  availability_zone       = "ap-northeast-2c"       # Availability Zone
  map_public_ip_on_launch = false                   # Disable public IP

  tags = {
    Name  = "ecom-dev-db-subnet-02" # Name Tag
    env   = "dev"                   # Environment Tag
    Owner = "2313286"               # Owner Tag
  }
}