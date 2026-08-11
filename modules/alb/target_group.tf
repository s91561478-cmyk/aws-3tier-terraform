# ============================================================
# ALB Target Group
# ============================================================
resource "aws_lb_target_group" "ecom_dev_alb_tg" {
  name        = "ecom-dev-alb-tg" # Target Group name
  port        = 80                # Target Group port
  protocol    = "HTTP"            # Target Group protocol
  target_type = "instance"        # Target type
  vpc_id      = var.vpc_id        # VPC ID

  health_check {
    path                = "/"       # Health check path
    interval            = 30        # Health check interval (seconds)
    timeout             = 5         # Health check timeout (seconds)
    healthy_threshold   = 2         # Healthy threshold
    unhealthy_threshold = 2         # Unhealthy threshold
    matcher             = "200-399" # Healthy HTTP status codes
  }

  tags = {
    Name  = "ecom-dev-alb-tg" # Name Tag
    env   = "dev"             # Environment Tag
    Owner = "2313286"         # Owner Tag
  }
}