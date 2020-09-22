# =================== #
# Deploying VMware VM  I'm going to test a bit more#
# =================== #
# Connect to VMware vSphere vCenter
provider "vsphere" {
#  version        = "1.20.0"
  user           = var.vsphere-user
  password       = var.vsphere-password
  vsphere_server = var.vsphere-vcenter
  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}
# Define VMware vSphere


data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_content_library" "library" {
  name = "nested-appliances"
}

data "vsphere_content_library_item" "item" {
  name       = "${var.content_library_item2}"
  library_id = data.vsphere_content_library.library.id
}

data "vsphere_host" "host" {
  name          = "${var.vsphere-host}"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_resource_pool" "pool" {
  name          = "${var.vm-rpool}"
  datacenter_id = data.vsphere_datacenter.dc.id
}


# Create VMs

resource "vsphere_virtual_machine" "vmFromLocalOvf" {
  count            = var.vm-count
  name             = "${var.vm-name}-${count.index + 1}"
#  name                       = "vm2"
  #folder           = "${var.vm-folder}"
#resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  resource_pool_id           = data.vsphere_resource_pool.pool.id
  datastore_id               = data.vsphere_datastore.datastore.id
  host_system_id             = data.vsphere_host.host.id
  memory                     = "65536"
  memory_hot_add_enabled    = true
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  datacenter_id              = data.vsphere_datacenter.dc.id
  num_cpus        		 = "16"


ovf_deploy {
    local_ovf_path = "/tmp/${var.content_library_item}"
    disk_provisioning = "thin"
    ip_protocol          = "IPV4"
    ip_allocation_policy = "STATIC_MANUAL"
    ovf_network_map = {
        "VM Network" = data.vsphere_network.network.id
    }
}
#  ovf_deploy {
#    // Url to remote ovf/ova file
#    remote_ovf_url = "https://download3.vmware.com/software/vmw-tools/nested-esxi/${var.content_library_item}"
#  }
  vapp {
    properties = {
      "guestinfo.hostname" = "${var.vm-name}-${count.index + 1}",
      "guestinfo.ipaddress" = "${var.vm-guest-ipaddress}${count.index + 1}",
      "guestinfo.netmask" = "255.255.255.0",
      "guestinfo.gateway" = "192.168.2.1",
      "guestinfo.dns" = "192.168.2.10",
      "guestinfo.domain" = "acelab.local",
      "guestinfo.ntp" = "192.168.2.10",
      "guestinfo.password" = "VMware1!",
      "guestinfo.ssh" = "True"
    }
  }
}




#resource "vsphere_virtual_machine" "vm" {
#  count            = var.vm-count
#  name             = "${var.vm-name}-${count.index + 1}"
#  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#  datastore_id     = data.vsphere_datastore.datastore.id
#  num_cpus         = var.vm-cpu
#  memory           = var.vm-ram
#  guest_id         = var.vm-guest-id
#  network_interface {
#    network_id = data.vsphere_network.network.id
#  }
#  disk {
#    label = "${var.vm-name}-${count.index + 1}-disk"
#    size  = 50
#  }
#  clone {
#    template_uuid = data.vsphere_virtual_machine.template.id
#    //customize {
#    #   timeout = 0
#    #
#    #   linux_options {
#    #     host_name = "node-${count.index + 1}"
#    #     domain    = var.vm-domain
#    #   }
#    #
#    #   network_interface {}
##    # }
#  }
#}
