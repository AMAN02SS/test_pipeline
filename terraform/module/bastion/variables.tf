variable "bastion_name" {
  type        = string
  description = "The name of the Bastion Host."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Bastion Host will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Bastion Host should exist."
}

variable "subnet_id" {
  type        = string
  description = "Reference to a Subnet ID where this Bastion Host should be provisioned (must be named AzureBastionSubnet)."
}

variable "public_ip_address_id" {
  type        = string
  description = "Reference to a Public IP Address ID to associate with the Bastion Host."
}

variable "sku" {
  type        = string
  description = "The SKU of the Bastion Host. Accepted values are Basic, Standard, and Developer."
  default     = "Standard"
}

variable "ip_configuration_name" {
  type        = string
  description = "The name of the IP configuration."
  default     = "configuration"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
