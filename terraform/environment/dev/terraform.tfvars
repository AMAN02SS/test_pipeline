environment = "dev"
location    = "centralindia"
rg_name     = "rg-dev-web-app"
vnet_cidr   = ["10.0.0.0/16"]

web_subnet_cidr     = ["10.0.1.0/24"]
bastion_subnet_cidr = ["10.0.2.0/24"]

vm_size        = "Standard_B2s"
admin_username = "azureadmin"

tags = {
  Environment = "dev"
  Project     = "LoadBalancedApp"
  ManagedBy   = "Terraform"
}
