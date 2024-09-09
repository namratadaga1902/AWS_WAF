variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "web_acl_name" {
  description = "The name of the WAF Web ACL."
  type        = string
  default     = "example-web-acl"
}

variable "web_acl_description" {
  description = "Description of the WAF Web ACL."
  type        = string
  default     = "Example WAF ACL with logging and CloudWatch metrics"
}

variable "web_acl_scope" {
  description = "Scope of the WAF Web ACL (REGIONAL or CLOUDFRONT)."
  type        = string
  default     = "REGIONAL"
}

variable "metric_name" {
  description = "CloudWatch metric name for WAF Web ACL."
  type        = string
  default     = "waf-metrics"
}

variable "rate_limit" {
  description = "The rate limit for the rate-based rule."
  type        = number
  default     = 1000
}

variable "log_destination_configs" {
  description = "List of ARNs for logging destinations (e.g., S3, CloudWatch Logs)."
  type        = list(string)
  default     = []
}

variable "global_web_acl_name" {
  description = "The name of the WAF Classic Global Web ACL."
  type        = string
  default     = "example-global-web-acl"
}
