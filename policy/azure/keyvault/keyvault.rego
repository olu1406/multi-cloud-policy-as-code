package policy.azure.keyvault

import data.lib.helpers.resource_changes
import data.lib.helpers.resource_after

# Ensure Key Vaults have purge protection and private access.

deny[msg] {
  rc := resource_changes["azurerm_key_vault"][_]
  after := resource_after(rc)
  not after.purge_protection_enabled
  msg := sprintf("Key Vault %s does not enable purge protection", [after.name])
}

deny[msg] {
  rc := resource_changes["azurerm_key_vault"][_]
  after := resource_after(rc)
  after.public_network_access_enabled
  msg := sprintf("Key Vault %s allows public network access", [after.name])
}
