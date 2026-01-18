package policy.tests

import data.policy.azure.storage.deny

bad_input := {
  "resource_changes": [
    {
      "address": "azurerm_storage_account.bad",
      "type": "azurerm_storage_account",
      "change": {
        "after": {
          "name": "bad",
          "allow_blob_public_access": true,
          "min_tls_version": "TLS1_0"
        }
      }
    }
  ]
}

test_storage_denies_public_access {
  results := deny with input as bad_input
  count(results) == 2
}
