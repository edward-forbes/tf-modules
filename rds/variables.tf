variable "project" {
  type = string
}

variable "web_db_allocated_storage" {
  type    = number
  default = 10
}

variable "web_db_max_allocated_storage" {
  type    = number
  default = 100
}

variable "web_db_retention_period" {
  type    = number
  default = 7
}

variable "db_name" {
  type = string
}

variable "web_db_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "private_security_group_id" {
  type = string
}

variable "web-db-creds-secret" {
  type = string
}