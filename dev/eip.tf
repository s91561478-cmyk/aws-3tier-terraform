# ecom-dev-eip-01 생성
resource "aws_eip" "ecom_dev_eip_01" {
  domain = "vpc"

  tags = {
    Name  = "ecom-dev-eip-01"
    env   = "dev"
    Owner = "2313286"
  }
}

# ecom-dev-eip-02 생성
resource "aws_eip" "ecom_dev_eip_02" {
  domain = "vpc"

  tags = {
    Name  = "ecom-dev-eip-02"
    env   = "dev"
    Owner = "2313286"
  }
}