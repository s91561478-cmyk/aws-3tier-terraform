# ============================================================
# EFS ID
# ============================================================
variable "efs_id" {
  description = "EFS ID"
  type        = string
}

# ============================================================
# App Subnet ID
# ============================================================
variable "app_subnet_ids" {
  description = "App Subnet IDs"
  type        = list(string)
}

# ============================================================
# App Security Group ID
# ============================================================
variable "app_sg_id" {
  description = "App Security Group ID"
  type        = string
}

# ============================================================
# Target group ARN
# ============================================================
variable "target_group_arn" {
  description = "Target Group ARN"
  type        = string
}