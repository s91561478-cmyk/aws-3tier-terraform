# ============================================================
# App Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_app_sg" {
  name        = "ecom-dev-app-sg"       # Security Group name
  description = "ecom-dev-app-sg"       # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-app-sg" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}

# ============================================================
# ALB Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_alb_sg" {
  name        = "ecom-dev-alb-sg"       # Security Group name
  description = "ecom-dev-alb-sg"       # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-alb-sg" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}

# ============================================================
# DB Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_db_sg" {
  name        = "ecom-dev-db-sg"        # Security Group name
  description = "ecom-dev-db-sg"        # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-db-sg" # Name Tag
    env   = "dev"            # Environment Tag
    Owner = "2313286"        # Owner Tag
  }
}

# ============================================================
# SSM Endpoint Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_ept_ssm_sg" {
  name        = "ecom-dev-ept-ssm-sg"   # Security Group name
  description = "ecom-dev-ept-ssm-sg"   # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-ept-ssm-sg" # Name Tag
    env   = "dev"                 # Environment Tag
    Owner = "2313286"             # Owner Tag
  }
}

# ============================================================
# Logs Endpoint Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_ept_logs_sg" {
  name        = "ecom-dev-ept-logs-sg"  # Security Group name
  description = "ecom-dev-ept-logs-sg"  # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-ept-logs-sg" # Name Tag
    env   = "dev"                  # Environment Tag
    Owner = "2313286"              # Owner Tag
  }
}

# ============================================================
# EFS Security Group
# ============================================================
resource "aws_security_group" "ecom_dev_efs_sg" {
  name        = "ecom-dev-efs-sg"       # Security Group name
  description = "ecom-dev-efs-sg"       # Security Group description
  vpc_id      = aws_vpc.ecom_dev_vpc.id # VPC ID

  tags = {
    Name  = "ecom-dev-efs-sg" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}