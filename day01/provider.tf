terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.2"
        }
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "2.26.0"
        }
        local = {
            source = "hashicorp/local"
            version = "2.4.0"
        }
    }
}

provider docker {
    # host = "unix:///var/run/docker.sock"
    host = "tcp://159.223.58.69:2376"
    cert_path = "/home/cmlee/.docker/machine/machines/myserver"
}

provider digitalocean {
    # don't dp this
    token = var.do_token

}

provider local { }