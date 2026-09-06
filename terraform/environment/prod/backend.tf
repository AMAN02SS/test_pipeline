terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateprod0609"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
