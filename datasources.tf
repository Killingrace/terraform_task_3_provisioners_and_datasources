data "azurerm_resource_group" "example" {
  name = "manually-created"
}

data "azurerm_virtual_network" "name" {
  name                = "${var.prefix}-network"
  resource_group_name = data.azurerm_resource_group.example.name
}

data "azurerm_network_interface" "name" {
  name                = "${var.prefix}-nic"
  resource_group_name = data.azurerm_resource_group.example.name
}

data "azurerm_subnet" "name" {
  resource_group_name  = data.azurerm_resource_group.example.name
  name                 = "internal"
  virtual_network_name = data.azurerm_virtual_network.name.name
}

data "azurerm_virtual_machine" "name" {
  name                = "${var.prefix}-vm"
  resource_group_name = data.azurerm_resource_group.example.name
}