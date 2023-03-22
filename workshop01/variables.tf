variable do_token {
    type = string
    sensitive = true
}

variable docker_host {
    type = string
}

variable docker_cert_path {
    type = string
    sensitive = true
}

variable app_namespace {
    type = string 
    default = "my"
}

variable database_version {
    type = string
    default = "v3.1"
}

variable backend_version {
    type = string
    default = "v3"
}

variable backend_instance_count{
    type = number
    default = 3
}