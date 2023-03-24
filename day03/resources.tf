# images
data "digitalocean_ssh_key" "aipc" {
    name = var.do_ssh_key
}

data "digitalocean_image" "mynginx" {
    name = "mynginx"
}

resource "digitalocean_droplet" "mynginx" {
    name = "mynginx"
    image = data.digitalocean_image.mynginx.id 
    region = var.do_region
    size = var.do_size

    ssh_keys = [ data.digitalocean_ssh_key.aipc.id ]
}

output nginx_ip {
    value = digitalocean_droplet.mynginx.ipv4_address
}