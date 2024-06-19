output "aks-cluster-principal-id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "storage-account-id" {
  value = azurerm_storage_account.zenml-account.id
}
