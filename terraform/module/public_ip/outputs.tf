output "id" {
  description = "The ID of the Public IP."
  value       = azurerm_public_ip.pip.id
}

output "name" {
  description = "The name of the Public IP."
  value       = azurerm_public_ip.pip.name
}

output "ip_address" {
  description = "The IP address value that was allocated."
  value       = azurerm_public_ip.pip.ip_address
}

output "fqdn" {
  description = "Fully qualified domain name of the A DNS record associated with the public IP."
  value       = azurerm_public_ip.pip.fqdn
}
