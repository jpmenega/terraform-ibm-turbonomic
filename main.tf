resource "ibm_is_instance" "turbonomic" {
  name    = "turbonomic-instance"
  image   = "r006-47125f1b-b95d-47f5-8e4c-1395254549ce"
  profile = "bx2-16x64"
  metadata_service_enabled  = false

  primary_network_interface {
    subnet = "0717-c412c8f1-b5e2-404e-bdd1-7bcf80c78714"
    allow_ip_spoofing = true
  }

  vpc  = "r006-f764225e-b6f7-42f6-8e4f-2f062eb459fd"
  zone = "us-south-1"
  keys = ["r006-1d3b8fca-3eda-4a63-9f3f-7a4dad8057dd"]

  //User can configure timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
