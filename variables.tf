variable "subscription_id" {}
variable "tenant_id" {}
variable "location" { default = "East US" }

variable "rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}
variable "vm_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}