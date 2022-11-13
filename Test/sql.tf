
resource "azurerm_mssql_server" "nucleo_sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.nucleotidz_resource_group.name
  location                     = var.infra_location
  version                      = "12.0"
  administrator_login          = random_password.nucleo_sql_server_user.result
  administrator_login_password = random_password.nucleo_sql_server_password.result
  minimum_tls_version          = "1.2" 
}

resource "azurerm_mssql_firewall_rule" "sql_server_firewall_rule" {
  name             = "ALLOWAZURE"
  server_id        = azurerm_mssql_server.nucleo_sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_database" "nucleo_integration_sql_db" {
  name                        = "nucleotidz-integration"
  server_id                   = azurerm_mssql_server.nucleo_sql_server.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  read_scale                  = false
  min_capacity                = 1
  sku_name                    = var.integration_db_sku_name
  max_size_gb                 = var.integration_db_max_size_gb
  zone_redundant              = var.integration_db_zone_redundant
  
}

resource "random_password" "nucleo_sql_server_user" {
  length  = 15
  special = false
}
resource "random_password" "nucleo_sql_server_password" {
  length  = 24
  special = false
}
resource "azurerm_key_vault_secret" "nucleo_sql_server_user_kvsecret" {
  name         = "dbuser"
  value        = random_password.nucleo_sql_server_user.result
  key_vault_id = azurerm_key_vault.nucleo_key_vault.id
  depends_on   = [ azurerm_key_vault.nucleo_key_vault ]
}

resource "azurerm_key_vault_secret" "nucleo_sql_server_password_kvsecret" {
  name         = "dbpassowrd"
  value        = random_password.nucleo_sql_server_password.result
  key_vault_id = azurerm_key_vault.nucleo_key_vault.id
  depends_on   = [ azurerm_key_vault.nucleo_key_vault ]
}