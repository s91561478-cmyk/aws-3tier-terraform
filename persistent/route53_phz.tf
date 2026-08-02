# Route53 Public Hosted Zone 생성
resource "aws_route53_zone" "ecom_dev_phz" {
  name = "jinsiklab.com"
  
  tags = {
    Name  = "ecom-dev-phz"
    env   = "dev"
    Owner = "2313286"
  }
}