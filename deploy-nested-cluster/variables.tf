#===========================#
# VMware vCenter connection #
#===========================#
variable "vsphere-user" {
  type        = string
  description = "VMware vSphere user name"
}
variable "vsphere-password" {
  type        = string
  description = "VMware vSphere password"
}
variable "vsphere-vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
}
variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
}
variable "vsphere-datacenter" {
  type        = string
  description = "VMWare vSphere datacenter"
}
variable "vsphere-cluster" {
  type        = string
  description = "VMWare vSphere cluster"
  default     = ""
}
variable "vsphere-template-folder" {
  type        = string
  description = "Template folder"
  default     = "Nested Pacific ESXis"
}
#================================#
# VMware vSphere virtual machine #
#================================#
variable "vm-count" {
  type        = string
  description = "Number of VM"
  default     = 1
}
variable "vm-name-prefix" {
  type        = string
  description = "Name of VM prefix"
  default     = "playtftest"
}
variable "vm-datastore" {
  type        = string
  description = "Datastore used for the vSphere virtual machines"
}
variable "vm-network" {
  type        = string
  description = "Network used for the vSphere virtual machines"
}
variable "vm-linked-clone" {
  type        = string
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}
variable "vm-cpu" {
  type        = string
  description = "Number of vCPU for the vSphere virtual machines"
  default     = "2"
}
variable "vm-ram" {
  type        = string
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
}
variable "vm-name" {
  type        = string
  description = "The name of the vSphere virtual machines and the hostname of the machine"
}
variable "vm-guest-id" {
  type        = string
  description = "The ID of virtual machines operating system"
}
variable "vm-template-name" {
  type        = string
  description = "The template to clone to create the VM"
}
variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
}
variable "content_library_item" {
  type        = string
  description = "Content Library Template Item"
  default     = ""
}
variable "content_library_item2" {
  type        = string
  description = "Content Library Template Item"
  default     = ""
}

variable "vm-guest-ipaddress" {
  type        = string
  description = "The ID of virtual machines IP address"
}
variable "vsphere-host" {
  type        = string
  description = "The ID of virtual machines IP address"
}
variable "vm-folder" {
  type        = string
  description = "The ID of virtual machines IP address"
}
variable "vm-rpool" {
  type        = string
  description = "The ID of virtual machines IP address"
}
