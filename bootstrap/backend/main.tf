
# Backend ke liye Azure Resource Group
resource "azurerm_resource_group" "tfstate" { # RG resource aur Terraform reference
  name     = var.backend_resource_group       # RG ka naam variable se
  location = var.location                     # Azure region

  tags = {                         # Resource metadata
    purpose    = "terraform-state" # Backend ka purpose
    managed_by = "terraform"       # Terraform management tag
  }
}

# Terraform state store karne ke liye Storage Account
resource "azurerm_storage_account" "tfstate" {
  name                     = var.backend_storage_account             # Unique storage name
  resource_group_name      = azurerm_resource_group.tfstate.name     # Upar wala RG
  location                 = azurerm_resource_group.tfstate.location # RG ka region
  account_tier             = "Standard"                              # Standard performance tier
  account_replication_type = "LRS"                                   # Local redundancy

  min_tls_version                 = "TLS1_2" # Minimum TLS 1.2
  https_traffic_only_enabled      = true     # HTTPS only
  allow_nested_items_to_be_public = false    # Anonymous public access disabled

  blob_properties {           # Blob protection settings
    versioning_enabled = true # Purani blob versions preserve karo

    delete_retention_policy { # Deleted blobs ki recovery
      days = 14               # 14 din tak recoverable
    }

    container_delete_retention_policy { # Deleted containers ki recovery
      days = 14                         # 14 din tak recoverable
    }
  }

  tags = {                         # Storage Account tags
    purpose    = "terraform-state" # State storage purpose
    managed_by = "terraform"       # Terraform management tag
  }
}

# Private Blob Container: state files yahan rahengi
resource "azurerm_storage_container" "tfstate" {
  name                  = var.backend_container              # Container ka naam
  storage_account_id    = azurerm_storage_account.tfstate.id # Parent Storage Account
  container_access_type = "private"                          # Anonymous access nahi
}

# Outputs: apply ke baad resource details dikhao
output "backend_resource_group" {
  value = azurerm_resource_group.tfstate.name # RG ka naam
}

output "backend_storage_account" {
  value = azurerm_storage_account.tfstate.name # Storage Account ka naam
}

output "backend_container" {
  value = azurerm_storage_container.tfstate.name # Container ka naam
}
