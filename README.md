# terraform-deploy-nested-esxi-hosts

Authored by Raghu Pemmaraju
VMware 
September 2020

# Introduction

The objective was to find a way to automate the deployment of Nested Labs for testing purposes. This is part of other scripts and tools used to automate the process I have had to go through for deploying Nested Labs and configuration especially to test out vSphere (6.7 & 7.0), with NSX-T and TKGI. 

The high-level workflow is (this is evolving as we build and learn from this process):


1. This is a Nested Deployment and requires the following to be already in place
   	*. Physical Compute: ESXi Physcial Host(s) are already deployed with ESXi 6.x? For my environment I have two physcial servers with ESXi 6.7 installed. 
	*. vCenter is configured: vCenter is installed to leverage the vCenter APIs to deploy the nested ESXi hosts
	*. Storage: Storage is required to be attached to this infrastructure; I'm using locally attached storage to each of the ESXi hosts. Then on one of the hosts I created a NFS storage using FreeNAS. 
	*. Networking: For the nested environment, I wanted to use VLAN tagging and for that I setup VyOS router. The network topology assumes all ESXi hosts are using VLAN id 2 and a network is already defined. 
	*. Other services: This environment uses AD, DNS, NTP and for that we used an existing Windows Server template to act as a jumpbox. 
	*. Terraform server: Installed an Ubuntu server as a Terraform server that also has Go programming language and govomi and govc library
	
2. Once the above are in place, you can use the terraform templates
	*. They do assume that the nested ESXi image is downloaded to a local repository. 
	*. 

......More documentation updates to come......


Once these nested esxi hosts are deployed; I noticed that don't take my num-cpus and mem/ram parameter. This seems to be a bug. For now I simply use the govc cli command to configure the right cpus and memory

    `govc vm.power -off /ACE-DC/vm/esxi-lab2-1  /ACE-DC/vm/esxi-lab2-2 /ACE-DC/vm/esxi-lab2-3 
     && sleep 10 && govc vm.change -m 65536 -c 16 -vm /ACE-DC/vm/esxi-lab2-1 && govc vm.change -m 65536 -c 16 -vm /ACE-DC/vm/esxi-lab2-2 && govc vm.change -m 65536 -c 16 -vm /ACE-DC/vm/esxi-lab2-3 
     && sleep 10 && govc vm.power -on /ACE-DC/vm/esxi-lab2-1  /ACE-DC/vm/esxi-lab2-2 /ACE-DC/vm/esxi-lab2-3
     `
The above command will shutdown the newly created hosts, change the configuration to use 16 CPUs and 64 GB of memory per host and then restart them.
