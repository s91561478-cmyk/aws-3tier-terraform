# ============================================================
# EFS File System ID
# ============================================================
output "efs_id" {
  description = "EFS ID"                # Output description
  value       = aws_efs_file_system.ecom_dev_efs.id # EFS ID
}