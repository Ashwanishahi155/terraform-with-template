
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-shared"
    storage_account_name = "ashwanitfstate2026test"
    container_name       = "tfstate"
    key                  = "prod/terraform.tfstate"
    use_azuread_auth     = true
  }
}
