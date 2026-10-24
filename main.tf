# Configure the Azure provider, selecting the version to use in our case. We can exceed the version but no the major version.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
 # Backend configuration for storing the Terraform state file in Azure Blob Storage
  backend "azurerm" {
    resource_group_name  = "terraformstaterg01"
    storage_account_name = "terrafromstatestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" #This is the name of the actual Statefile, not the access key
  }
  #Required version of Terraform to use, recommendation it above this version
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
resource "azurerm_resource_group" "BobsWorld2" {
  name     = "BobsWorld2"
  location = "eastus2"

  tags = {
    owner = "JenkinsPipeline"
  }
}
