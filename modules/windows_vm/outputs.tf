output "vm_id" {
  description = "Virtual Machine ID"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "vm_name" {
  description = "Virtual Machine Name"
  value       = azurerm_windows_virtual_machine.vm.name
}

output "private_ip" {
  description = "Private IP Address"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "nic_id" {
  description = "Network Interface ID"
  value       = azurerm_network_interface.nic.id
}