output "group_object_id" {
  value = azuread_group.devops_team.object_id
}

output "team_members" {
  value = { for k, m in azuread_group_member.team_membership : k => m.member_object_id }
}