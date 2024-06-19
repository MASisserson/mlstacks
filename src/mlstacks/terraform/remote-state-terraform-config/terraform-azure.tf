terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.16.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
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
