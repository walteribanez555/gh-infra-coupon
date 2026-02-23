resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-gw"
  }
}

locals {
  page_app = "s3-coupon-app-dashboard-bucket-redcard"
  tags = {
    Environment = "dev"
    Project     = "coupon-app"
  }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = local.tags
}

variable "subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

resource "aws_subnet" "public" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}


resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}



  
module "database" {
  source     = "./modules/database"
  subnets = aws_subnet.public.*.id
  tags       = local.tags
  vpc_id     = aws_vpc.main.id

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
    db_password = module.database.db_password
    db_username = module.database.db_username
    database_url = module.database.database_url
    
}