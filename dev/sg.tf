# ecom-dev-app-sg 생성
resource "aws_security_group" "ecom_dev_app_sg" {
    name        = "ecom-dev-app-sg"
    description = "ecom-dev-app-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-app-sg"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-alb-sg 생성
resource "aws_security_group" "ecom_dev_alb_sg" {
    name        = "ecom-dev-alb-sg"
    description = "ecom-dev-alb-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-alb-sg"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-db-sg 생성
resource "aws_security_group" "ecom_dev_db_sg" {
    name        = "ecom-dev-db-sg"
    description = "ecom-dev-db-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id
    
    tags = {
        Name = "ecom-dev-db-sg"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-ept-ssm-sg 생성
resource "aws_security_group" "ecom_dev_ept_ssm_sg" {
    name        = "ecom-dev-ept-ssm-sg"
    description = "ecom-dev-ept-ssm-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-ept-ssm-sg"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-ept-logs-sg 생성
resource "aws_security_group" "ecom_dev_ept_logs_sg" {
    name        = "ecom-dev-ept-logs-sg"
    description = "ecom-dev-ept-logs-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-ept-logs-sg"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-ept-efs-sg 생성
resource "aws_security_group" "ecom_dev_efs_sg" {
    name        = "ecom-dev-ept-efs-sg"
    description = "ecom-dev-ept-efs-sg"
    vpc_id      = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-ept-efs-sg"
        env = "dev"
        Owner = "2313286"
    }
}