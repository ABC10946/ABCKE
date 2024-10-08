resource "local_file" "cloud_init_user_data_file" {
	for_each = {for i in var.nodes: i.hostname => i}
	content = templatefile("${path.module}/userdata/cloud-config.yaml", {hostname = each.value.hostname, nodetype = var.nodetype})
	filename = "${path.module}/userdata/tmp/cloud-config-${each.value.hostname}.yaml"
}

resource "null_resource" "cloud_init_config" {
	for_each = {for i in var.nodes: i.hostname => i}
	connection {
		type = "ssh"
		user = var.proxmox_ssh_user
		password = var.proxmox_ssh_password
		host = var.proxmox_host
	}
	provisioner "file" {
		source = local_file.cloud_init_user_data_file[each.key].filename
		destination = "/var/lib/vz/snippets/cloud-config-${each.value.hostname}.yaml"
	}
}

# resource "remote_file" "cloud_init_config" {
# 	for_each = {for i in var.nodes: i.hostname => i}
# 	depends_on = [
# 		local_file.cloud_init_user_data_file
# 	]
# 	conn {
# 		host = var.proxmox_host
# 		user = var.proxmox_ssh_user
# 		password = var.proxmox_ssh_password
# 	}
# 	path = "/var/lib/vz/snippets/cloud-config-${each.value.hostname}.yaml"
# 	content = file(local_file.cloud_init_user_data_file[each.key].filename)
# }

resource "proxmox_vm_qemu" "vm" {
	for_each = {for i in var.nodes: i.hostname => i}

	depends_on = [
		null_resource.cloud_init_config
	]
	os_type = "cloud-init"
	vmid = tonumber(regex("\\d*$", "${each.value.ipaddr}")) + 1000

	name = "${each.value.hostname}"
	target_node = trimsuffix(var.proxmox_host, ".local")
	clone = "ubuntu-template"
	onboot = true
	qemu_os = "other"
	cores = 2

	cicustom = "user=local:snippets/cloud-config-${each.value.hostname}.yaml"

	memory = each.value.memory_size

	ipconfig0 = "ip=${each.value.ipaddr}/24,gw=${var.gw}"
	scsihw      = "virtio-scsi-pci"
	nameserver = "192.168.10.140"
	searchdomain = "local"

	disks {
		ide {
			ide3 {
				cloudinit {
					storage = "local-lvm"
				}
			}
		}
		scsi {
			scsi0 {
				disk {
					size = each.value.disk_size
					storage = "local-lvm"
					iothread = false
					replicate = true
					backup = false
				}
			}
		}
	}

	network {
		bridge = "vmbr0"
		model = "virtio"
	}
}
