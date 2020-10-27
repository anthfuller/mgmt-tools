resource "ibm_is_vpc" "mgmt_tools_vpc" {
  name = "mgmt-tools-vpc"
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = "manual"
}

resource "ibm_is_subnet" "mgmt_subnet" {
  name                     = "mgmt_tools_subnet"
  vpc                      = ibm_is_vpc.mgmt_tools_vpc.id
  zone                     = "eu-de-1"
  ipv4_cidr_block          = "172.16.0.0/1"
  resource_group           = data.ibm_resource_group.group.id
  
   }

resource "ibm_tg_gateway" "new_tg_gw"{
  name      = "mgmt-tools-prod-tg"
  location  = "eu-de"
  global    =  true
  resource_group="cf1794131ebd43efa0c468d35af45849"
   }
