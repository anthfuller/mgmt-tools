resource ibm_is_vpc "vpc" {
  name = "mgmt-tools-prod"
  }

resource ibm_is_vpc "vpc2" {
  name = "front-office-dev2"
   }

resource "ibm_tg_gateway" "new_tg_gw"{
  name      = "mgmt-tools-prod-tg"
  location  = "eu-de"
  global    =  true
  resource_group="64474a4706f64480a1a25926de5f12dd"
}
