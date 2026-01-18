terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-secure-landing-zone"
  location = "eastus"
  tags = {
    environment = "demo"
    owner       = "security"
  }
}

module "storage" {
  source              = "../../modules/azure/storage-secure"
  name                = "stsecurelz001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = azurerm_resource_group.this.tags
}

module "keyvault" {
  source              = "../../modules/azure/keyvault-secure"
  name                = "kv-secure-lz"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = azurerm_resource_group.this.tags
}

module "vnet" {
  source              = "../../modules/azure/vnet-secure"
  name                = "vnet-secure-lz"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = ["10.10.0.0/16"]
  subnet_prefix       = "10.10.1.0/24"
  tags                = azurerm_resource_group.this.tags
}
