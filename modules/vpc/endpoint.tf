# ============================================================
# SSM VPC Endpoint
# ============================================================
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ssm" {
  vpc_id              = aws_vpc.ecom_dev_vpc.id            # VPC ID
  service_name        = "com.amazonaws.ap-northeast-2.ssm" # SSM service name
  vpc_endpoint_type   = "Interface"                        # Endpoint type
  private_dns_enabled = true                               # Enable Private DNS

  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, # App Subnet 01
    aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  ]

  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id # SSM Endpoint SG
  ]

  tags = {
    Name  = "ecom-dev-ssm-ept-ssm" # Name Tag
    env   = "dev"                  # Environment Tag
    Owner = "2313286"              # Owner Tag
  }
}

# ============================================================
# SSM Messages VPC Endpoint
# ============================================================
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ssmmessages" {
  vpc_id              = aws_vpc.ecom_dev_vpc.id                    # VPC ID
  service_name        = "com.amazonaws.ap-northeast-2.ssmmessages" # SSM Messages service name
  vpc_endpoint_type   = "Interface"                                # Endpoint type
  private_dns_enabled = true                                       # Enable Private DNS

  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, # App Subnet 01
    aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  ]

  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id # SSM Endpoint SG
  ]

  tags = {
    Name  = "ecom-dev-ssm-ept-ssmmessages" # Name Tag
    env   = "dev"                          # Environment Tag
    Owner = "2313286"                      # Owner Tag
  }
}

# ============================================================
# EC2 Messages VPC Endpoint
# ============================================================
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ec2messages" {
  vpc_id              = aws_vpc.ecom_dev_vpc.id                    # VPC ID
  service_name        = "com.amazonaws.ap-northeast-2.ec2messages" # EC2 Messages service name
  vpc_endpoint_type   = "Interface"                                # Endpoint type
  private_dns_enabled = true                                       # Enable Private DNS

  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, # App Subnet 01
    aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  ]

  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id # SSM Endpoint SG
  ]

  tags = {
    Name  = "ecom-dev-ssm-ept-ec2messages" # Name Tag
    env   = "dev"                          # Environment Tag
    Owner = "2313286"                      # Owner Tag
  }
}

# ============================================================
# CloudWatch Logs VPC Endpoint
# ============================================================
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_logs" {
  vpc_id              = aws_vpc.ecom_dev_vpc.id             # VPC ID
  service_name        = "com.amazonaws.ap-northeast-2.logs" # CloudWatch Logs service name
  vpc_endpoint_type   = "Interface"                         # Endpoint type
  private_dns_enabled = true                                # Enable Private DNS

  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, # App Subnet 01
    aws_subnet.ecom_dev_app_subnet_02.id  # App Subnet 02
  ]

  security_group_ids = [
    aws_security_group.ecom_dev_ept_logs_sg.id # Logs Endpoint SG
  ]

  tags = {
    Name  = "ecom-dev-ssm-ept-logs" # Name Tag
    env   = "dev"                   # Environment Tag
    Owner = "2313286"               # Owner Tag
  }
}