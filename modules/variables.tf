variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "web_acl_name" {
  description = "Name of the WAFv2 Web ACL"
  type        = string
}

variable "web_acl_scope" {
  description = "Scope of the WAFv2 Web ACL (REGIONAL or CLOUDFRONT)"
  type        = string
  default     = "REGIONAL"
}

variable "web_acl_description" {
  description = "Description of the WAFv2 Web ACL"
  type        = string
  default     = "AWS WAFv2 Web ACL"
}

variable "metric_name" {
  description = "CloudWatch metric name for the WAFv2 Web ACL"
  type        = string
}

variable "log_group_name" {
  description = "Name of the CloudWatch Log Group for WAF logs"
  type        = string
  default     = "/aws/waf/logs"
}

variable "rules" {
  description = "List of rules for the WAFv2 Web ACL"
  type = list(object({
    name              = string
    priority          = number
    metric_name       = string
    rate_limit        = number
    aggregate_key_type = string
  }))
  default = []
}
