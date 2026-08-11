# ============================================================
# EFS Mount Target 01
# ============================================================
resource "aws_efs_mount_target" "ecom_dev_efs_mt_01" {
  file_system_id = aws_efs_file_system.ecom_dev_efs.id # EFS File System ID
  subnet_id      = var.app_subnet_ids[0]               # App Subnet 01

  security_groups = [
    var.efs_sg_id # EFS Security Group
  ]
}

# ============================================================
# EFS Mount Target 02
# ============================================================
resource "aws_efs_mount_target" "ecom_dev_efs_mt_02" {
  file_system_id = aws_efs_file_system.ecom_dev_efs.id # EFS File System ID
  subnet_id      = var.app_subnet_ids[1]               # App Subnet 02

  security_groups = [
    var.efs_sg_id # EFS Security Group
  ]
}