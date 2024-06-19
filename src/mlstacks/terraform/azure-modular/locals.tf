resource "random_string" "unique" {
  length  = 4
  special = false
  upper   = false
}

# config values to use across the module
locals {
  prefix = "zenml"

  aks = {
    cluster_name = "mycluster-${random_string.unique.result}"
  }

  blob_storage = {
    account_name   = var.blob_account_name == "" ? "storageaccount${random_string.unique.result}" : var.blob_account_name
    container_name = var.blob_container_name == "" ? "artifactstore-${random_string.unique.result}" : var.blob_container_name
  }

  kubectl_context = "terraform-${local.prefix}-${local.aks.cluster_name}-${replace(substr(timestamp(), 0, 16), ":", "_")}"

  resource_group = {
    location = var.resource_group_location
    name     = var.resource_group_name == "" ? "resource-group-${random_string.unique.result}" : var.resource_group_name
  }

  tags = {
    "managedBy"   = "terraform"
    "application" = local.prefix
  }
}