terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
}

provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "password goes here"
  vsphere_server       = "vcenter ip address here"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "LAB" {}

resource "vsphere_folder" "Terraform-folder" {
  path          = "Terraform"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.LAB.id
}

data "vsphere_datacenter" "datacenter" {
  name = "LAB"
}

data "vsphere_datastore" "datastore" {
  name          = "data store name goes here"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "LAB"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "2019DCTemplate"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}