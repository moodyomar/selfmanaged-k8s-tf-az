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
        vm_user = var.username,
        k8s_master = azurerm_public_ip.ip[0].ip_address,
        k8s_worker = azurerm_public_ip.ip[1].ip_address,
    })
    filename = "./Ansible/inventory"
}