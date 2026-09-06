variable "rg_name" {
  type        = string
  description = "The name of the Resource Group."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}