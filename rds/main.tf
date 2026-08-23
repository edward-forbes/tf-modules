data "aws_rds_engine_version" "web-db-version" {
  engine       = "postgres"
  version      = "16"
  default_only = true
}

data "aws_secretsmanager_secret" "web-db-creds" {
  name = var.web-db-creds-secret
}

data "aws_secretsmanager_secret_version" "web-db-creds" {
  secret_id = data.aws_secretsmanager_secret.web-db-creds.id
}

locals {
  db_credentials = jsondecode(
    data.aws_secretsmanager_secret_version.web-db-creds.secret_string
  )
}

resource "aws_db_subnet_group" "web_db" {
  name       = "${var.project}-web-db"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project}-Web-DB"
  }
}

resource "aws_db_instance" "web_db" {
  vpc_security_group_ids  = [var.private_security_group_id]
  db_subnet_group_name    = aws_db_subnet_group.web_db.name
  allocated_storage       = var.web_db_allocated_storage
  max_allocated_storage   = var.web_db_max_allocated_storage
  backup_retention_period = var.web_db_retention_period
  db_name                 = var.db_name
  engine                  = data.aws_rds_engine_version.web-db-version.engine
  engine_version          = data.aws_rds_engine_version.web-db-version.version
  instance_class          = var.web_db_instance_type
  username                = local.db_credentials.username
  password                = local.db_credentials.password
  deletion_protection     = true
  multi_az                = true

  tags = {
    Name = "${var.project}-DB-Web"
  }

  lifecycle {
    prevent_destroy = true
  }
}