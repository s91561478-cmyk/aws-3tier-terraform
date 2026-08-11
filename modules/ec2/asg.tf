# ============================================================
# Auto Scaling Group
# ============================================================
resource "aws_autoscaling_group" "ecom_dev_asg" {
  name             = "ecom-dev-asg" # Auto Scaling Group name
  max_size         = 4              # Maximum capacity
  min_size         = 1              # Minimum capacity
  desired_capacity = 1              # Desired capacity

  vpc_zone_identifier = var.app_subnet_ids # App Subnet

  launch_template {
    id      = aws_launch_template.ecom_dev_app_lt.id # Launch Template ID
    version = "$Latest"                              # Latest version
  }

  target_group_arns = [
    var.target_group_arn # ALB Target Group
  ]

  health_check_type         = "ELB" # ELB health check
  health_check_grace_period = 300   # Health check grace period (seconds)

  tag {
    key                 = "Name"         # Name Tag
    value               = "ecom-dev-app" # Tag value
    propagate_at_launch = true           # Apply tag to EC2
  }

  tag {
    key                 = "env" # Environment Tag
    value               = "dev" # Tag value
    propagate_at_launch = true  # Apply tag to EC2
  }

  tag {
    key                 = "Owner"   # Owner Tag
    value               = "2313286" # Tag value
    propagate_at_launch = true      # Apply tag to EC2
  }
}