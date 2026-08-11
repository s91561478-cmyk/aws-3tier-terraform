# ============================================================
# EC2 AMI
# ============================================================
data "aws_ami" "ecom_dev_ami" {
  most_recent = true     # Use the most recent AMI
  owners      = ["self"] # Use AMIs owned by this account

  filter {
    name   = "name"             # Filter by AMI name
    values = ["ecom-dev-ami-*"] # AMI name pattern
  }
}