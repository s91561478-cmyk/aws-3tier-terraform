resource "aws_lb" "ecom_dev_alb" {
  name               = "ecom-dev-alb" # ALB Name
  internal           = false          # internet-facing
  load_balancer_type = "application"  # ALB Type
  security_groups = [
    aws_security_group.ecom_dev_alb_sg.id # ALB Security Group ID
  ]
  subnets = [
    aws_subnet.ecom_dev_pub_subnet_01.id, 
    aws_subnet.ecom_dev_pub_subnet_02.id # ALB Subnet ID
  ]

  tags = {
    Name  = "ecom-dev-alb" # name tag
    env   = "dev"          # environment tag
    Owner = "2313286"      # owner tag
  }
}