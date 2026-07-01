terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  # THIS CONTEXT SYNCS MACBOOK AND GITHUB TOGETHER
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "shivastfstatestorage" # Ensure this matches step 1 exactly
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azuread" {
  use_oidc = true
}