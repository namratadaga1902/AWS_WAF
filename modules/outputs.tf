output "web_acl_id" {
  description = "The ID of the WAF Web ACL."
  value       = aws_wafv2_web_acl.example.id
}

output "global_classic_web_acl_id" {
  description = "The ID of the WAF Classic Global Web ACL."
  value       = aws_waf_web_acl.global_classic.id
}
