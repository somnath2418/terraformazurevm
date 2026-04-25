terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "somseema23tf"
    container_name       = "tfstate"
    key                  = "windows-vm.tfstate"
  }
}

provider "azurerm" {
  features {}
}