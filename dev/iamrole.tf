# ecom-dev-ec2-iamrole 생성
resource "aws_iam_role" "ecom_dev_ec2_iamrole" {
  name = "ecom-dev-ec2-iamrole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  tags = {
    Name  = "ecom-dev-ec2-iamrole"
    env   = "dev"
    Owner = "2313286"
  }
}

# ecom-dev-ssm-parameter-read-policy 연결
resource "aws_iam_role_policy_attachment" "ecom_dev_ec2_ssm_attach" {
  role       = aws_iam_role.ecom_dev_ec2_iamrole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
# ecom-dev-cloudwatch-agent-policy 연결
resource "aws_iam_role_policy_attachment" "ecom_dev_ec2_cloudwatch_attach" {
  role       = aws_iam_role.ecom_dev_ec2_iamrole.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}