# ============================================================
# EC2 IAM Role
# ============================================================
resource "aws_iam_role" "ecom_dev_ec2_iamrole" {
  name = "ecom-dev-ec2-iamrole" # IAM Role name

  assume_role_policy = jsonencode({
    Version = "2012-10-17" # IAM policy version

    Statement = [
      {
        Effect = "Allow" # Allow AssumeRole

        Principal = {
          Service = "ec2.amazonaws.com" # EC2 service
        }

        Action = "sts:AssumeRole" # Allow AssumeRole action
      }
    ]
  })

  tags = {
    Name  = "ecom-dev-ec2-iamrole" # Name Tag
    env   = "dev"                  # Environment Tag
    Owner = "2313286"              # Owner Tag
  }
}

# ============================================================
# SSM Managed Instance Policy Attachment
# ============================================================
resource "aws_iam_role_policy_attachment" "ecom_dev_ec2_ssm_attach" {
  role       = aws_iam_role.ecom_dev_ec2_iamrole.name              # IAM Role name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" # Managed Policy ARN
}

# ============================================================
# CloudWatch Agent Policy Attachment
# ============================================================
resource "aws_iam_role_policy_attachment" "ecom_dev_ec2_cloudwatch_attach" {
  role       = aws_iam_role.ecom_dev_ec2_iamrole.name            # IAM Role name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy" # Managed Policy ARN
}