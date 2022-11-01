variable "project" {
  type = string
}
variable "region" {
  type = string
}

variable "jenkins-managment-subnet-ip" {
  type = string
}

variable "jenkins-restricted-subnet-ip" {
  type = string
}

variable "gke-master-ip" {
  type = string
}

variable "image-id" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}
