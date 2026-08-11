# ============================================================
# DB Subnet ID
# ============================================================
variable "db_subnet_ids" {
    description = "DB Subnet IDs"
    type = list(string)
}

# ============================================================
# DB Security Group
# ============================================================
variable "db_sg_id" {
    description= "DB Security Group ID"
    type = string
}

# ============================================================
# DB Password
# ============================================================
variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}