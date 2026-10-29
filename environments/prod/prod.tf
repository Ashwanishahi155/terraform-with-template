module "resource_group" {
  source = "../../modules/resource_group"

  rg_details = var.rg_details
}
module "stg" {
  depends_on = [module.resource_group]
  source     = "../../modules/stg_group"

  stg_details = var.stg_details
}