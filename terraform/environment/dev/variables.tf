variable "environment" {
  type        = string
  description = "Deployment environment name."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region for resource deployment."
  default     = "eastus"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group."
  default     = "rg-dev-web-app"
}

variable "vnet_cidr" {
  type        = list(string)
  description = "Address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_cidr" {
  type        = list(string)
  description = "Address prefix for the Web Subnet hosting VMs."
  default     = ["10.0.1.0/24"]
}

variable "bastion_subnet_cidr" {
  type        = list(string)
  description = "Address prefix for AzureBastionSubnet."
  default     = ["10.0.2.0/24"]
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU."
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Local administrator username for Linux VMs."
  default     = "azureadmin"
}

variable "admin_ssh_public_key" {
  type        = string
  description = "Public SSH Key string for authenticating to Linux VMs."
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply across all resources."
  default = {
    Environment = "dev"
    Project     = "LoadBalancedApp"
    ManagedBy   = "Terraform"
  }
}
