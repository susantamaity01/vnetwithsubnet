resource_group = {
    rg01 ={
        name= "jio"
        location = "eastus"
    }
     rg02 ={
        name= "jio1"
        location = "eastus"
    }
#   name= "jio" 
#   location = "eastus"
#   jio = "eastus"
}

virtual_net = {
  v01 = {
    name                = "jiovnet01"
    resource_group_name = "jio"
    location            = "eastus"
    address_space       = ["10.143.0.0/16"]
    rg_key = "rg01"
  }
  v02 = {
    name                = "jiovnet02"
    resource_group_name = "jio1"
    location            = "eastus"
    address_space       = ["10.142.0.0/16"]
    rg_key ="rg02"
  }
}
subnet = {
  sub01 = {
    name                = "gis01"
    resource_group_name = "jio"
    virtual_net         = "jiovnet01"
    address_prefixes    = ["10.143.4.0/22"]
    vnet_key              = "v01"
    rg_key = "rg01"
  }
  sub02 = {
    name                = "gis02"
    resource_group_name = "jio1"
    virtual_net         = "jiovnet02"
    address_prefixes    = ["10.142.4.0/22"]
    vnet_key              = "v02"
    rg_key = "rg02"
  }
}