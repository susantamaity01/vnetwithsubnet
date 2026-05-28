# create RG
resource "azurerm_resource_group" "rg05" {

  for_each = var.resource_group
#   name     = var.resource_group.name
#   location = var.resource_group.location
name= each.value.name
location = each.value.location
}
# create vnet
resource "azurerm_virtual_network" "vnet05" {
  for_each            = var.virtual_net
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg05[each.value.rg_key].name
#   resource_group_name = azurerm_resource_group.rg05.name
#   resource_group_name = azurerm_resource_group.rg05[each.value.resource_group_name].name
  location            = each.value.location
  address_space       = each.value.address_space
}
resource "azurerm_subnet" "sub05" {
  for_each             = var.subnet
  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnet05[each.value.vnet_key].name
  resource_group_name = azurerm_resource_group.rg05[each.value.rg_key].name
#   resource_group_name = azurerm_resource_group.rg05.name
#   resource_group_name  = azurerm_resource_group.rg05[each.value.resource_group_name].name
  address_prefixes     = each.value.address_prefixes
}