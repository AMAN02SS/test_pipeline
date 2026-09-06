output "id" {
  description = "The ID of the Load Balancer."
  value       = azurerm_lb.lb.id
}

output "name" {
  description = "The name of the Load Balancer."
  value       = azurerm_lb.lb.name
}

output "frontend_ip_configuration" {
  description = "The frontend IP configuration block of the Load Balancer."
  value       = azurerm_lb.lb.frontend_ip_configuration
}

output "backend_address_pool_id" {
  description = "The ID of the Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.backend_pool.id
}

output "probe_id" {
  description = "The ID of the Health Probe."
  value       = azurerm_lb_probe.probe.id
}

output "lb_rule_id" {
  description = "The ID of the Load Balancing Rule."
  value       = azurerm_lb_rule.lb_rule.id
}
