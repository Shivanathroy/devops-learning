variable "users" {
  type = map(object({
    display_name = string
  }))
}


variable "resourcegroup_name" {
  description = "The name of the resource"
  type        = string

}
variable "domain_name" {
  description = "Azure AD domain"
  type        = string
}
variable "location" {
  description = "The location of the resource"
  type        = string
}
provider "azuread" {
  tenant_id = var.tenant_id
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}
