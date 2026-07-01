resource "random_password" "user_passwords" {
  for_each = var.users
  length   = 16
  special  = true
}

resource "azuread_user" "shiva" {
  for_each              = var.users
  user_principal_name   = "${each.key}1@sudhayadav2698gmail.onmicrosoft.com"
  display_name          = each.value.display_name
  password              = random_password.user_passwords[each.key].result
  force_password_change = true
}

resource "azurerm_resource_group" "rg" {
  name     = var.resourcegroup_name
  location = var.location
}

resource "azuread_group" "devops_team" {
  display_name     = "DevOps-Team"
  security_enabled = true
}

resource "azuread_group_member" "team_membership" {
  for_each         = var.users
  group_object_id  = azuread_group.devops_team.object_id
  member_object_id = azuread_user.shiva[each.key].object_id
}