terraform {
	required_providers {
		vtm = {
			source = "terraform.example.com/examplecorp/vtm"
			version = ">=8.3"
		}
	}
}


provider "vtm" {
	base_url = "https://vtm1.local:9070/api"
	username = "admin"
	password = "hoge"
	verify_ssl_cert = false
}

resource "vtm_pool" "k8s-master-lb-pool" {
	name = "k8s-master-lb-pool"
	monitors = ["Ping"]
	nodes_table {
		node = "k8s-master1.local:6443"
	}
	nodes_table {
		node = "k8s-master2.local:6443"
	}
 	nodes_table {
 		node = "k8s-master3.local:6443"
 	}
}

resource "vtm_traffic_ip_group" "k8s-master-lb-tip" {
	name = "k8s-master-lb-tip"
	ipaddresses = ["192.168.10.120"]
	machines = ["vtm1.local", "vtm2.local"]
}

resource "vtm_virtual_server" "k8s-master-lb-vs" {
	name = "k8s-master_lb-vs"
	enabled = "true"
	listen_on_traffic_ips = ["${vtm_traffic_ip_group.k8s-master-lb-tip.name}"]
	pool = "${vtm_pool.k8s-master-lb-pool.name}"
	port = "6443"
	protocol = "https"
}
