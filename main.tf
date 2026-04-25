module "network" {
  source = "./modules/network"

  rg_name  = module.rg.rg_name
  location = var.location
}

module "vm" {
  source = "./modules/windows_vm"

  rg_name      = module.rg.rg_name
  location     = var.location
  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id

  vm_name    = var.vm_name
  admin_user = var.admin_user
  admin_pass = var.admin_pass
}