variable "rg_details" {
  description = "Resource Groups to create in Dev"

  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "stg_details" {
  description = "Storage Accounts to create in Dev"

  type = map(object({
    stg_name            = string
    resource_group_name = string
    location            = string
  }))
}