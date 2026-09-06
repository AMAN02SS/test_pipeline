variable "nsg_name" {
  type        = string
  description = "The name of the Network Security Group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Network Security Group will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Network Security Group should exist."
}

variable "security_rules" {
  type = list(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = optional(string)
    source_port_ranges           = optional(list(string))
    destination_port_range       = optional(string)
    destination_port_ranges      = optional(list(string))
    source_address_prefix        = optional(string)
    source_address_prefixes      = optional(list(string))
    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
  }))
  description = "List of security rules to apply to the Network Security Group."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}