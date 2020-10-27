resource "ibm_is_vpc" "mgmt_vpc" {
  name = "mgmt-vpc"
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = "manual"
}

resource "ibm_is_subnet" "mgmt_subnet" {
  name                     = "mgmt"
  zone                     = "eu-du"
  vpc                      = ibm_is_vpc.mgmt_vpc.id
  ipv4_cidr_block          = "10.240.0.0/24"
  resource_group           = data.ibm_resource_group.group.id
  depends_on  = [ibm_is_vpc_address_prefix.vpc_address_prefix]
}
