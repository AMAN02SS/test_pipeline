variable "vm_name" {
  type        = string
  description = "The name of the Linux Virtual Machine."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Virtual Machine will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Virtual Machine should exist."
}

variable "size" {
  type        = string
  description = "The SKU / size to use for this Virtual Machine."
  default     = "Standard_D2s_v5"
}

variable "admin_username" {
  type        = string
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "azureadmin"
}

variable "admin_ssh_public_key" {
  type        = string
  description = "The Public SSH Key string used to authenticate the admin user."
}

variable "network_interface_ids" {
  type        = list(string)
  description = "A list of Network Interface IDs which should be attached to this Virtual Machine."
}

variable "custom_data" {
  type        = string
  description = "Base64 encoded string of user data / cloud-init script."
  default     = null
}

variable "os_disk_caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk."
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this OS Disk."
  default     = "Standard_LRS"
}

variable "os_disk_size_gb" {
  type        = number
  description = "The Size of the Internal OS Disk in GB."
  default     = 30
}

variable "image_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machine."
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine."
  default     = "22_04-lts"
}

variable "image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine."
  default     = "latest"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}