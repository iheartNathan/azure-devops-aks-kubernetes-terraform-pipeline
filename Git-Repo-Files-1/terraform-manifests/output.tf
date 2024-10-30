output "location" {
  value = azurerm_resource_group.aks_rg.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks_rg.id
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}



# Azure AKS Versions Datasource
output "versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

output "latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

# Azure AD AKS Group Object ID
output "azure_ad_aks_group_id" {
  value = azuread_group.aks_administrators.id
}

output "azure_ad_aks_group_object_id" {
  value = azuread_group.aks_administrators.object_id
}

# Azure AKS Outputs

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks-cluster.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
}

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.aks-cluster.kubernetes_version
}