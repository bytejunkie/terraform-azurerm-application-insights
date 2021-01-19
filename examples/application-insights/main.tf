provider "azurerm" {
  features {}
}

resource "random_pet" "acr" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
  }
  separator = ""

}
#################
# pre-requisites
#################

module "resource_group" {
  source = "bytejunkie/resource-group/azurerm"

  location       = "west europe"
  name_strings   = ["byt", "rsg", random_pet.acr.id]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "application_insights" {
  source = "../../"

  name_strings        = ["byt", "acr", random_pet.acr.id]
  resource_group_name = module.resource_group.resource_group_name
  location            = "west europe"

  disable_ip_masking = "true"

  depends_on = [
    module.resource_group
  ]

  # tags = {
  #   location = "west europe"
  # }
}
