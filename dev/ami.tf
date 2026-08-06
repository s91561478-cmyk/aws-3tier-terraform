# ecom-dev-ami
data "aws_ami" "ecom_dev_ami" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["ecom-dev-ami-*"]
  }
}