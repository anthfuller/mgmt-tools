resource "ibm_is_vpc" "mgmt_vpc" {
  name = "mgmt-vpc"
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
  count                     = local.max_size
  name                      = "${var.project_name}-${var.environment}-range-${format("%02s", count.index)}"
  zone                      = var.vpc_zone_names[count.index]
  vpc                       = ibm_is_vpc.mgmt_vpc.id
  cidr                      = "10.243.0.0/18"
}

resource "ibm_is_subnet" "mgmt_subnet" {
  name                     = "mgmt"
  zone                     = "eu-de-1"
  vpc                      = ibm_is_vpc.mgmt_vpc.id
  ipv4_cidr_block          = "10.243.0.0/18"
  resource_group           = data.ibm_resource_group.group.id
  depends_on  = [ibm_is_vpc_address_prefix.vpc_address_prefix]
}

resource "ibm_is_security_group" "mgmt_security_group" {
  name = "${var.project_name}-${var.environment}-sg-public"
  vpc  = ibm_is_vpc.mgmt_vpc.id
}

resource "ibm_is_security_group_rule" "mgmt_security_group_rule_all_outbound" {
  group     = ibm_is_security_group.mgmt_security_group.id
  direction = "outbound"
}

resource "ibm_is_security_group_rule" "mgmt_security_group_rule_tcp_ssh" {
  group     = ibm_is_security_group.mgmt_security_group.id
  direction = "inbound"
  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_floating_ip" "mgmt_instance_floating_ip" {
  name   = "${var.project_name}-${var.environment}-ip"
  target = ibm_is_instance.mgmt_instance.primary_network_interface.0.id
}
