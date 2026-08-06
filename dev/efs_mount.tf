# EFS Mount Target 2a 생성
resource "aws_efs_mount_target" "ecom_dev_efs_mt_01" {
  file_system_id = data.terraform_remote_state.persistent.outputs.ecom_dev_efs_id # EFS ID
  subnet_id      = aws_subnet.ecom_dev_app_subnet_01.id                           # EFS Mount Target 서브넷
  security_groups = [
    aws_security_group.ecom_dev_efs_sg.id # EFS Mount Target 보안그룹
  ]
}

# EFS Mount Target 2c 생성
resource "aws_efs_mount_target" "ecom_dev_efs_mt_02" {
  file_system_id = data.terraform_remote_state.persistent.outputs.ecom_dev_efs_id # EFS ID
  subnet_id      = aws_subnet.ecom_dev_app_subnet_02.id                           # EFS Mount Target 서브넷
  security_groups = [
    aws_security_group.ecom_dev_efs_sg.id # EFS Mount Target 보안그룹
  ]
}