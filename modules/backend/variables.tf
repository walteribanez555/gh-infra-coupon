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

variable "database_url" {
  description = "Database connection URL"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

