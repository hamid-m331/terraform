variable "vsphere_user" {
  description = "vSphere User Name"
}

variable "vsphere_password" {
  description = "vSphere Password"
  sensitive   = true
  type        = string
}

variable "vsphere_vcenter" {
  description = "vCenter to connect to"
}

variable "vmware_net" {
  type        = string
  description = "vmware"
}

variable "vmware_storage" {
  type        = string
  default     = "SAN"
  description = "vmware storage"
}

variable "vmware_template_STR" {
  type        = string
  description = "vmware tmp storage"
}

variable "vmware_template" {
  type = map 
  default = {
    ubuntu18  = "ubuntu18-tmp"
    ubuntu20 = "ubuntu20-tmp"
  }
  description = "values are ubuntu20 ubuntu18"
}

variable "vmware_folder" {
}

variable "vmware_vmname" {

}

variable "vmware_vmcpu" {
#  default = "4"

}

variable "vmware_vmram" {
 # default = "8000"

}

variable "vmware_vmip" {

}

variable "vmware_gwip" {

}
variable "dns_list" {
  default = "8.8.8.8,1.1.1.1"
}

variable "dns_search" {
  default = "example.local"
}

variable "vmware_sorage-size" {
  
}