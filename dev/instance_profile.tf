# ecom-dev-ec2-instance-profile
resource "aws_iam_instance_profile" "ecom_dev_ec2_instance_profile" {
  name = "ecom-dev-ec2-instance-profile"
  role = aws_iam_role.ecom_dev_ec2_iamrole.name

  tags = {
    Name  = "ecom-dev-ec2-instance-profile"
    env   = "dev"
    Owner = "2313286"
  }
}