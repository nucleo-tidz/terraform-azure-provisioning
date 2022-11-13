resource "azurerm_key_vault"   "nucleo_key_vault" {
  name                        = var.keyvault_name
  location                    = var.infra_location
  resource_group_name         = azurerm_resource_group.nucleotidz_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
    ]

    secret_permissions = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
    ]

    storage_permissions = [
       "Backup",
    "Backup",
    "DeleteSAS",
    "Get",
    "GetSAS",
    "List",
    "ListSAS",
    "Purge",
    "Recover",
    "RegenerateKey",
    "Restore",
    "Set",
    "SetSAS ",
    
    ]
  }
  }