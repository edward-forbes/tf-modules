variable "project" {
  type    = string
  default = "tfstudy"
}

variable "public_security_group_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}