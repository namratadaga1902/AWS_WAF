output "wafv2_web_acl_arn" {
  description = "The ARN of the WAFv2 Web ACL"
  value       = aws_wafv2_web_acl.this.arn
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for WAF logging"
  value       = aws_cloudwatch_log_group.waf_log_group.arn
}
