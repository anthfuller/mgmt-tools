variable "project_name" {}
variable "environment" {}

variable "ssh_keyname" {
  default = ""
}

# default to using CentOS 8
variable "image_name" {
  default = "ibm-centos-8-2-minimal-amd64-1"
}

variable "profile" {
  default = "cx2-2x4"
}

variable "resource_group" {
  default = "Default"
}
variable "region" {
  default = "eu-de"
}
variable "vpc_zone_names" {
  type    = list
  default = ["eu-de-1"]
}
variable "flavors" {
  type    = list
  default = ["mx2.4x32"]
}
variable "workers_count" {
  type    = list
  default = [2]
}
variable "k8s_version" {
  default = "4.4_openshift"
}

variable "public_endpoint_disable" {
  type = bool
  default = false
}

locals {
  max_size = length(var.vpc_zone_names)
}
