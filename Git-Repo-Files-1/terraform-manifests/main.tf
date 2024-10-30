# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=3.0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.6.3"
    }
  }


  backend "azurerm" {
    # resource_group_name  = "terraform-storage-rg"
    # storage_account_name = "terraformstatexlrwdrzsa"
    # container_name       = "tfstatefiles"
    # key                  = "terraform-custom-vnet.tfstate"
  }
}

# 2. Configure the Microsoft Azure Provider
provider "azurerm" {
  # resource_provider_registrations = "none" - This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id

}

# 3. Configure the Azure Active Directory Provider
# provider "azuread" {
#  tenant_id = var.tenant_id
# }

# 4. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}