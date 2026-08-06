# ecom-dev-alb-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_alb_sg_ingress_01" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# ecom-dev-alb-ingress-02
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_alb_sg_ingress_02" {
  security_group_id = aws_security_group.ecom_dev_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# ecom-dev-app-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_app_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_app_sg.id
  referenced_security_group_id = aws_security_group.ecom_dev_alb_sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

# ecom-dev-db-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_db_sg_ingress_01" {
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id
  security_group_id            = aws_security_group.ecom_dev_db_sg.id
  from_port                    = 3306
  ip_protocol                  = "tcp"
  to_port                      = 3306
}

# ecom-dev-ept-ssm-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_ept_ssm_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_ept_ssm_sg.id
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id
  from_port                    = 443
  ip_protocol                  = "tcp"
  to_port                      = 443
}

# ecom-dev-ept-logs-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_ept_logs_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_ept_logs_sg.id
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id
  from_port                    = 443
  ip_protocol                  = "tcp"
  to_port                      = 443
}

# ecom-dev-efs-ingress-01
resource "aws_vpc_security_group_ingress_rule" "ecom_dev_efs_sg_ingress_01" {
  security_group_id            = aws_security_group.ecom_dev_efs_sg.id
  referenced_security_group_id = aws_security_group.ecom_dev_app_sg.id
  from_port                    = 2049
  ip_protocol                  = "tcp"
  to_port                      = 2049
}