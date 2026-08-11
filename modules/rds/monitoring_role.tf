# ============================================================
# RDS Monitoring IAM Role
# ============================================================
resource "aws_iam_role" "ecom_dev_rds_monitoring_role" {
  name = "ecom-dev-rds-monitoring-role" # IAM Role name

  assume_role_policy = jsonencode({
    Version = "2012-10-17" # IAM policy version

    Statement = [{
      Effect = "Allow" # Allow AssumeRole

      Principal = {
        Service = "monitoring.rds.amazonaws.com" # RDS Monitoring service
      }

      Action = "sts:AssumeRole" # Allow AssumeRole action
    }]
  })

  tags = {
    Name  = "ecom-dev-rds-monitoring-role" # Name Tag
    env   = "dev"                          # Environment Tag
    Owner = "2313286"                      # Owner Tag
  }
}

# ============================================================
# RDS Monitoring Policy Attachment
# ============================================================
resource "aws_iam_role_policy_attachment" "ecom_dev_rds_monitoring_attachment" {
  role       = aws_iam_role.ecom_dev_rds_monitoring_role.name                         # IAM Role name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole" # Managed Policy ARN
}