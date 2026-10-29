variable "stg_details" {
  description = "Storage Account configuration"

  type = map(object({
    stg_name            = string
    resource_group_name = string
    location            = string
  }))
}

