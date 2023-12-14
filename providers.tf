
###############################################################
#                          AZURE_RG                           #
# Purpose: Deploy an Azure resource gorup and his components  #
#                   Last Updated: 01/11/22                    #
###############################################################
terraform {
  required_version = ">= 1.6.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.46.0"
    }
  }

}

provider "azurerm" {
  features {}
}