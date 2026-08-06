resource "aws_lb_target_group" "ecom_dev_alb_tg" {
  name        = "ecom-dev-alb-tg"       # Target Group Name
  port        = 80                      # target group port
  protocol    = "HTTP"                  # target group protocol
  target_type = "instance"              # target type
  vpc_id      = aws_vpc.ecom_dev_vpc.id # target group vpc id

  health_check {
    path                = "/"
    interval            = 30        # health check interval
    timeout             = 5         # health check timeout
    healthy_threshold   = 2         # healthy threshold
    unhealthy_threshold = 2         # unhealthy threshold
    matcher             = "200-399" # health check matcher
  }

  tags = {
    Name  = "ecom-dev-alb-tg" # name tag
    env   = "dev"             # environment tag 
    Owner = "2313286"         # owner tag
  }
}