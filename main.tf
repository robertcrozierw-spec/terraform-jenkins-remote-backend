# Configure the Azure provider, selecting the version to use in our case. We can exceed the version but no the major version.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}
#Specific to Azure provider.
provider "azurerm" {
  features {}
}

#Create resource group. Within Terraform the name is BobsWorld and also in Azure
resource "azurerm_resource_group" "BobsWorld" {
  name     = "BobsWorld"
  location = "eastus2"

  tags = {
    owner = "JenkinsPipeline"
  }
}
