module "dev_resource_group" {
  source         = "../../modules/resource_group"
  rg_details = var.rg_details

}

module "dev_storage_account" {
  source = "../../modules/stg_group"

  stg_details = var.stg_details
}