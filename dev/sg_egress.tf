# ecom-dev-alb-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_alb_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ecom-dev-app-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_app_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ecom-dev-db-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_db_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_db_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ecom-dev-ept-ssm-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_ept_ssm_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_ept_ssm_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ecom-dev-ept-logs-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_ept_logs_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_ept_logs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ecom-dev-efs-egress-01
resource "aws_vpc_security_group_egress_rule" "ecom_dev_efs_sg_egress_01" {
  security_group_id = aws_security_group.ecom_dev_efs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}