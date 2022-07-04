variable "region" {
    default = "us-east-1"
    type = string
}
variable "web_ingress" {
    type = map(object({
        port = number
        protocol = string
        cidr_blocks = list(string)
    }))
    default = {
        "8080" = {
            port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        "22" = {
            port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

    
    }
}