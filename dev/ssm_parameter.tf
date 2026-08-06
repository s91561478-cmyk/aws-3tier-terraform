# WordPress 설정 파일을 SSM Parameter Store에 저장
resource "aws_ssm_parameter" "ecom_dev_wp_config" {
  name        = "/dev/wordpress/wp-config" # SSM Parameter 이름
  description = "/dev/wordpress/wp-config" # SSM Parameter 설명
  type        = "SecureString"             # SSM Parameter 유형

  value = file("${path.module}/configuration/wp-config.php") # SSM Parameter 파일 경로

  tags = {
    Name  = "/dev/wordpress/wp-config" # SSM Parameter 이름태그
    env   = "dev"                      # SSM Parameter 환경태그
    Owner = "2313286"                  # SSM Parameter 소유자태그
  }
}
# CloudWatch Agent 설정 파일을 SSM Parameter Store에 저장
resource "aws_ssm_parameter" "ecom_dev_cloudwatch_agent_config" {
  name        = "/dev/cloudwatch-agent-config" # SSM Parameter 이름
  description = "/dev/cloudwatch-agent-config" # SSM Parameter 설명
  type        = "String"                       # SSM Parameter 유형

  value = file("${path.module}/configuration/cloudwatch-agent-config.json") # SSM Parameter 파일 경로

  tags = {
    Name  = "/dev/cloudwatch-agent-config" # SSM Parameter 이름태그
    env   = "dev"                          # SSM Parameter 환경태그
    Owner = "2313286"                      # SSM Parameter 소유자태그
  }
}