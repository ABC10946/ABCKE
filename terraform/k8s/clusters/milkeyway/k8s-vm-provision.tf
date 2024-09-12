module "k8s-magnesium" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "magnesium.element"
	nodes = [
		{
			hostname = "k8s-master1"
			ipaddr = "192.168.10.91"
			memory_size = 4096
			disk_size = "10G"
		},
		{
			hostname = "k8s-worker1"
			ipaddr = "192.168.10.101"
			memory_size = 16384
			disk_size = "10G"
		},
	]
}

module "k8s-neptune" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "neptune.element"
	nodes = [
		{
			hostname = "k8s-master2"
			ipaddr = "192.168.10.92"
			memory_size = 4096
			disk_size = "10G"
		}, 
		{
			hostname = "k8s-worker2"
			ipaddr = "192.168.10.102"
			memory_size = 16384
			disk_size = "10G"
		},
	]
}

module "k8s-uranus" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "uranus.element"
	nodes = [
 		{
 			hostname = "k8s-master3"
 			ipaddr = "192.168.10.93"
 			memory_size = 4096
 			disk_size = "10G"
 		},
		{
			hostname = "k8s-worker3"
			ipaddr = "192.168.10.103"
			memory_size = 16384
			disk_size = "10G"
		},
	]
}

module "k8s-vtm1" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "magnesium.element"
	nodetype = "vtm"
	nodes = [
		{
			hostname = "vtm1"
			ipaddr = "192.168.10.51"
			memory_size = 2048
			disk_size = "10G"
		}
	]
}

module "k8s-vtm2" {
	source = "../../modules/proxmox/vm"
	proxmox_host = "neptune.element"
	nodetype = "vtm"
	nodes = [
		{
			hostname = "vtm2"
			ipaddr = "192.168.10.52"
			memory_size = 2048
			disk_size = "10G"
		}
	]
}
