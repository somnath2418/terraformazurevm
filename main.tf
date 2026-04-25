module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "network" {
  source      = "./modules/network"
  rg_name     = module.rg.rg_name
  location    = var.location
  vnet_name   = "demo-vnet"
  subnet_name = "demo-subnet"
}

module "vm" {
  source           = "./modules/windows_vm"
  rg_name          = module.rg.rg_name
  location         = var.location
  subnet_id        = module.network.subnet_id
  vm_name          = var.vm_name
  admin_username   = var.admin_username
  admin_password   = var.admin_password
}