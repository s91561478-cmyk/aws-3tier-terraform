# ============================================================
# App Launch Template
# ============================================================
resource "aws_launch_template" "ecom_dev_app_lt" {
  name = "ecom-dev-app-lt" # Launch Template name

  image_id      = data.aws_ami.ecom_dev_ami.id # AMI ID
  instance_type = "t3.small"                   # Instance type

  iam_instance_profile {
    name = aws_iam_instance_profile.ecom_dev_ec2_instance_profile.name # IAM Instance Profile
  }

  vpc_security_group_ids = [
    var.app_sg_id # App Security Group
  ]

  metadata_options {
    http_endpoint = "enabled"  # Enable IMDS
    http_tokens   = "required" # Require IMDSv2
  }

  block_device_mappings {
    device_name = "/dev/xvda" # Root device name

    ebs {
      volume_size           = 8     # Volume size (GiB)
      volume_type           = "gp3" # EBS volume type
      iops                  = 3000  # EBS IOPS
      throughput            = 125   # EBS throughput (MB/s)
      delete_on_termination = true  # Delete EBS with EC2
      encrypted             = true  # Enable EBS encryption
    }
  }

  user_data = base64encode(
    templatefile("${path.module}/userdata/app_userdata.sh", {
      efs_id = var.efs_id # EFS ID
    })
  )
}