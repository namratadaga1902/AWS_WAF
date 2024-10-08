module "aws_waf_web_acl" {
  source = "./webacl"

  aws_region           = "us-east-1"
  web_acl_name         = "my-wafv2-web-acl"
  web_acl_scope        = "REGIONAL"
  metric_name          = "my-waf-metric"
  log_group_name       = "test"

  rules = [
    {
      name              = "rate-limit-rule"
      priority          = 1
      metric_name       = "rate-limit-metric"
      rate_limit        = 2000
      aggregate_key_type = "IP"
    }
  ]
}
