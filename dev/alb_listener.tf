resource "aws_lb_listener" "ecom_dev_alb_listener_http" {
  load_balancer_arn = aws_lb.ecom_dev_alb.arn # ALB ARN
  port              = 80                      # ALB Listener Port
  protocol          = "HTTP"                  # ALB Listener Protocol

  default_action {
    type = "redirect" # ALB Listener Default Action Type

    redirect {
      port        = "443"      # ALB Listener Default Action Redirect Port
      protocol    = "HTTPS"    # ALB Listener Default Action Redirect Protocol
      status_code = "HTTP_301" # ALB Listener Default Action Redirect Status Code
    }
  }
}

resource "aws_lb_listener" "ecom_dev_alb_listener_https" {
  load_balancer_arn = aws_lb.ecom_dev_alb.arn # ALB ARN
  port              = 443                     # ALB Listener Port
  protocol          = "HTTPS"                 # ALB Listener Protocol

  ssl_policy      = "ELBSecurityPolicy-2016-08"                                     # ALB Listener SSL Policy
  certificate_arn = data.terraform_remote_state.persistent.outputs.ecom_dev_acm_arn # ALB Listener Certificate ARN

  default_action {
    type             = "forward"                               # ALB Listener Default Action Type
    target_group_arn = aws_lb_target_group.ecom_dev_alb_tg.arn # ALB Listener Default Action Target Group ARN
  }
}