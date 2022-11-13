
resource "azurerm_resource_group" "nucleotidz_resource_group" {
  name     = var.resource_group_name
  location = var.infra_location
}