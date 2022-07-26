
data "vsphere_datastore" "datastore" {
  name          = var.vmware_storage
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "DCX"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vmware_net
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = lookup(var.vmware_template,var.vmware_template_STR)
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  folder           = var.vmware_folder
  name             = var.vmware_vmname
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  #firmware = "efi"
  num_cpus = var.vmware_vmcpu
  memory   = var.vmware_vmram
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = var.vmware_sorage-size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
        customize {
  linux_options {
    host_name = var.vmware_vmname
    domain    = "example.local"
  }
network_interface {
    ipv4_address = var.vmware_vmip
    ipv4_netmask = 24
  }
  ipv4_gateway = var.vmware_gwip
  dns_server_list = ["${var.dns_list}"]
  dns_suffix_list = ["${var.dns_search}"]
    }
  }
}
