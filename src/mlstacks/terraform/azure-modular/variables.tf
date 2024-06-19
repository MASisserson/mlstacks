# enable services
variable "enable_artifact_store" {
  description = "Enable Azure blob storage deployment"
  default     = false
}

# configuration
variable "blob_account_name" {
  description = "The account name for the blob storage account"
  default     = ""
  type        = string
}
variable "blob_container_name" {
  description = "The blob storage container name"
  default     = ""
  type        = string
}
variable "resource_group_location" {
  description = "The location of the resource group"
  default     = "East US"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  default     = ""
  type        = string
}
