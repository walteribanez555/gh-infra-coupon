variable "subnets" {
  description = "List of subnet IDs for the database"
  type        = list(string)
  default     = []
}

variable "tags" { 
  type = map(string)
  default = {
    "Environment" = "dev"
    "Project"     = "coupon-app"
  }
}


variable "vpc_id" {
  description = "VPC ID where the database will be deployed"
  type        = string
  default     = ""
  
}