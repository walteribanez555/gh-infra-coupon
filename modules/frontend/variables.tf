variable "bucketname" {
  default     = "frontend-static-page-bucket"
  description = "Bucket name for frontend page"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "dev"
    "Project"     = "coupon-app"
  }
}

variable "aliases" {
  description = "Custom domain aliases for CloudFront distribution"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN in us-east-1 for CloudFront custom domains"
  type        = string
  default     = null
}

variable "ssl_support_method" {
  description = "SSL support method for CloudFront when using custom certificate"
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "Minimum TLS protocol version for CloudFront viewer certificate"
  type        = string
  default     = "TLSv1.2_2021"
}