# ============================================================
# EC2 Instance Profile
# ============================================================
resource "aws_iam_instance_profile" "ecom_dev_ec2_instance_profile" {
  name = "ecom-dev-ec2-instance-profile"        # Instance Profile name
  role = aws_iam_role.ecom_dev_ec2_iamrole.name # IAM Role name

  tags = {
    Name  = "ecom-dev-ec2-instance-profile" # Name Tag
    env   = "dev"                           # Environment Tag
    Owner = "2313286"                       # Owner Tag
  }
}