variable "container_name" {
  description = "The name of the Azure storage container to deploy"
  default     = ""
  type        = string
}

variable "location" {
  description = "The location to which to deploy resources"
  default     = "northeurope"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all resources associated with the remote storage"
  default     = {}
  type        = map(string)
}