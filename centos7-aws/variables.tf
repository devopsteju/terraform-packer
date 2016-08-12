variable "name" {
  default     = "centos7-aws-jenkins"
  description = "The name of the project"
}

variable "region" {
  type    = "string"
  default = "eu-west-1"
}

#variable "access_key" {}

#variable "secret_key" {}

variable "ami" {
  default = "ami-7abd0209"
}

variable "ssh_public_key" {
  description = "The ssh public key to inject in the host"
}

variable "ssh_public_key_name" {
  type        = "string"
  description = "The name of the ssh public key of the user"
}

variable "machine_type" {
  default = "c4.small"
}

variable "volume_type" {
  default = "st1"
}

variable "volume_size" {
  description = "Disk size in GB"
  default     = "10"
}
