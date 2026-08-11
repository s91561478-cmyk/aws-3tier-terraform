# ============================================================
# EFS Backup Policy
# ============================================================
resource "aws_efs_backup_policy" "ecom_dev_efs_backup_policy" {
  file_system_id = aws_efs_file_system.ecom_dev_efs.id # EFS File System ID

  backup_policy {
    status = "DISABLED" # Disable automatic backup
  }
}