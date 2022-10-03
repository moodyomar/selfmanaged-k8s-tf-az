output "rg" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group"
}

output "public_ip" {
  value       = azurerm_public_ip.ip.*.id
  description = "Public IP Adress"
}
