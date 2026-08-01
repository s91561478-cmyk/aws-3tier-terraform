# EFS 생성
resource "aws_efs_file_system" "ecom_dev_efs" {
    creation_token = "ecom-dev-efs"                                         # EFS 고유 이름
    encrypted = true                                                        # EFS 암호화
    lifecycle_policy {
        transition_to_ia = "AFTER_30_DAYS"                                  # 30일 이후 Infrequent Access(IA)로 전환
    }
    lifecycle_policy {
        transition_to_archive = "AFTER_90_DAYS"                             # 90일 이후 Archive로 전환
    }
    performance_mode = "generalPurpose"                                     # EFS 성능 모드
    throughput_mode = "elastic"                                             # EFS 처리량 모드

    tags = {
        Name = "ecom-dev-efs"                                               # EFS 이름태그
        env = "dev"                                                         # EFS 환경태그
        Owner = "2313286"                                                   # EFS 소유자태그
    }
}

# EFS Backup Policy 생성
resource "aws_efs_backup_policy" "ecom_dev_efs_backup_policy" {
    file_system_id = aws_efs_file_system.ecom_dev_efs.id

    backup_policy {
        status = "DISABLED"                                                  # EFS 자동백업 비활성화
    }
}

# EFS Mount Target 2a 생성
resource "aws_efs_mount_target" "ecom_dev_efs_mt_01" {
    file_system_id = aws_efs_file_system.ecom_dev_efs.id                    # EFS ID
    subnet_id = aws_subnet.ecom_dev_app_subnet_01.id                        # EFS Mount Target 서브넷
    security_groups = [
        aws_security_group.ecom_dev_efs_sg.id                               # EFS Mount Target 보안그룹
    ]
}

# EFS Mount Target 2c 생성
resource "aws_efs_mount_target" "ecom_dev_efs_mt_02" {
    file_system_id = aws_efs_file_system.ecom_dev_efs.id                    # EFS ID
    subnet_id = aws_subnet.ecom_dev_app_subnet_02.id                        # EFS Mount Target 서브넷
    security_groups = [
        aws_security_group.ecom_dev_efs_sg.id                               # EFS Mount Target 보안그룹
    ]
}