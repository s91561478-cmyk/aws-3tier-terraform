# ============================================================
# CloudWatch Alarm - EC2 CPU Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_ec2_cpuutil80" {
  alarm_name          = "ecom-dev-cwalarm-ec2-cpuutil80"
  alarm_description   = "ecom-dev-cwalarm-ec2-cpuutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  namespace   = "AWS/EC2"        # EC2 Namespace
  metric_name = "CPUUtilization" # CPU Utilization
  statistic   = "Average"        # Average

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 80  # Threshold 80%

  dimensions = {
    AutoScalingGroupName = var.asg_name # Auto Scaling Group
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-ec2-cpuutil80" # Name Tag
    env   = "dev"                            # Environment Tag
    Owner = "2313286"                        # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - EC2 Memory Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_ec2_memutil80" {
  alarm_name          = "ecom-dev-cwalarm-ec2-memutil80"
  alarm_description   = "ecom-dev-cwalarm-ec2-memutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  namespace   = "ecom/dev"         # Custom Namespace
  metric_name = "mem_used_percent" # Memory Utilization
  statistic   = "Average"          # Average

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 80  # Threshold 80%

  dimensions = {
    AutoScalingGroupName = var.asg_name # Auto Scaling Group
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-ec2-memutil80" # Name Tag
    env   = "dev"                            # Environment Tag
    Owner = "2313286"                        # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - EC2 Disk Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_ec2_diskutil80" {
  alarm_name          = "ecom-dev-cwalarm-ec2-diskutil80"
  alarm_description   = "ecom-dev-cwalarm-ec2-diskutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  namespace   = "ecom/dev"          # Custom Namespace
  metric_name = "disk_used_percent" # Disk Utilization
  statistic   = "Average"           # Average

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 80  # Threshold 80%

  dimensions = {
    InstanceId = var.ec2_instance_id # EC2 Instance ID
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-ec2-diskutil80" # Name Tag
    env   = "dev"                             # Environment Tag
    Owner = "2313286"                         # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - RDS CPU Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_rds_cpuutil80" {
  alarm_name          = "ecom-dev-cwalarm-rds-cpuutil80"
  alarm_description   = "ecom-dev-cwalarm-rds-cpuutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  namespace   = "AWS/RDS"        # RDS Namespace
  metric_name = "CPUUtilization" # CPU Utilization
  statistic   = "Average"        # Average

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 80  # Threshold 80%

  dimensions = {
    DBInstanceIdentifier = var.rds_identifier # RDS DB Identifier
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-rds-cpuutil80" # Name Tag
    env   = "dev"                            # Environment Tag
    Owner = "2313286"                        # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - RDS Memory Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_rds_memutil80" {
  alarm_name          = "ecom-dev-cwalarm-rds-memutil80"
  alarm_description   = "ecom-dev-cwalarm-rds-memutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  evaluation_periods  = 2  # Evaluation Periods
  datapoints_to_alarm = 2  # Datapoints to Alarm
  threshold           = 80 # Threshold 80%

  # Memory Utilization
  metric_query {
    id          = "e1"
    expression  = "(1-m1/1073741824)*100" # Memory Utilization %
    label       = "Memory Utilization"
    return_data = true
  }

  # Freeable Memory
  metric_query {
    id          = "m1"
    return_data = false

    metric {
      namespace   = "AWS/RDS"        # RDS Namespace
      metric_name = "FreeableMemory" # Freeable Memory
      period      = 300              # 5 Minutes
      stat        = "Average"        # Average

      dimensions = {
        DBInstanceIdentifier = var.rds_identifier # RDS DB Identifier
      }
    }
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-rds-memutil80" # Name Tag
    env   = "dev"                            # Environment Tag
    Owner = "2313286"                        # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - RDS Disk Utilization
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_rds_diskutil80" {
  alarm_name          = "ecom-dev-cwalarm-rds-diskutil80"
  alarm_description   = "ecom-dev-cwalarm-rds-diskutil80"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  evaluation_periods  = 2  # Evaluation Periods
  datapoints_to_alarm = 2  # Datapoints to Alarm
  threshold           = 80 # Threshold 80%

  # Disk Utilization
  metric_query {
    id          = "e1"
    expression  = "(1-m1/21474836480)*100" # Disk Utilization %
    label       = "Disk Utilization"
    return_data = true
  }

  # Free Storage Space
  metric_query {
    id          = "m1"
    return_data = false

    metric {
      namespace   = "AWS/RDS"          # RDS Namespace
      metric_name = "FreeStorageSpace" # Free Storage Space
      period      = 300                # 5 Minutes
      stat        = "Average"          # Average

      dimensions = {
        DBInstanceIdentifier = var.rds_identifier # RDS DB Identifier
      }
    }
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "notBreaching" # Treat Missing Data as Not Breaching

  tags = {
    Name  = "ecom-dev-cwalarm-rds-diskutil80" # Name Tag
    env   = "dev"                             # Environment Tag
    Owner = "2313286"                         # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - ALB Healthy Host Count
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_alb_healthyhost" {
  alarm_name          = "ecom-dev-cwalarm-alb-healthyhost"
  alarm_description   = "ecom-dev-cwalarm-alb-healthyhost"
  comparison_operator = "LessThanOrEqualToThreshold" # Less Than or Equal to Threshold (<=)

  namespace   = "AWS/ApplicationELB" # ALB Namespace
  metric_name = "HealthyHostCount"   # Healthy Host Count
  statistic   = "Minimum"            # Minimum

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 1   # Threshold 1 Host

  dimensions = {
    LoadBalancer = var.alb_arn_suffix          # ALB ARN Suffix
    TargetGroup  = var.target_group_arn_suffix # Target Group ARN Suffix
  }

  alarm_actions = [
    var.sns_topic_arn # SNS Topic
  ]

  treat_missing_data = "missing" # Treat Missing Data as Missing

  tags = {
    Name  = "ecom-dev-cwalarm-alb-healthyhost" # Name Tag
    env   = "dev"                              # Environment Tag
    Owner = "2313286"                          # Owner Tag
  }
}

# ============================================================
# CloudWatch Alarm - ALB Target 5XX
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_alb_target5xx" {
  alarm_name          = "ecom-dev-cwalarm-alb-target5xx"
  alarm_description   = "ecom-dev-cwalarm-alb-target5xx"
  comparison_operator = "GreaterThanOrEqualToThreshold" # Greater Than or Equal to Threshold

  namespace   = "AWS/ApplicationELB"        # ALB Namespace
  metric_name = "HTTPCode_Target_5XX_Count" # Target 5XX Count
  statistic   = "Sum"                       # Sum

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 5   # Threshold 5 Requests

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
    TargetGroup  = var.target_group_arn_suffix
  }

  alarm_actions = [
    var.sns_topic_arn
  ]

  treat_missing_data = "notBreaching"

  tags = {
    Name  = "ecom-dev-cwalarm-alb-target5xx"
    env   = "dev"
    Owner = "2313286"
  }
}

# ============================================================
# CloudWatch Alarm - WAF Blocked Requests
# ============================================================
resource "aws_cloudwatch_metric_alarm" "ecom_dev_cwalarm_waf_blockedrequests" {
  alarm_name          = "ecom-dev-cwalarm-waf-blockedrequests"
  alarm_description   = "ecom-dev-cwalarm-waf-blockedrequests"
  comparison_operator = "GreaterThanOrEqualToThreshold"

  namespace   = "AWS/WAFV2"       # WAF Namespace
  metric_name = "BlockedRequests" # Blocked Requests
  statistic   = "Sum"             # Sum

  period              = 300 # 5 Minutes
  evaluation_periods  = 2   # Evaluation Periods
  datapoints_to_alarm = 2   # Datapoints to Alarm
  threshold           = 100 # Threshold 100 Requests

  dimensions = {
    WebACL = var.waf_web_acl_name
    Region = "ap-northeast-2" # Seoul Region
    Rule   = "ALL"
  }

  alarm_actions = [
    var.sns_topic_arn
  ]

  treat_missing_data = "notBreaching"

  tags = {
    Name  = "ecom-dev-cwalarm-waf-blockedrequests"
    env   = "dev"
    Owner = "2313286"
  }
}