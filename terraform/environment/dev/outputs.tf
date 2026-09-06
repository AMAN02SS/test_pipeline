output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.resource_group.name
}

output "load_balancer_public_ip" {
  description = "The public IP address to access the NGINX web application via Load Balancer."
  value       = module.public_ip_lb.ip_address
}

output "load_balancer_url" {
  description = "Direct HTTP URL to test the load-balanced website in your browser."
  value       = "http://${module.public_ip_lb.ip_address}"
}

output "bastion_public_ip" {
  description = "The public IP address of the Azure Bastion Host."
  value       = module.public_ip_bastion.ip_address
}

output "vm1_private_ip" {
  description = "Private IP of VM 01."
  value       = module.vm1.private_ip_address
}

output "vm2_private_ip" {
  description = "Private IP of VM 02."
  value       = module.vm2.private_ip_address
}
