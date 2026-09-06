variable "nic_name" {
  type        = string
  description = "The name of the Network Interface."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Network Interface will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Network Interface should exist."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located."
}

variable "ip_configuration_name" {
  type        = string
  description = "The name of the IP configuration."
  default     = "internal"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  default     = "Dynamic"
}

variable "private_ip_address" {
  type        = string
  description = "The Static IP Address to configure. Required if private_ip_address_allocation is Static."
  default     = null
}

variable "public_ip_address_id" {
  type        = string
  description = "The ID of a Public IP Address to associate with the Network Interface."
  default     = null
}

variable "backend_address_pool_id" {
  type        = string
  description = "The ID of the Load Balancer Backend Address Pool to associate with this Network Interface."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}