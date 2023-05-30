data "vsphere_network" "network" {
  name          = "Guest_116(16)"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "hello-world" {
  name             = "hello-world"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  folder           = "Terraform"
  firmware         = "efi"
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      windows_options {
        computer_name  = "hello-world"
        workgroup      = "workgroup"
        admin_password = "guest OS password goes here"
      }
      network_interface {
        ipv4_address = "if you have DHCP leave this blank"
        ipv4_netmask = 24
      }
      ipv4_gateway = "if you have DHCP leave this blank"
    }
  }
}
