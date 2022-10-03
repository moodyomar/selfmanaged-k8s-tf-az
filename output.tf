output "rg" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group"
}

output "public_ip" {
  value       = azurerm_public_ip.ip.ip_address
  description = "Public IP Adress"
}
