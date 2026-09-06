variable "public_ip_name" {
  type        = string
  description = "The name of the Public IP."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Public IP should be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Public IP should exist."
}

variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}

variable "sku" {
  type        = string
  description = "The SKU of the Public IP. Accepted values are Basic and Standard."
  default     = "Standard"
}

variable "zones" {
  type        = list(string)
  description = "A collection containing the availability zones to allocate the Public IP in."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}