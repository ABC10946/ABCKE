terraform {
	required_providers {
		proxmox = {
			source = "telmate/proxmox"
			version = "3.0.1-rc4"
		}
	}
}

provider "proxmox" {
	pm_user = var.pve_user
	pm_password = var.pve_password
	pm_api_url = "https://${var.proxmox_host}:8006/api2/json"
	pm_tls_insecure = true
}

