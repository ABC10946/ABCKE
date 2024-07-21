module "k8s-vega" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "vega.element"
	nodes = [
#		{
#			hostname = "k8s-master1"
#			ipaddr = "192.168.10.91"
#			memory_size = 4096
#			disk_size = "10G"
#		},
		{
			hostname = "k8s-master2"
			ipaddr = "192.168.10.92"
			memory_size = 4096
			disk_size = "10G"
		}, 
	]
}

module "k8s-jupiter" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "jupiter.element"
	nodes = [
		{
			hostname = "k8s-worker1"
			ipaddr = "192.168.10.101"
			memory_size = 8192
			disk_size = "50G"
		}, 
		{
			hostname = "k8s-worker2"
			ipaddr = "192.168.10.102"
			memory_size = 8192
			disk_size = "50G"
		},
		{
			hostname = "k8s-worker3"
			ipaddr = "192.168.10.103"
			memory_size = 8192
			disk_size = "50G"
		},
		{
			hostname = "k8s-master3"
			ipaddr = "192.168.10.93"
			memory_size = 4096
			disk_size = "10G"
		},
		{
			hostname = "k8s-master4"
			ipaddr = "192.168.10.94"
			memory_size = 4096
			disk_size = "10G"
		}
	]
}

module "k8s-vtm" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "jupiter.element"
	nodetype = "vtm"
	nodes = [
		{
			hostname = "k8s-vtm1"
			ipaddr = "192.168.10.110"
			memory_size = 4096
			disk_size = "10G"
		}
	]
}
