output "id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.nic.id
}

output "name" {
  description = "The name of the Network Interface."
  value       = azurerm_network_interface.nic.name
}

output "private_ip_address" {
  description = "The first private IP address of the Network Interface."
  value       = azurerm_network_interface.nic.private_ip_address
}
