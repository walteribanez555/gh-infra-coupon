locals {
  page_app = "s3-coupon-app-dashboard-bucket-redcard"
  tags = {
    Environment = "dev"
    Project     = "coupon-app"
  }
}

module "frontend" {
  source = "./modules/frontend"
    bucketname = local.page_app
    tags       = local.tags
}

module "backend" {
  source = "./modules/backend"
    service_name = "coupon-app-backend"
    tags         = local.tags
    apigw_log_retention = 1
}