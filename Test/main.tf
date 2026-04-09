terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }
  backend "azurerm" {

    resource_group_name  = "lighthouse-rg"
    storage_account_name = "nucelotidz"
    container_name       = "states"

  }

}

provider "azurerm" {
  features {}
}
