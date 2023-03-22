
# pull the image
# docker pull <image>
resource "docker_image" "dov-bear" {
    name = var.image_name
}

# run the container
# docker run -d -p 8080:3000 <image>
resource "docker_container" "dov-bear" {
    count = var.instance_count
    name = "my-dov-bear-${count.index}"
    image = docker_image.dov-bear.image_id
    ports {
        internal = 3000
        external = 3000 + count.index
    }
    ports {
        internal = 3100
        external = 3100 + count.index
    }
    env = [
        "INSTANCE_NAME=my-dov-bear"
    ]
}

output "dov_ports" {
    value = docker_container.dov-bear[*].ports[0].external
    # value = [ 
    #     for d in docker_container.dov-bear: [ 
    #         for p in d.ports: p[*].external
    #     ] 
    # ]
}

# data digitalocean_ssh_key "apic" {
#     name = "aipc"
# }

# output aipc_fingerprint {
#     description = "AIPC fingerprint"
#     value = data.digitalocean_ssh_key.apic.fingerprint
# }

# output aipc_public_key {
#     value = data.digitalocean_ssh_key.apic.public_key
# }