package policy.azure.storage

import data.lib.helpers.resource_changes
import data.lib.helpers.resource_after

# Ensure storage accounts disable public access and enforce TLS 1.2.

deny[msg] {
  rc := resource_changes["azurerm_storage_account"][_]
  after := resource_after(rc)
  after.allow_blob_public_access == true
  msg := sprintf("Storage account %s allows blob public access", [after.name])
}

deny[msg] {
  rc := resource_changes["azurerm_storage_account"][_]
  after := resource_after(rc)
  after.min_tls_version != "TLS1_2"
  msg := sprintf("Storage account %s does not enforce TLS1_2", [after.name])
}
