resource ibm_is_vpc "vpc1" {
  name = "front-office-dev1"
  }

resource ibm_is_vpc "vpc2" {
  name = "front-office-dev2"
   }

resource "ibm_tg_gateway" "new2_tg_gw"{
  name      = "front-office-dev2-tg"
  location  = "us-east"
  global    =  true
  resource_group="6664a071c0b546deb4703269b54a5d9a"
}
