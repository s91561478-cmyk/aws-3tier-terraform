# ============================================================
# WordPress Configuration Parameter
# ============================================================
resource "aws_ssm_parameter" "ecom_dev_wp_config" {
  name        = "/dev/wordpress/wp-config" # Parameter name
  description = "/dev/wordpress/wp-config" # Parameter description
  type        = "SecureString"             # Parameter type

  value = file("${path.module}/configuration/wp-config.php") # WordPress configuration file

  tags = {
    Name  = "/dev/wordpress/wp-config" # Name Tag
    env   = "dev"                      # Environment Tag
    Owner = "2313286"                  # Owner Tag
  }
}

# ============================================================
# CloudWatch Agent Configuration Parameter
# ============================================================
resource "aws_ssm_parameter" "ecom_dev_cloudwatch_agent_config" {
  name        = "/dev/cloudwatch-agent-config" # Parameter name
  description = "/dev/cloudwatch-agent-config" # Parameter description
  type        = "String"                       # Parameter type

  value = file("${path.module}/configuration/cloudwatch-agent-config.json") # CloudWatch Agent configuration file

  tags = {
    Name  = "/dev/cloudwatch-agent-config" # Name Tag
    env   = "dev"                          # Environment Tag
    Owner = "2313286"                      # Owner Tag
  }
}