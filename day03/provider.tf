terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "2.26.0"
        }
        local = {
            source = "hashicorp/local"
            version = "2.4.0"
        }
    }

    backend "s3" {
        endpoint = "https://sgp1.digitaloceanspaces.com"
        region = "sgp1"
        bucket = "acme"
        #key = "terraform.tfstate"
        skip_credentials_validation = true 
        skip_region_validation = true 
        skip_metadata_api_check = true
    }
}

provider digitalocean {
    token = var.do_token
}

provider local { }