# ============================================================
# ALB Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_alb_sg_ingress_01" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id # ALB Security Group
  cidr_ipv4         = "0.0.0.0/0"                           # Allow from Internet
  from_port         = 80                                    # HTTP Port
  ip_protocol       = "tcp"                                 # TCP Protocol
  to_port           = 80                                    # HTTP Port
}

# ============================================================
# ALB Ingress Rule 02
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_alb_sg_ingress_02" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id # ALB Security Group
  cidr_ipv4         = "0.0.0.0/0"                           # Allow from Internet
  from_port         = 443                                   # HTTPS Port
  ip_protocol       = "tcp"                                 # TCP Protocol
  to_port           = 443                                   # HTTPS Port
}

# ============================================================
# App Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_app_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_app_sg.id # App Security Group
  referenced_security_group_id = aws_security_group.ecom_dev_alb_sg.id # ALB Security Group
  from_port                    = 80                                    # HTTP Port
  ip_protocol                  = "tcp"                                 # TCP Protocol
  to_port                      = 80                                    # HTTP Port
}

# ============================================================
# DB Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_db_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_db_sg.id  # DB Security Group
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id # App Security Group
  from_port                    = 3306                                  # MySQL Port
  ip_protocol                  = "tcp"                                 # TCP Protocol
  to_port                      = 3306                                  # MySQL Port
}

# ============================================================
# SSM Endpoint Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_ept_ssm_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_ept_ssm_sg.id # SSM Endpoint Security Group
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id     # App Security Group
  from_port                    = 443                                       # HTTPS Port
  ip_protocol                  = "tcp"                                     # TCP Protocol
  to_port                      = 443                                       # HTTPS Port
}

# ============================================================
# Logs Endpoint Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_ept_logs_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_ept_logs_sg.id # Logs Endpoint Security Group
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id      # App Security Group
  from_port                    = 443                                        # HTTPS Port
  ip_protocol                  = "tcp"                                      # TCP Protocol
  to_port                      = 443                                        # HTTPS Port
}

# ============================================================
# EFS Ingress Rule 01
# ============================================================
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_efs_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_efs_sg.id # EFS Security Group
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id # App Security Group
  from_port                    = 2049                                  # NFS Port
  ip_protocol                  = "tcp"                                 # TCP Protocol
  to_port                      = 2049                                  # NFS Port
}