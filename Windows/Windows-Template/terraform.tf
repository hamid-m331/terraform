
data "vsphere_datastore" "datastore" {
  name          = var.vmware_storage
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "CH-CL"
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

  firmware = "efi"
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
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      windows_options {
        computer_name = var.vmware_vmname
        # workgroup      = "CP-DB"
        join_domain           = ""
        admin_password        = var.winadmin_password
        domain_admin_user     = ""
        domain_admin_password = var.domain_secret
        time_zone             = "160"
      }
      network_interface {
        ipv4_address = var.vmware_vmip
        ipv4_netmask = 24
      }

      ipv4_gateway    = var.vmware_gwip
      dns_server_list = ["8.8.8.8,1.1.1.1"]
    }
  }
}
