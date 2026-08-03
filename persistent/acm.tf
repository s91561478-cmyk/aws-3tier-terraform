# ACM 인증서 작성
# 참고 https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
resource "aws_acm_certificate" "ecom_dev_acm" {
  domain_name       = "jinsiklab.com"                                       # 도메인 이름

  validation_method = "DNS"                                                 # DNS 검증을 사용
  key_algorithm = "RSA_2048"                                                # 키 알고리즘

  options {
    export = "DISABLED"                                                     # 인증서 내보내기 비활성화
  }
  
  lifecycle {
    create_before_destroy = true                                            # 새 인증서를 생성한 후 기존의 인증서를 삭제
  }

  tags = {
    Name = "ecom-dev-acm"                                                   # 이름태그
    env  = "dev"                                                            # 환경태그
    Owner = "2313286"                                                       # 소유자태그
  }
}

# ACM 인증서 DNS 검증 레코드 생성
# 참고 https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
resource "aws_route53_record" "ecom_dev_acm_dnsrecord" { 
  # ACM DNS 검증 정보를 dvo 변수로 반복 처리
  for_each = {
        for dvo in aws_acm_certificate.ecom_dev_acm.domain_validation_options :
    # Route53 레코드 생성을 위해 Map 형식으로 변환
    dvo.domain_name => {
      name   = dvo.resource_record_name                                     # 레코드 이름
      type   = dvo.resource_record_type                                     # 레코드 타입                
      record = dvo.resource_record_value                                    # 레코드 값    
    }
  }

  # Map 정보를 이용하여 Route53 레코드 생성
  zone_id = aws_route53_zone.ecom_dev_phz.zone_id                           # Route53 Hosted zone ID
  name    = each.value.name                                                 # 레코드 이름
  type    = each.value.type                                                 # 레코드 타입
  ttl     = 300                                                             # 레코드 TTL
  records = [each.value.record]                                             # 레코드 값
}

# ACM 인증서 DNS 검증 완료 대기
# 참고 https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation
resource "aws_acm_certificate_validation" "ecom_dev_acm_validation" {
  certificate_arn         = aws_acm_certificate.ecom_dev_acm.arn            # ACM 인증서 ARN
  validation_record_fqdns = [
    for record in aws_route53_record.ecom_dev_acm_dnsrecord : record.fqdn   # Route53 레코드 FQDN
  ]
}