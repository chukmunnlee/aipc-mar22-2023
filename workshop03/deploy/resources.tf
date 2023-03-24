data "digitalocean_ssh_key" "aipc" {
    name = var.do_ssh_key
}

data "digitalocean_image" "codeserver" {
    name = "codeserver"
}

data "cloudflare_zone" "chuklee" {
    name = "chuklee.com"
}

resource "digitalocean_droplet" "codeserver" {
    name = "codeserver"
    image = var.do_image
    region = var.do_region
    size = var.do_size

    ssh_keys = [ data.digitalocean_ssh_key.aipc.id ]

    connection {
      type = "ssh"
      user = "root"
      private_key = file(var.ssh_private_key)
      host = self.ipv4_address
    }

    provisioner remote-exec {
        inline = [
            "sed -i 's/__CODESERVER_PASSWORD__/${var.cs_password}/' /lib/systemd/system/code-server.service",
            "sed -i 's/__DOMAIN_NAME__/${var.cs_domain}/' /etc/nginx/sites-available/code-server.conf",
            "systemctl daemon-reload",
            "systemctl restart code-server",
            "systemctl restart nginx"
        ]
    }
}

resource "cloudflare_record" "codeserver" {
    name = "codeserver"
    zone_id = data.cloudflare_zone.chuklee.id
    value = digitalocean_droplet.codeserver.ipv4_address
    type = "A"
    proxied = true
}

resource "local_file" "root_at_codeserver" {
    filename = "root@${digitalocean_droplet.codeserver.ipv4_address}"
    content = ""
    file_permission = "0444"
}

output codeserver_ip {
    value = digitalocean_droplet.codeserver.ipv4_address
}
