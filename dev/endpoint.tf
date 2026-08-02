# ssm endpoint 생성
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ssm" {
  vpc_id            = aws_vpc.ecom_dev_vpc.id
  service_name      = "com.amazonaws.ap-northeast-2.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, 
    aws_subnet.ecom_dev_app_subnet_02.id
  ]
  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id
  ]
  private_dns_enabled = true

  tags = {
    Name  = "ecom-dev-ssm-ept-ssm"
    env   = "dev"
    Owner = "2313286"
  }
}
# ssm messages endpoint 생성
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ssmmessages" {
  vpc_id            = aws_vpc.ecom_dev_vpc.id
  service_name      = "com.amazonaws.ap-northeast-2.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, 
    aws_subnet.ecom_dev_app_subnet_02.id
  ]
  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id
  ]
  private_dns_enabled = true

  tags = {
    Name  = "ecom-dev-ssm-ept-ssmmessages"
    env   = "dev"
    Owner = "2313286"
  }
}
# ec2 messages endpoint 생성
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_ec2messages" {
  vpc_id            = aws_vpc.ecom_dev_vpc.id
  service_name      = "com.amazonaws.ap-northeast-2.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, 
    aws_subnet.ecom_dev_app_subnet_02.id
  ]
  security_group_ids = [
    aws_security_group.ecom_dev_ept_ssm_sg.id
  ]
  private_dns_enabled = true

  tags = {
    Name  = "ecom-dev-ssm-ept-ec2messages"
    env   = "dev"
    Owner = "2313286"
  }
}
# logs endpoint 생성
resource "aws_vpc_endpoint" "ecom_dev_ssm_ept_logs" {
  vpc_id            = aws_vpc.ecom_dev_vpc.id
  service_name      = "com.amazonaws.ap-northeast-2.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids = [
    aws_subnet.ecom_dev_app_subnet_01.id, 
    aws_subnet.ecom_dev_app_subnet_02.id
  ]
  security_group_ids = [
    aws_security_group.ecom_dev_ept_logs_sg.id
  ]
  private_dns_enabled = true

  tags = {
    Name  = "ecom-dev-ssm-ept-logs"
    env   = "dev"
    Owner = "2313286"
  }
}