# ============================================================
# HTTP Listener
# ============================================================
resource "aws_lb_listener" "ecom_dev_alb_listener_http" {
  load_balancer_arn = aws_lb.ecom_dev_alb.arn # ALB ARN
  port              = 80                      # Listener port
  protocol          = "HTTP"                  # Listener protocol

  default_action {
    type = "redirect" # Default action type

    redirect {
      port        = "443"      # Redirect port
      protocol    = "HTTPS"    # Redirect protocol
      status_code = "HTTP_301" # Redirect status code
    }
  }
}

# ============================================================
# HTTPS Listener
# ============================================================
resource "aws_lb_listener" "ecom_dev_alb_listener_https" {
  load_balancer_arn = aws_lb.ecom_dev_alb.arn # ALB ARN
  port              = 443                     # Listener port
  protocol          = "HTTPS"                 # Listener protocol

  ssl_policy      = "ELBSecurityPolicy-2016-08" # SSL policy
  certificate_arn = var.acm_certificate_arn     # ACM Certificate ARN

  default_action {
    type             = "forward"                               # Default action type
    target_group_arn = aws_lb_target_group.ecom_dev_alb_tg.arn # Target Group ARN
  }
}