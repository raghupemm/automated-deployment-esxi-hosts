# VMware VMs configuration #
vm-count             = "3"
#vm-name              = "pacific-lab-2"
content_library_item = "Nested_ESXi7.0_Appliance_Template_v1.ova"
content_library_item2 = "Nested_ESXi7.0_Appliance_Template_v1.0"
vm-template-name     = "Pacific-ESXI"
vm-cpu               = "16"
vm-ram               = "65536"
#vm-guest-id          = "vmkernel65Guest"
vm-guest-id          = "other3xLinux64Guest"
vm-name		     = "esxi-lab2"
vm-guest-ipaddress  = "192.168.2.1"
vsphere-host         = "10.176.1.31"
vm-folder            = "lab2"
vm-rpool             = "rp-lab2"
# VMware vSphere configuration #
# VMware vCenter IP/FQDN

## Another test
vsphere-vcenter = "10.176.123.12"
# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@vsphere.local"
# VMware vSphere password used to deploy the infrastructure
vsphere-password = "VMware1!"
# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"
# vSphere datacenter name where the infrastructure will be deployed
vsphere-datacenter = "ACE-DC"
# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "ACE-CL"
# vSphere Datastore used to deploy VMs
vm-datastore = "NFS1"
# vSphere Network used to deploy VMs
vm-network = "VLAN2-LAB"

#This is a test
# Linux virtual machine domain name
vm-domain = "vsphere.local"
