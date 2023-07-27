# Export Terraform output variable values to a stack yaml file 
# that can be consumed by zenml stack import
resource "local_file" "stack_file" {
  content  = <<-ADD
    # Stack configuration YAML
    # Generated by the AWS Minimal MLOps stack recipe.
    zenml_version: ${var.zenml-version}
    stack_name: aws_minimal_stack_${replace(substr(timestamp(), 0, 16), ":", "_")}
    components:
      orchestrator:
        id: ${uuid()}
        flavor: local
        name: default
        configuration: {}
      artifact_store:
        id: ${uuid()}
        flavor: s3
        name: s3_artifact_store
        configuration: {"path": "s3://${aws_s3_bucket.zenml-artifact-store.bucket}"}
      container_registry:
        id: ${uuid()}
        flavor: aws
        name: aws_container_registry
        configuration: {"uri": "${data.aws_caller_identity.current.account_id}.dkr.ecr.${local.region}.amazonaws.com"}
      secrets_manager:
        id: ${uuid()}
        flavor: aws
        name: aws_secrets_manager
        configuration: {"region_name": "${local.region}"}
    ADD
  filename = "./aws_minimal_stack_${replace(substr(timestamp(), 0, 16), ":", "_")}.yaml"
}