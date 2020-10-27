resource "ibm_is_vpc" "mgmt_vpc" {
  name = "${var.project_name}-${var.environment}-vpc"
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
  count                     = local.max_size
  name                      = "${var.project_name}-${var.environment}-range-${format("%02s", count.index)}"
  zone                      = var.vpc_zone_names[count.index]
  vpc                       = ibm_is_vpc.mgmt_vpc.id
  cidr                      = "10.240.${format("%01s", count.index)}.0/24"
}

resource "ibm_is_subnet" "mgmt_subnet" {
  name                     = "mgmt"
  zone                     = "eu-du"
  vpc                      = ibm_is_vpc.mgmt_vpc.id
  ipv4_cidr_block          = "10.240.0.0/24"
  resource_group           = data.ibm_resource_group.group.id
}
