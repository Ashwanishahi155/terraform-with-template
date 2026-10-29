variable "rg_details" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "stg_details" {
  type = map(object({
    stg_name            = string
    resource_group_name = string
    location            = string
  }))
}