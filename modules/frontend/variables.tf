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