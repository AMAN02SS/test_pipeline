variable "nat_gateway_name" {
  type        = string
  description = "The name of the NAT Gateway."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the NAT Gateway will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the NAT Gateway should exist."
}

variable "sku_name" {
  type        = string
  description = "The SKU which should be used for the NAT Gateway. Defaults to Standard."
  default     = "Standard"
}

variable "idle_timeout_in_minutes" {
  type        = number
  description = "The idle timeout which should be used in minutes."
  default     = 10
}

variable "zones" {
  type        = list(string)
  description = "A list of Availability Zones in which this NAT Gateway should be located."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}