terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
       
        resource_group_name  = "rg-infra"
        storage_account_name = "iaccode"
        container_name       = "states"
        
    }

}

provider "azurerm" {
  features {}
}
module "resource_group" {
  source = "./../modules/resourcegroup/"
}