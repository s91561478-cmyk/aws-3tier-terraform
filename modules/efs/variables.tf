# ============================================================
# App Subnet ID
# ============================================================
variable "app_subnet_ids" {
  description = "APP Subnet IDs"
  type        = list(string)
}

# ============================================================
# EFS Security Group ID
# ============================================================
variable "efs_sg_id" {
  description = "EFS Security Group ID"
  type        = string
}