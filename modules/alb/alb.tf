# ============================================================
# Application Load Balancer
# ============================================================
resource "aws_lb" "ecom_dev_alb" {
  name               = "ecom-dev-alb" # Load Balancer name
  internal           = false          # Internet-facing Load Balancer
  load_balancer_type = "application"  # Application Load Balancer

  security_groups = [
    var.alb_sg_id # ALB Security Group
  ]

  subnets = var.public_subnet_ids # Public Subnets

  tags = {
    Name  = "ecom-dev-alb" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}