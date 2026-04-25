variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "admin_user" {
  description = "Admin username"
  type        = string
}

variable "admin_pass" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP ID"
  type        = string
}