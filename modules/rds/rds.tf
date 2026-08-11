# ============================================================
# RDS MySQL Instance
# ============================================================
resource "aws_db_instance" "ecom_dev_db" {
  # ============================================================
  # Engine and Availability
  # ============================================================
  engine         = "mysql" # Database engine
  engine_version = "8.4.9" # MySQL engine version
  multi_az       = true    # Enable Multi-AZ deployment
  # ============================================================
  # Database Settings
  # ============================================================
  identifier = "ecom-dev-db"   # DB Instance identifier
  username   = "admin"         # Master username
  password   = var.db_password # Master password

  iam_database_authentication_enabled = false # Disable IAM DB authentication
  # ============================================================
  # Instance and Storage
  # ============================================================
  instance_class        = "db.t3.micro" # DB Instance class
  storage_type          = "gp3"         # Storage type
  allocated_storage     = 20            # Allocated storage (GiB)
  storage_encrypted     = true          # Enable storage encryption
  max_allocated_storage = 100           # Maximum storage (GiB)
  # ============================================================
  # Network
  # ============================================================
  db_subnet_group_name = aws_db_subnet_group.ecom_dev_db_subnet.name # DB Subnet Group
  publicly_accessible  = false                                       # Disable public access

  vpc_security_group_ids = [
    var.db_sg_id # DB Security Group
  ]

  port = 3306 # MySQL port
  # ============================================================
  # Monitoring
  # ============================================================
  database_insights_mode = "standard" # Database Insights mode

  monitoring_role_arn = aws_iam_role.ecom_dev_rds_monitoring_role.arn # Enhanced Monitoring IAM Role
  monitoring_interval = 60                                            # Monitoring interval (seconds)

  enabled_cloudwatch_logs_exports = [
    "error" # Export MySQL error logs
  ]
  # ============================================================
  # Database Configuration
  # ============================================================
  db_name              = "wordpress"        # Initial database name
  parameter_group_name = "default.mysql8.4" # DB Parameter Group
  # ============================================================
  # Backup and Maintenance
  # ============================================================
  backup_retention_period    = 7                     # Backup retention period (days)
  backup_window              = "17:00-17:30"         # Backup window (UTC)
  copy_tags_to_snapshot      = true                  # Copy tags to snapshots
  auto_minor_version_upgrade = true                  # Enable minor version upgrades
  maintenance_window         = "sat:16:00-sat:16:30" # Maintenance window (UTC)
  skip_final_snapshot        = true                  # Skip final snapshot on deletion
  deletion_protection        = true                  # Enable deletion protection
  # ============================================================
  # Tags
  # ============================================================
  tags = {
    Name  = "ecom-dev-db" # Name Tag
    env   = "dev"         # Environment Tag
    Owner = "2313286"     # Owner Tag
  }
}