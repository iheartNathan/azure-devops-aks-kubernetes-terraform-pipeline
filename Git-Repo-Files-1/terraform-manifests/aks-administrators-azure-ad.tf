# Create Azure AD Group in Active Directory for AKS Admins
resource "azuread_group" "aks_administrators" {
  #name        = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  # Below two lines added as part of update June2023
  display_name     = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  security_enabled = true
  description      = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg.name}-cluster."
}

data "azuread_domains" "aad_domains" {}

output "domain_names" {
  value = data.azuread_domains.aad_domains.domains.*.domain_name
}

resource "azuread_user" "aks_users" {
  user_principal_name = "aksdev2@victordurojaiye2000gmail.onmicrosoft.com"
  display_name        = "AKS Dev2"
  password            = "@AKSadmin11"
  # force_password_change = true
}

data "azuread_user" "aks_users" {
  user_principal_name = azuread_user.aks_users.user_principal_name
}

resource "azuread_group_member" "aks_administrators_member" {
  group_object_id  = azuread_group.aks_administrators.object_id
  member_object_id = data.azuread_user.aks_users.object_id
}