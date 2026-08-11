# ============================================================
# ALB Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_alb_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id # ALB Security Group
  cidr_ipv4         = "0.0.0.0/0"                           # Allow to all IPv4
  ip_protocol       = "-1"                                  # All Protocols
}

# ============================================================
# App Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_app_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_app_sg.id # App Security Group
  cidr_ipv4         = "0.0.0.0/0"                           # Allow to all IPv4
  ip_protocol       = "-1"                                  # All Protocols
}

# ============================================================
# DB Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_db_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_db_sg.id # DB Security Group
  cidr_ipv4         = "0.0.0.0/0"                          # Allow to all IPv4
  ip_protocol       = "-1"                                 # All Protocols
}

# ============================================================
# SSM Endpoint Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_ept_ssm_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_ept_ssm_sg.id # SSM Endpoint Security Group
  cidr_ipv4         = "0.0.0.0/0"                               # Allow to all IPv4
  ip_protocol       = "-1"                                      # All Protocols
}

# ============================================================
# Logs Endpoint Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_ept_logs_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_ept_logs_sg.id # Logs Endpoint Security Group
  cidr_ipv4         = "0.0.0.0/0"                                # Allow to all IPv4
  ip_protocol       = "-1"                                       # All Protocols
}

# ============================================================
# EFS Egress Rule 01
# ============================================================
resource "aws_vpc_security_group_egress_rule" "ecom_dev_efs_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_efs_sg.id # EFS Security Group
  cidr_ipv4         = "0.0.0.0/0"                           # Allow to all IPv4
  ip_protocol       = "-1"                                  # All Protocols
}