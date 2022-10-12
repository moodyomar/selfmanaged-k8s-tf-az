terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.25.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.region
}

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      k8s_master  = azurerm_public_ip.Masterip.ip_address,
      k8s_usr     = var.username,
      k8s_workers = flatten([for i in azurerm_public_ip.ip[*].ip_address : i])
  })
  filename = "./Ansible/inventory"
} 