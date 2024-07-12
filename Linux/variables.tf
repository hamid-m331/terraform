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

#variable "domain_secret" {
#  description = "domain secret"
#  sensitive   = true
#  type        = string
#}
#variable "winadmin_password" {
#  sensitive   = true
#  type        = string
#  description = "windows doamin admin pass"
#}

variable "vmware_net" {
  type        = string
  description = "vmware"
}

variable "vmware_storage" {
  type        = string
  default     = "Unity-L1"
  description = "vmware storage"
}

variable "vmware_template_STR" {
  type        = string
  description = "vmware tmp storage"
}

variable "vmware_template" {
  type = map 
  default = {
    ubuntu20 = "ubuntu20-tmp"
    ubuntu22 = "Ubuntu22-tmp"
  }
  description = "values are win2019 win2020 ubuntu20"
}

variable "vmware_folder" {
}

variable "vmware_vmname" {

}

variable "vmware_vmcpu" {

}

variable "vmware_vmram" {

}

variable "vmware_vmip" {

}

variable "vmware_gwip" {

}
variable "dns_list" {
  default = "dns1,dns2"
}

variable "dns_search" {
  default = "A.local,B.local"
}

variable "vmware_clustername" {
  default = "DC-General"
}

variable "vmware_sorage-size" {
  
}
