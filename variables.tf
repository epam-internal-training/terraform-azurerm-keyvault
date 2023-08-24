variable "keyvault_name" {
  type        = string
  description = "Provide name of the key vault."
}

variable "rg_name" {
  type        = string
  description = "Provide resourcegroup name."
}

variable "location" {
  type        = string
  description = "Provide azure location."
}

variable "secrets" {
  type        = any
  default     = {}
}