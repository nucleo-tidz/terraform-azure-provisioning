resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = var.infra_location
  resource_group_name         = azurerm_resource_group.nucleotidz_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = "eaf4a4cd-97f4-477a-8d21-50da33ef2a64"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
  }