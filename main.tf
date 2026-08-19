# ============================================================
# VPC Module
# ============================================================
module "vpc" {
  source = "./modules/vpc"
}

# ============================================================
# ALB Module
# ============================================================
module "alb" {
  source = "./modules/alb"

  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  alb_sg_id           = module.vpc.alb_sg_id
  acm_certificate_arn = module.acm.acm_certificate_arn
}

# ============================================================
# ACM Module
# ============================================================
module "acm" {
  source = "./modules/acm"

  route53_zone_id = module.route53.route53_zone_id
}

# ============================================================
# Route53 Module
# ============================================================
module "route53" {
  source = "./modules/route53"
}

# ============================================================
# Route53 Record Module
# ============================================================
module "route53_record" {
  source = "./modules/route53_record"

  route53_zone_id = module.route53.route53_zone_id
  alb_zone_id     = module.alb.alb_zone_id
  alb_dns_name    = module.alb.alb_dns_name
}

# ============================================================
# EFS Module
# ============================================================
module "efs" {
  source = "./modules/efs"

  app_subnet_ids = module.vpc.app_subnet_ids
  efs_sg_id      = module.vpc.efs_sg_id
}

# ============================================================
# ec2 Module
# ============================================================
module "ec2" {
  source = "./modules/ec2"

  efs_id           = module.efs.efs_id
  app_subnet_ids   = module.vpc.app_subnet_ids
  app_sg_id        = module.vpc.app_sg_id
  target_group_arn = module.alb.target_group_arn
}

# ============================================================
# rds Module
# ============================================================
module "rds" {
  source = "./modules/rds"

  db_subnet_ids = module.vpc.db_subnet_ids
  db_sg_id      = module.vpc.db_sg_id
  db_password   = var.db_password
}

# ============================================================
# SSM Module
# ============================================================
module "ssm" {
  source = "./modules/ssm"
}

# ============================================================
# WAF Module
# ============================================================
module "waf" {
  source = "./modules/waf"

  waf_admin_ip_address = var.waf_admin_ip_address
  alb_arn              = module.alb.alb_arn
}

# ============================================================
# SNS Module
# ============================================================
module "sns" {
  source = "./modules/sns"

  sns_email = var.sns_email
}

# ============================================================
# CloudWatch Module
# ============================================================
module "cloudwatch" {
  source = "./modules/cloudwatch"

  asg_name                = module.ec2.asg_name
  ec2_instance_id         = var.ec2_instance_id
  rds_identifier          = module.rds.rds_identifier
  target_group_arn_suffix = module.alb.target_group_arn_suffix
  alb_arn_suffix          = module.alb.alb_arn_suffix
  waf_web_acl_name        = module.waf.waf_web_acl_name
  sns_topic_arn           = module.sns.sns_topic_arn
}