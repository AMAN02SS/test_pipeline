variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Virtual Network will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Virtual Network should exist."
}

variable "address_space" {
  type        = list(string)
  description = "The address space used by the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
  description = "A map of subnets to create within the Virtual Network."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}