# # Create Windows Azure AKS Node Pool
# resource "azurerm_kubernetes_cluster_node_pool" "win101" {
#   #availability_zones    = [1, 2, 3]
#   # Added June 2023
#   zones                 = [1, 2, 3]
#   auto_scaling_enabled  = true
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
#   max_count             = 3
#   min_count             = 1
#   mode                  = "User"
#   name                  = "win101"
#   vnet_subnet_id        = azurerm_subnet.aks-default.id
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   os_disk_size_gb       = 60        # Update June 2023
#   os_type               = "Windows" # Default is Linux, we can change to Windows
#   vm_size               = "Standard_DS2_v2"
#   priority              = "Regular" # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
#   node_labels = {
#     "nodepool-type" = "user"
#     "environment"   = var.environment
#     "nodepoolos"    = "windows"
#     "app"           = "dotnet-apps"
#   }
#   tags = {
#     "nodepool-type" = "user"
#     "environment"   = var.environment
#     "nodepoolos"    = "windows"
#     "app"           = "dotnet-apps"
#   }
# }