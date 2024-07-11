variable "location" {
  type    = string
  description = "azure resources location"
  default = "uksouth"
}
variable "product_name" {
  type = string
  nullable = false
  description = "h21test"
  
}
variable "vnets" {
  description = "Map of vnets to create"
  type = map(object({
    name          = string
    address_space = string
  }))
  default = {
    spoke1 = { name = "hub", address_space = "10.0.0.0/20" },
    spoke2 = { name = "prod", address_space = "10.1.0.0/16" },
    spoke3 = { name = "staging", address_space = "10.2.0.0/16" },
    spoke4 = { name = "dev", address_space = "10.3.0.0/16" }
  }
}
locals {
  subnets_hub = {
    "snet-management" = {
      address_prefix = "10.0.1.0/24"
    },
    "GatewaySubnet" = {
      address_prefix = "10.0.15.224/27"
    },
    "snet-shared" = {
      address_prefix = "10.0.4.0/22"
    },
    "AzureFirewallSubnet" = {
      address_prefix = "10.0.15.0/26"
    }
  }
  subnets_dev = {
    "default" = {
      address_prefix = "10.3.1.0/24"
    }
  }
  subnets_prod = {
    "default" = {
      address_prefix = "10.1.1.0/24"
    }
  }
  subnets_staging = {
    "default" = {
      address_prefix = "10.2.1.0/24"
    }
  }
}
