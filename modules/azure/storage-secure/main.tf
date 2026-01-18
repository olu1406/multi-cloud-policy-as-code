resource "azurerm_storage_account" "this" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  min_tls_version                  = "TLS1_2"
  allow_blob_public_access         = false
  enable_https_traffic_only        = true
  shared_access_key_enabled        = false
  infrastructure_encryption_enabled = true

  tags = var.tags
}
