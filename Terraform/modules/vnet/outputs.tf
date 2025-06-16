output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.isaac_vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.isaac_vnet.name
}

output "default_subnet_id" {
  description = "The ID of the default subnet"
  value       = azurerm_subnet.default.id
}

output "subnet1_id" {
  description = "The ID of subnet1"
  value       = azurerm_subnet.subnet1.id
}
