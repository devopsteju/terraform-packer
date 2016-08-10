resource "google_compute_instance" "instance" {
  count        = "${var.instances}"
  name         = "${var.name}-instance-${count.index + 1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["icmp", "http", "https", "ssh"]

  disk {
    image = "${var.disk_image}"
    type  = "${var.disk_type}"
  }

  # declare metadata for configuration of the node
  metadata {
    count       = "${var.instances}"
    clustername = "${var.name}"
    myid        = "${count.index}"
    network     = "${var.network}"
  }

  # network interface
  network_interface {
    network = "${var.name}-net"

    access_config {
      // Ephemeral IP
    }
  }

  # overwrite the original MTU value on the instance
  metadata_startup_script = "${file("config.sh")}"
}
