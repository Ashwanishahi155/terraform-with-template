
# Azure region jahan backend resources banenge
variable "location" {
  description = "Azure region for backend resources"
  type        = string
  default     = "centralindia"
}

# Terraform state ke liye dedicated Resource Group
variable "backend_resource_group" {
  description = "Resource Group for Terraform state backend"
  type        = string
  default     = "rg-tfstate-shared"
}

# Storage Account ka globally unique naam
variable "backend_storage_account" {
  description = "Globally unique lowercase Storage Account name"
  type        = string
}

# Blob container jahan state files store hongi
variable "backend_container" {
  description = "Blob container for Terraform state"
  type        = string
  default     = "tfstate"
}
