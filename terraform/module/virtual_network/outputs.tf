output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space of the Virtual Network."
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
  description = "Map of subnet names to their respective Subnet IDs."
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnets" {
  description = "Map of subnet names to their full resource objects."
  value       = azurerm_subnet.subnet
}
