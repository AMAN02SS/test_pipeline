resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_assoc" {
  count                   = var.backend_address_pool_id != null ? 1 : 0
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = var.backend_address_pool_id
}