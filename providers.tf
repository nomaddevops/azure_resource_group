
###############################################################
#                          AZURE_RG                           #
# Purpose: Deploy an Azure resource gorup and his components  #
#                   Last Updated: 01/11/22                    #
###############################################################
terraform {
  required_version = ">= 1.1.3"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.45.0"
    }
  }

}

provider "azurerm" {
  features {}
}