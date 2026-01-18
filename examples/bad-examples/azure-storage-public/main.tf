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
  name     = "rg-bad-storage"
  location = "eastus"
}

resource "azurerm_storage_account" "bad" {
  name                     = "stbadpublic001"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
  min_tls_version          = "TLS1_0"
}
