terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RESOURCENAMEREPLACEME"
    storage_account_name = "STORAGENAMEREPLACEME"
    container_name       = "CONTAINERNAMEREPLACEME"
    key                  = "prod.terraform.tfstate"
    
  }

  required_version = ">= 0.14.8"
}

provider "azurerm" {
  features {}
}
