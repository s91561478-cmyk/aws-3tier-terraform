# ============================================================
# EFS File System
# ============================================================
resource "aws_efs_file_system" "ecom_dev_efs" {
  creation_token = "ecom-dev-efs" # EFS creation token
  encrypted      = true           # Enable EFS encryption

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS" # Transition to IA after 30 days
  }

  lifecycle_policy {
    transition_to_archive = "AFTER_90_DAYS" # Transition to Archive after 90 days
  }

  performance_mode = "generalPurpose" # Performance mode
  throughput_mode  = "elastic"        # Throughput mode

  tags = {
    Name  = "ecom-dev-efs" # Name Tag
    env   = "dev"          # Environment Tag
    Owner = "2313286"      # Owner Tag
  }
}