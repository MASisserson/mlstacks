# Export Terraform output variable values to a stack yaml file 
# that can be consumed by zenml stack import
resource "local_file" "stack_file" {
  content  = <<-ADD
    # Stack configuration YAML
    # Generated by the Azure Minimal MLOps stack recipe.
    zenml_version: ${var.zenml-version}
    stack_name: azure_minimal_stack_${replace(substr(timestamp(), 0, 16), ":", "_")}
    components:
      artifact_store:
        flavor: azure
        name: azure_artifact_store
        path: az://${azurerm_storage_container.artifact-store.name}
      container_registry:
        flavor: azure
        name: acr_container_registry
        uri: ${azurerm_container_registry.container_registry.login_server}
      metadata_store:
        database: zenml
        flavor: mysql
        host: ${azurerm_mysql_flexible_server.mysql.name}.mysql.database.azure.com}
        name: azure_mysql_metadata_store
        port: 3306
        secret: azure_mysql_secret
        upgrade_migration_enabled: true
      orchestrator:
        flavor: kubernetes
        name: aks_kubernetes_orchestrator
        synchronous: True
        kubernetes_context: ${local.kubectl_context}
      secrets_manager:
        flavor: azure_key_vault
        name: azure_secrets_manager
        key_vault_name: ${azurerm_key_vault.secret_manager.name}
      experiment_tracker:
        flavor: mlflow
        name: aks_mlflow_experiment_tracker
        tracking_uri: http://${data.kubernetes_service.mlflow_tracking.status.0.load_balancer.0.ingress.0.ip}
        tracking_username: ${var.mlflow-username}
        tracking_password: ${var.mlflow-password}
      model_deployer:
        flavor: seldon
        name: aks_seldon_model_deployer
        kubernetes_context: ${local.kubectl_context}
        kubernetes_namespace: ${kubernetes_namespace.seldon-workloads.metadata[0].name}
        base_url: ${data.kubernetes_service.seldon_ingress.status.0.load_balancer.0.ingress.0.ip}
        secret: azure_seldon_secret
    ADD
  filename = "./azure_minimal_stack_${replace(substr(timestamp(), 0, 16), ":", "_")}.yml"
}