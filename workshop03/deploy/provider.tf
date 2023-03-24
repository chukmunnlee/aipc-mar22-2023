terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "2.26.0"
        }
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "4.2.0"
        }
        local = {
            source = "hashicorp/local"
            version = "2.4.0"
        }
    }
}

provider digitalocean {
    token = var.do_token
}

provider cloudflare {
    api_token = var.cf_token
}


provider local { }