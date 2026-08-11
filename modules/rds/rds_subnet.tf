# ============================================================
# RDS DB Subnet Group
# ============================================================
resource "aws_db_subnet_group" "ecom_dev_db_subnet" {
  name        = "ecom-dev-db-subnet" # DB Subnet Group name
  description = "ecom-dev-db-subnet" # DB Subnet Group description

  subnet_ids = var.db_subnet_ids # DB Subnet

  tags = {
    Name  = "ecom-dev-db-subnet" # Name Tag
    env   = "dev"                # Environment Tag
    Owner = "2313286"            # Owner Tag
  }
}