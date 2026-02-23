variable "service_name" {
  default     = "coupon-app-backend"
  description = "Service name for backend"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "dev"
    "Project"     = "coupon-app"
  }
}

variable "apigw_log_retention" {
  description = "api gwy log retention in days"
  type        = number
  default     = 1
}