resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = var.public_ip_address_id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "probe" {
  name            = var.probe_name
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = var.probe_protocol
  port            = var.probe_port
  request_path    = var.probe_protocol == "Http" || var.probe_protocol == "Https" ? var.probe_request_path : null
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = var.rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}