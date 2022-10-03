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

