resource "google_compute_network" "net" {
  name       = "${var.name}-net"
  ipv4_range = "${var.network}"
}
