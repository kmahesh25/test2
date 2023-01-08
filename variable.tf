variable "private_subnets_cidr" {
    type = list(string)
    default = [
        "172.31.48.0/20",
        "172.31.64.0/20",
        "172.31.80.0/20"
    ]

}