variable "lb_name" {
  type        = string
  description = "The name of the Load Balancer."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Load Balancer will be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Load Balancer should exist."
}

variable "sku" {
  type        = string
  description = "The SKU of the Load Balancer. Accepted values are Basic, Standard, and Gateway."
  default     = "Standard"
}

variable "frontend_ip_name" {
  type        = string
  description = "The name of the frontend IP configuration."
  default     = "LoadBalancerFrontend"
}

variable "public_ip_address_id" {
  type        = string
  description = "The ID of the Public IP to associate with the Load Balancer frontend."
  default     = null
}

variable "backend_pool_name" {
  type        = string
  description = "The name of the Backend Address Pool."
  default     = "WebBackendPool"
}

variable "probe_name" {
  type        = string
  description = "The name of the Health Probe."
  default     = "HttpHealthProbe"
}

variable "probe_protocol" {
  type        = string
  description = "Specifies the protocol of the end point. Possible values are Http, Https or Tcp."
  default     = "Http"
}

variable "probe_port" {
  type        = number
  description = "Port on which the Health Probe queries the backend."
  default     = 80
}

variable "probe_request_path" {
  type        = string
  description = "The URI used for requesting health status from the backend endpoint. Required if protocol is Http or Https."
  default     = "/"
}

variable "rule_name" {
  type        = string
  description = "The name of the Load Balancing Rule."
  default     = "HTTPRule"
}

variable "rule_protocol" {
  type        = string
  description = "The transport protocol for the external endpoint. Possible values are Tcp, Udp or All."
  default     = "Tcp"
}

variable "frontend_port" {
  type        = number
  description = "The port for the external endpoint."
  default     = 80
}

variable "backend_port" {
  type        = number
  description = "The port used for internal connections on the backend."
  default     = 80
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
