# terraform-deploy-nested-esxi-hosts

Authored by Raghu Pemmaraju
VMware 
September 2020

# Introduction

The objective was to find a way to automate the deployment of Nested Labs for testing purposes. This is part of other scripts and tools used to automate the process I have had to go through for deploying Nested Labs and configuration especially to test out vSphere (6.7 & 7.0), with NSX-T and TKGI. 

The high-level workflow is (this is evolving as we build and learn from this process):


1. This is a Nested Deployment and requires the following to be already in place
   	a. Physical Compute: ESXi Physcial Host(s) are already deployed with ESXi 6.x? For my environment I have two physcial servers with ESXi 6.7 installed. 
	b. vCenter is configured: vCenter is installed to leverage the vCenter APIs to deploy the nested ESXi hosts
	c. Storage: Storage is required to be attached to this infrastructure; I'm using locally attached storage to each of the ESXi hosts. Then on one of the hosts I created a NFS storage using FreeNAS. 
	d. Networking: For the nested environment, I wanted to use VLAN tagging and for that I setup VyOS router. The network topology assumes all ESXi hosts are using VLAN id 2 and a network is already defined. 
	e. Other services: This environment uses AD, DNS, NTP and for that we used an existing Windows Server template to act as a jumpbox. 
	f. Terraform server: Installed an Ubuntu server as a Terraform server that also has Go programming language and govomi and govc library
	
2. Once the above are in place, you can use the terraform templates
	a. They do assume that the nested ESXi image is downloaded to a local repository. 
	b. 

......More documentation updates to come.......




