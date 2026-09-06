environment = "prod"
location    = "eastus"
rg_name     = "rg-prod-web-app"
vnet_cidr   = ["10.10.0.0/16"]

web_subnet_cidr     = ["10.10.1.0/24"]
bastion_subnet_cidr = ["10.10.2.0/24"]

vm_size        = "Standard_D2s_v5"
admin_username = "azureadmin"

tags = {
  Environment = "prod"
  Project     = "LoadBalancedApp"
  ManagedBy   = "Terraform"
}
