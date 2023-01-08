data "aws_vpc" "default" {
      default = true
}

data "aws_subnets" "subnets" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.default.id]
    }
    filter {
    name   = "tag:Name"
    values = [""]
  }

}

data "aws_subnet" "subnet" {
    for_each = toset(data.aws_subnets.subnets.ids)
    id = each.value
}

data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
    #values = ["amzn-ami-hvm-*-x86_64-ebs"]
  }
}


locals {
    vpc_id = data.aws_vpc.default.id
    vpc_cidr = data.aws_vpc.default.cidr_block
    subnet_ids = data.aws_subnets.subnets.ids
    subnets_config = tolist([for config in data.aws_subnet.subnet: config])
    subnets_cidr = tolist([for config in local.subnets_config: config["cidr_block"]])
    availability_zones = tolist([for config in local.subnets_config: config["availability_zone"]])
    availability_zone_ids = tolist([for config in local.subnets_config: config["availability_zone_id"]])

}
