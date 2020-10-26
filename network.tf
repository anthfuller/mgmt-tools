resource ibm_is_vpc "vpc1" {
  name = "myvpc1"
  }

resource ibm_is_vpc "vpc2" {
  name = "myvpc2"
   }

resource "ibm_tg_gateway" "new_tg_gw"{
  name      = "terraform-office-tg"
  location  = "east-us"
  global    =  true
  resource_group="6664a071c0b546deb4703269b54a5d9a"
}
