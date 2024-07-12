terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}
provider "vsphere" {
  # Configuration options
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_vcenter

  allow_unverified_ssl = true
}
data "vsphere_datacenter" "dc" {
  name = "DC-General"
}
