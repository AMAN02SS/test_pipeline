# Backend configuration for Azure Remote State
# Uncomment and configure the azurerm backend block below for remote state management:
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatedev01"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
