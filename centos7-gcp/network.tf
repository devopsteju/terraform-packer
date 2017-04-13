resource "google_compute_network" "net" {
  name                    = "${var.name}-net"
  auto_create_subnetworks = "true"
}
