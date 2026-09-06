# 1. Resource Group
module "resource_group" {
  source   = "../../module/resource_group"
  rg_name  = var.rg_name
  location = var.location
  tags     = var.tags
}

# 2. Virtual Network & Subnets
module "virtual_network" {
  source              = "../../module/virtual_network"
  vnet_name           = "vnet-${var.environment}-web"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.vnet_cidr
  tags                = var.tags

  subnets = {
    "snet-web" = {
      address_prefixes = var.web_subnet_cidr
    }
    "AzureBastionSubnet" = {
      address_prefixes = var.bastion_subnet_cidr
    }
  }
}

# 3. Public IP for Load Balancer
module "public_ip_lb" {
  source              = "../../module/public_ip"
  public_ip_name      = "pip-lb-${var.environment}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# 4. Public IP for Azure Bastion
module "public_ip_bastion" {
  source              = "../../module/public_ip"
  public_ip_name      = "pip-bastion-${var.environment}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# 5. Azure Standard Load Balancer (Frontend + Pool + Probe + Rule)
module "loadbalancer" {
  source               = "../../module/loadbalancer"
  lb_name              = "lb-${var.environment}-web"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  public_ip_address_id = module.public_ip_lb.id
  frontend_ip_name     = "LoadBalancerFrontend"
  backend_pool_name    = "WebVMBackendPool"
  probe_name           = "HttpHealthProbe"
  probe_port           = 80
  probe_protocol       = "Http"
  probe_request_path   = "/"
  rule_name            = "HTTPRule80"
  frontend_port        = 80
  backend_port         = 80
  tags                 = var.tags
}

# 6. Network Security Group (NSG)
module "nsg" {
  source              = "../../module/NSG"
  nsg_name            = "nsg-${var.environment}-web"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = var.tags

  security_rules = [
    {
      name                       = "AllowHTTPInbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowSSHFromVNet"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
  ]
}

# 7. Network Interfaces for VM1 & VM2 (Associated with LB Backend Pool)
module "nic_vm1" {
  source                  = "../../module/nic"
  nic_name                = "nic-${var.environment}-web01"
  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  subnet_id               = module.virtual_network.subnet_ids["snet-web"]
  backend_address_pool_id = module.loadbalancer.backend_address_pool_id
  tags                    = var.tags
}

module "nic_vm2" {
  source                  = "../../module/nic"
  nic_name                = "nic-${var.environment}-web02"
  resource_group_name     = module.resource_group.name
  location                = module.resource_group.location
  subnet_id               = module.virtual_network.subnet_ids["snet-web"]
  backend_address_pool_id = module.loadbalancer.backend_address_pool_id
  tags                    = var.tags
}

# 8. Linux Virtual Machines (VM1 & VM2 with NGINX Cloud-Init)
module "vm1" {
  source                = "../../module/virtual_machine"
  vm_name               = "vm-${var.environment}-web01"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_ssh_public_key  = var.admin_ssh_public_key
  network_interface_ids = [module.nic_vm1.id]
  custom_data           = filebase64("${path.module}/../../scripts/nginx-init.sh")
  tags                  = var.tags
}

module "vm2" {
  source                = "../../module/virtual_machine"
  vm_name               = "vm-${var.environment}-web02"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_ssh_public_key  = var.admin_ssh_public_key
  network_interface_ids = [module.nic_vm2.id]
  custom_data           = filebase64("${path.module}/../../scripts/nginx-init.sh")
  tags                  = var.tags
}

# 9. Azure Bastion Host for Secure Private Management
module "bastion" {
  source               = "../../module/bastion"
  bastion_name         = "bastion-${var.environment}"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  subnet_id            = module.virtual_network.subnet_ids["AzureBastionSubnet"]
  public_ip_address_id = module.public_ip_bastion.id
  sku                  = "Basic"
  tags                 = var.tags
}
