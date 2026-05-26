resource = {
  gis = "eastus"
}
vnet = {
  vn01 = {
    name           = "gisvnet01"
    location       = "eastus"
    resource_group = "gis"
    address_space  = ["10.142.0.0/16"]
  }
  vn02 = {
    name           = "gisvnet02"
    location       = "eastus"
    resource_group = "gis"
    address_space  = ["10.143.0.0/16"]
  }
}
subnet = {
  sub01 = {
    name             = "sub0021"
    resource_group   = "gis"
    venet_name       = "gisvnet01"
    address_prefixes = ["10.142.4.0/22"]
    rg_key = "vn01"
  }
  sub02= {
    name             = "sub0022"
    resource_group   = "gis"
    venet_name       = "gisvnet02"
    address_prefixes = ["10.143.4.0/22"]
    rg_key = "vn02"
  }
}