resource ibm_is_vpc "vpc1" {
  name = "myvpc1"
  }

resource ibm_is_vpc "vpc2" {
  name = "myvpc2"
}

resource "ibm_resource_group" "resourceGroup" {
  name     = "front-office-dev"
}
