# ============================================================
# Auto Scaling Group Name
# ============================================================
variable "asg_name" {
  description = "Auto Scaling Group Name"
  type        = string
}

# ============================================================
# EC2 Instance ID
# ============================================================
variable "ec2_instance_id" {
  description = "EC2 Instance ID for disk alarm"
  type        = string
}

# ============================================================
# RDS Identifier
# ============================================================
variable "rds_identifier" {
  description = "RDS Identifier"
  type        = string
}

# ============================================================
# ALB ARN Suffix
# ============================================================
variable "alb_arn_suffix" {
  description = "ALB ARN Suffix"
  type        = string
}

# ============================================================
# Target Group Arn Suffix
# ============================================================
variable "target_group_arn_suffix" {
  description = "Target Group Arn Suffix"
  type        = string
}

# ============================================================
# WAF Web ACL Name
# ============================================================
variable "waf_web_acl_name" {
  description = "WAF Web ACL Name"
  type        = string
}

# ============================================================
# SNS Topic ARN
# ============================================================
variable "sns_topic_arn" {
  description = "SNS Topic ARN"
  type        = string
}