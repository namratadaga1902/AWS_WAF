module "waf" {
  source = "./module"

  aws_region            = "us-east-1"
  web_acl_name          = "my-web-acl"
  web_acl_scope         = "REGIONAL"
  metric_name           = "my-web-acl-metrics"
  rate_limit            = 2000
  log_destination_configs = [
    "arn:aws:logs:us-east-1:123456789012:log-group:/aws/waf/logs"
  ]
  global_web_acl_name   = "my-global-web-acl"
}
