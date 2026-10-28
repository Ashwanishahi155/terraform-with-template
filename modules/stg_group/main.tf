
resource "azurerm_storage_account" "stg" {
  for_each = var.stg_details

  name                     = each.value.stg_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false

  tags = {}
    
}
