provider "aws" {
  region = var.aws_region
}

# AWS WAFv2 Web ACL
resource "aws_wafv2_web_acl" "this" {
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

  dynamic "rule" {
    for_each = var.rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        block {}
      }

      statement {
        # Replace this with the appropriate statement type from the input
        rate_based_statement {
          limit              = rule.value.rate_limit
          aggregate_key_type = rule.value.aggregate_key_type
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = true
      }
    }
  }
}

# CloudWatch Log Group for WAF Logging
resource "aws_cloudwatch_log_group" "waf_log_group" {
  name = var.log_group_name
}
