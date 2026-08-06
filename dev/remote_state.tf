# Persistent Terraform state 참조
data "terraform_remote_state" "persistent" {
  backend = "local" # local backend 사용

  config = {
    path = "${path.module}/../persistent/terraform.tfstate" # Persistent Terraform state 파일 경로
  }
}