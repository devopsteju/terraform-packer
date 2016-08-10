resource "aws_instance" "instance" {
  ami           = "${var.ami}"
  instance_type = "${var.machine_type}"
  key_name      = "${var.ssh_public_key_name}"

  vpc_security_group_ids = [
    "${aws_security_group.allow-icmp.id}",
    "${aws_security_group.allow-http.id}",
    "${aws_security_group.allow-https.id}",
    "${aws_security_group.allow-ssh.id}",
    "${aws_security_group.allow-egress.id}",
  ]

  instance_initiated_shutdown_behavior = "terminate"

  root_block_device = {
    delete_on_termination = true
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
  }

  tags = {
    Name = "${var.name}"
  }
}
