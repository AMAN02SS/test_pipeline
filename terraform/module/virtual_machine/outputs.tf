output "id" {
  description = "The ID of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "name" {
  description = "The name of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.name
}

output "private_ip_address" {
  description = "The primary private IP address of the Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "admin_username" {
  description = "The administrator username of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.vm.admin_username
}
