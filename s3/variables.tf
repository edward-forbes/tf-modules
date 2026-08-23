variable "bucket_name" {
  type    = string
  default = "tf-state"
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "prevent_destroy" {
  type    = bool
  default = true
}

variable "block_public_access" {
  type    = bool
  default = true
}