provider "azurerm" {
  features = {}
}

module "azurerm-remote-state" {
  source  = "zenml-io/terraform-azurerm-remote-state"
  version = "0.1.0"

  location       = var.location
  container_name = var.container_name

  tags = {
    env = "dev"
    managed-by = "terraform"
  }
}