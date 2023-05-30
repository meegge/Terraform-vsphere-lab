data "vsphere_distributed_virtual_switch" "DSwitch1" {
  name          = "DSwitch1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
resource "vsphere_distributed_port_group" "Guest_116" {
  name                            = "Guest_116(16)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 16
}

resource "vsphere_distributed_port_group" "iSCSI" {
  name                            = "iSCSI"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 0
}
resource "vsphere_distributed_port_group" "iSCSI5" {
  name                            = "iSCSI(5)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 5
}
resource "vsphere_distributed_port_group" "ManagementNetwork0" {
  name                            = "ManagementNetwork(0)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 0
}
resource "vsphere_distributed_port_group" "okd20" {
  name                            = "okd(20)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 20
}
resource "vsphere_distributed_port_group" "vMotionA8" {
  name                            = "vMotion-A(8)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 8
}
resource "vsphere_distributed_port_group" "vMotionB8" {
  name                            = "vMotion-B(8)"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.DSwitch1.id

  vlan_id = 8
}
