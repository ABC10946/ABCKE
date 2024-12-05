variable "hostname" {
	type = string
	default = ""
}


variable "proxmox_host" {
	type = string
	default = ""
}


variable "gw" {
	type = string
	default = "192.168.10.1"
}


variable "nodes" {
	type = list(object({
		hostname = string
		ipaddr = string
		memory_size = number
		disk_size = string
		cores = number
	}))
	default = [
	]
}

variable "nodetype" {
	type = string
	default = "k8s"
}
