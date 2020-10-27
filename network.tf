resource ibm_is_vpc "iac_iks_vpc" {
  name = "${var.project_name}-${var.environment}-vpc"
  resource_group = data.ibm_resource_group.group.id
  address_prefix_management = "manual"
}

resource "ibm_is_subnet" "iac_iks_subnet" {
  count                    = local.max_size
  name                     = "${var.project_name}-${var.environment}-subnet-${format("%02s", count.index)}"
  zone                     = var.vpc_zone_names[count.index]
  vpc                      = ibm_is_vpc.iac_iks_vpc.id
  ipv4_cidr_block          = "172.26.${format("%01s", count.index)}.0/26"
  # total_ipv4_address_count = 64
  resource_group           = data.ibm_resource_group.group.id
  
   }

resource "ibm_tg_gateway" "new_tg_gw"{
  name      = "mgmt-tools-prod-tg"
  location  = "eu-de"
  global    =  true
  resource_group="64474a4706f64480a1a25926de5f12dd"
 }
