variable "pve_user" {
	type = string
	default = "terraform-prov@pve"
}

variable "pve_password" {
	type = string
	default = "terraform"
}

variable "proxmox_ssh_user" {
	type = string
	default = "root"
}

variable "proxmox_ssh_password" {
	type = string
	default = "poison@punch.com"
}
