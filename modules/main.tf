provider "aws" {
  region = var.aws_region
}

# WAFv2 Web ACL creation
resource "aws_wafv2_web_acl" "example" {
  name        = var.web_acl_name
  scope       = var.web_acl_scope
  description = var.web_acl_description

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.metric_name
    sampled_requests_enabled   = true
  }

  rule {
    name     = "rate-limit-rule"
    priority = 1

    statement {
      rate_based_statement {
        aggregate_key_type = "IP"
        limit              = var.rate_limit
      }
    }

    action {
      block {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "rate-limit"
      sampled_requests_enabled   = true
    }
  }
}

# Enable WAFv2 Web ACL Logging
resource "aws_wafv2_web_acl_logging_configuration" "example_logging" {
  resource_arn            = aws_wafv2_web_acl.example.arn
  log_destination_configs = var.log_destination_configs
}

# WAF Classic Global Web ACL Logging (AWS WAF Classic)
resource "aws_waf_web_acl" "global_classic" {
  name        = var.global_web_acl_name
  metric_name = "globalWafMetrics"
  default_action {
    type = "ALLOW"
  }

  rules {
    action {
      type = "BLOCK"
    }
    priority = 1
    rule_id  = aws_waf_rule.example.id
  }
}

# Example rule for WAF Classic Global ACL
resource "aws_waf_rule" "example" {
  name        = "example-rule"
  metric_name = "examplemetrics"
}
