
variable "rg_details" {
  description = "Resource Group configuration"

  type = map(object({
    resource_group_name = string
    location            = string
  }))
}
