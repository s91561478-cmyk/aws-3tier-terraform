resource "aws_launch_template" "ecom_dev_app_lt" {
  name = "ecom-dev-app-lt" # Launch Template 이름

  image_id      = data.aws_ami.ecom_dev_ami.id # ASG에서 사용할 AMI
  instance_type = "t3.micro"                   # EC2 인스턴스 타입
  iam_instance_profile {
    name = aws_iam_instance_profile.ecom_dev_ec2_instance_profile.name # EC2에 연결할 IAM 인스턴스 프로파일
  }
  vpc_security_group_ids = [
    aws_security_group.ecom_dev_app_sg.id # EC2에 연결할 보안그룹
  ]
  metadata_options {           # Instance Metadata Service(IMDS) 설정
    http_endpoint = "enabled"  # IMDS 활성화
    http_tokens   = "required" # IMDSv2만 허용 (IMDSv1 차단)
  }
  block_device_mappings { # 루트 EBS 볼륨 설정
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 8     # 8GiB
      volume_type           = "gp3" # GP3 SSD
      iops                  = 3000  # 기본 IOPS
      throughput            = 125   # 기본 처리량(MB/s)
      delete_on_termination = true  # EC2 삭제 시 EBS도 함께 삭제
      encrypted             = true  # EBS 암호화
    }
  }
  user_data = base64encode(
    templatefile("${path.module}/userdata/app_userdata.sh", {                 # EC2 유저 데이터
      efs_id = data.terraform_remote_state.persistent.outputs.ecom_dev_efs_id # EFS ID 전달
    })
  )
}