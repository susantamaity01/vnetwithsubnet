resource "azurerm_resource_group" "rg023" {
  for_each = var.resource
  name     = each.key
  location = each.value
}
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg023[each.value.resource_group].name
  location            = each.value.location
  address_space       = each.value.address_space
}
resource "azurerm_subnet" "sub" {
  for_each             = var.subnet
  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.rg_key].name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = azurerm_resource_group.rg023[each.value.resource_group].name
}