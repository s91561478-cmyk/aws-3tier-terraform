resource "aws_autoscaling_group" "ecom_dev_asg" {
  name = "ecom-dev-asg"
  max_size = 4
  min_size = 1
  desired_capacity = 1 # 나중에 2로 변경
  vpc_zone_identifier = [
    aws_subnet.ecom_dev_app_subnet_01.id, 
    aws_subnet.ecom_dev_app_subnet_02.id
  ]
  launch_template {
    id      = aws_launch_template.ecom_dev_app_lt.id
    version = "$Latest"
  }
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "ecom-dev-app"
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = "dev"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "2313286"
    propagate_at_launch = true
  }
}