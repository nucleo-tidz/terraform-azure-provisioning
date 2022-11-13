variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}
resource "azurerm_resource_group" "nucleotidz_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}