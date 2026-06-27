terraform {
	backend "s3" {
		bucket   = "terraform"
		insecure = true
		endpoints = {
			s3 = "http://192.168.10.50:9000"
		}
		region                      = "main"
		key                         = "abcke.tfstate"
		skip_region_validation      = true
		skip_credentials_validation = true
		skip_requesting_account_id  = true
		skip_metadata_api_check     = true
		use_path_style              = true
	}
}
