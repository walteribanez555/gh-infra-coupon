resource "random_password" "db_username" {
  length  = 12
  special = false
  upper   = true
  lower   = true
  numeric  = true
}

resource "random_password" "db_password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
  numeric  = true
}
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnets

    tags = var.tags
}

resource "aws_security_group" "allow_postgres_traffic" {
  name        = "allow_postgres"
  description = "Allow Postgres traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow Postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow postgres"
  }
}

resource "aws_db_instance" "db-test1" {
  allocated_storage      = 10
  identifier             = "postgres-test2"
  db_name = "coupondb"
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "postgres"
  engine_version         = "14"
  instance_class         = "db.t3.micro"
  username               = random_password.db_username.result
  password               = random_password.db_password.result
  vpc_security_group_ids = [aws_security_group.allow_postgres_traffic.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}