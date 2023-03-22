variable do_token {
    type = string
    sensitive = true
}

variable image_name {
    type = string 
    default = "chukmunnlee/dov-bear:v4"
}

variable instance_count {
    type = number
    default = 3
}