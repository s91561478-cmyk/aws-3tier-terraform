# ============================================================
# WAF Web ACL
# ============================================================
resource "aws_wafv2_web_acl" "ecom_dev_waf_webacl" {
  name        = "ecom-dev-waf-webacl"
  description = "ecom-dev-waf-webacl"
  scope       = "REGIONAL" # Regional Scope

  # Default Action
  default_action {
    allow {} # Allow Requests
  }

  # ============================================================
  # Core Rule Set
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 10

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # Known Bad Inputs
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 20

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # SQL Injection
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesSQLiRuleSet"
    priority = 30

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # PHP Application
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesPHPRuleSet"
    priority = 40

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesPHPRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesPHPRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # Amazon IP Reputation List
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 50

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # WordPress Application
  # ============================================================
  rule {
    name     = "AWS-AWSManagedRulesWordPressRuleSet"
    priority = 60

    override_action {
      none {} # Use Default Action
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesWordPressRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesWordPressRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # WordPress Admin Access
  # ============================================================
  rule {
    name     = "ecom-dev-waf-admin-access"
    priority = 70

    action {
      block {} # Block Requests
    }

    statement {
      and_statement {

        # Not Allowed Admin IP
        statement {
          not_statement {
            statement {
              ip_set_reference_statement {
                arn = aws_wafv2_ip_set.ecom_dev_waf_ipset_admin.arn
              }
            }
          }
        }

        # WordPress Admin URI
        statement {
          byte_match_statement {
            search_string         = "/wp-admin"
            positional_constraint = "STARTS_WITH"

            field_to_match {
              uri_path {}
            }

            text_transformation {
              priority = 0
              type     = "NONE"
            }
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "ecom-dev-waf-admin-access"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # Geo Match - Japan Only
  # ============================================================
  rule {
    name     = "ecom-dev-waf-geo-japan-only"
    priority = 80

    action {
      block {} # Block Requests
    }

    statement {
      not_statement {
        statement {
          geo_match_statement {
            country_codes = ["JP"] # Japan
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "ecom-dev-waf-geo-japan-only"
      sampled_requests_enabled   = true
    }
  }

  # ============================================================
  # Visibility Configuration
  # ============================================================
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "ecom-dev-waf-webacl"
    sampled_requests_enabled   = true
  }

  tags = {
    Name  = "ecom-dev-waf-webacl" # Name Tag
    env   = "dev"                 # Environment Tag
    Owner = "2313286"             # Owner Tag
  }
}

# ============================================================
# WAF Web ACL Association
# ============================================================
resource "aws_wafv2_web_acl_association" "ecom_dev_waf_webacl_association" {
  web_acl_arn  = aws_wafv2_web_acl.ecom_dev_waf_webacl.arn # WAF Web ACL ARN
  resource_arn = var.alb_arn # ALB ARN
}