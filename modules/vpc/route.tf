# ============================================================
# Public Route Table
# ============================================================
resource "aws_route_table" "ecom_dev_pub_rt" {
  vpc_id = aws_vpc.ecom_dev_vpc.id # Attach to VPC

  tags = {
    Name  = "ecom-dev-pub-rt" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}

# ============================================================
# Public Route
# ============================================================
resource "aws_route" "ecom_dev_pub_route" {
  route_table_id         = aws_route_table.ecom_dev_pub_rt.id   # Public Route Table
  destination_cidr_block = "0.0.0.0/0"                          # Default Route
  gateway_id             = aws_internet_gateway.ecom_dev_igw.id # Internet Gateway
}

# ============================================================
# Public Route Table Association 01
# ============================================================
resource "aws_route_table_association" "ecom_dev_pub_rt_association_01" {
  subnet_id      = aws_subnet.ecom_dev_pub_subnet_01.id # Public Subnet 01
  route_table_id = aws_route_table.ecom_dev_pub_rt.id   # Public Route Table
}

# ============================================================
# Public Route Table Association 02
# ============================================================
resource "aws_route_table_association" "ecom_dev_pub_rt_association_02" {
  subnet_id      = aws_subnet.ecom_dev_pub_subnet_02.id # Public Subnet 02
  route_table_id = aws_route_table.ecom_dev_pub_rt.id   # Public Route Table
}

# ============================================================
# App Route Table 01
# ============================================================
resource "aws_route_table" "ecom_dev_app_rt_01" {
  vpc_id = aws_vpc.ecom_dev_vpc.id # Attach to VPC

  tags = {
    Name  = "ecom-dev-app-rt-01" # Name Tag
    env   = "dev"                # Environment Tag
    Owner = "2313286"            # Owner Tag
  }
}

# ============================================================
# App Route 01
# ============================================================
resource "aws_route" "ecom_dev_app_route_01" {
  route_table_id         = aws_route_table.ecom_dev_app_rt_01.id # App Route Table 01
  destination_cidr_block = "0.0.0.0/0"                           # Default Route
  nat_gateway_id         = aws_nat_gateway.ecom_dev_nat_01.id    # NAT Gateway 01
}

# ============================================================
# App Route Table Association 01
# ============================================================
resource "aws_route_table_association" "ecom_dev_app_rt_01_association_01" {
  subnet_id      = aws_subnet.ecom_dev_app_subnet_01.id  # App Subnet 01
  route_table_id = aws_route_table.ecom_dev_app_rt_01.id # App Route Table 01
}

# ============================================================
# App Route Table 02
# ============================================================
resource "aws_route_table" "ecom_dev_app_rt_02" {
  vpc_id = aws_vpc.ecom_dev_vpc.id # Attach to VPC

  tags = {
    Name  = "ecom-dev-app-rt-02" # Name Tag
    env   = "dev"                # Environment Tag
    Owner = "2313286"            # Owner Tag
  }
}

# ============================================================
# App Route 02
# ============================================================
resource "aws_route" "ecom_dev_app_route_02" {
  route_table_id         = aws_route_table.ecom_dev_app_rt_02.id # App Route Table 02
  destination_cidr_block = "0.0.0.0/0"                           # Default Route
  nat_gateway_id         = aws_nat_gateway.ecom_dev_nat_02.id    # NAT Gateway 02
}

# ============================================================
# App Route Table Association 02
# ============================================================
resource "aws_route_table_association" "ecom_dev_app_rt_02_association_01" {
  subnet_id      = aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  route_table_id = aws_route_table.ecom_dev_app_rt_02.id # App Route Table 02
}

# ============================================================
# DB Route Table
# ============================================================
resource "aws_route_table" "ecom_dev_db_rt" {
  vpc_id = aws_vpc.ecom_dev_vpc.id # Attach to VPC

  tags = {
    Name  = "ecom-dev-db-rt" # Name Tag
    env   = "dev"            # Environment Tag
    Owner = "2313286"        # Owner Tag
  }
}

# ============================================================
# DB Route Table Association 01
# ============================================================
resource "aws_route_table_association" "ecom_dev_db_rt_01_association_01" {
  subnet_id      = aws_subnet.ecom_dev_db_subnet_01.id # DB Subnet 01
  route_table_id = aws_route_table.ecom_dev_db_rt.id   # DB Route Table
}

# ============================================================
# DB Route Table Association 02
# ============================================================
resource "aws_route_table_association" "ecom_dev_db_rt_02_association_02" {
  subnet_id      = aws_subnet.ecom_dev_db_subnet_02.id # DB Subnet 02
  route_table_id = aws_route_table.ecom_dev_db_rt.id   # DB Route Table
}