variable "subscription_id" {}
variable "tenant_id" {}
variable "location" { default = "Central India" }

variable "rg_name" {}

variable "vnet_name" {
  type    = string
  default = "dummy-vnet"
}

variable "subnet_name" {
  type    = string
  default = "dummy-subnet"
}
variable "vm_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}