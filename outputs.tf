output "vm_name" {
  description = "Virtual Machine Name"
  value       = module.vm.vm_name
}

output "vm_id" {
  description = "Virtual Machine ID"
  value       = module.vm.vm_id
}

output "private_ip" {
  description = "Private IP Address"
  value       = module.vm.private_ip
}

output "public_ip" {
  description = "Public IP Address (RDP)"
  value       = module.network.public_ip_address
}

output "rdp_connection" {
  description = "RDP connection string"
  value       = "mstsc /v:${module.network.public_ip_address}"
}