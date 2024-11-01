resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "${azurerm_resource_group.aks_rg.name}-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"

  default_node_pool {
    name = "systempool"
    #node_count          = 1
    vm_size              = "Standard_D2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones                = [1, 2, 3]
    auto_scaling_enabled = true
    vnet_subnet_id       = azurerm_subnet.aks-default.id
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }

  # local_account_disabled = true


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }

  #Addon Profile
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
  }


  # RBAC and Azure AD Integration Block
  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    # azure_rbac_enabled = true
    admin_group_object_ids = [azuread_group.aks_administrators.object_id]
  }


  # Window Profiles 
  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  # Linux Profiles
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  # Network
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

}

