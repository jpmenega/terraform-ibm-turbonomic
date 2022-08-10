resource "ibm_is_vpc" "dal-arm-vpc" {
  name = "dal-arm-vpc"
}

resource "ibm_is_subnet" "sn-dal01" {
  name            = "sn-dal01"
  vpc             = ibm_is_vpc.dal-arm-vpc.id
  zone            = "us-south-1"
  ipv4_cidr_block = "10.240.0.0/24"
}

resource "ibm_is_instance" "turbonomic" {
  name    = "turbonomic-instance"
  image   = "r006-47125f1b-b95d-47f5-8e4c-1395254549ce"
  profile = "bx2-16x64"
  metadata_service_enabled  = false

  primary_network_interface {
    subnet = ibm_is_subnet.sn-dal01.id
    allow_ip_spoofing = true
  }

  vpc  = ibm_is_vpc.dal-arm-vpc.id
  zone = "us-south-1"
  keys = ["r006-47125f1b-b95d-47f5-8e4c-1395254549ce"]

  //User can configure timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
