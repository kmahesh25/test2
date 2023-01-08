output "vpc_id" {
  description = "Default VPC ID"
  value = local.vpc_id
}

output "subnet_ids" {
  description = "Subnets in Default VPC"
  value = local.subnet_ids
}

output "vpc_cidr" {
  description = "CIDR in Default VPC"
  value = local.vpc_cidr
}

output "subnets_cidr" {
  description = "CIDR in Default VPC Subnets"
  value = local.subnets_cidr
}

output "availability_zones" {
  description = "AZ in Default VPC Subnets"
  value = local.availability_zones
}

output "availability_zone_ids" {
  description = "AZ IDS in Default VPC Subnets"
  value = local.availability_zone_ids
}

output "private_subnets_cidr" {
  description = "private subnet cidr in default VPC"
  value = var.private_subnets_cidr
}

output "private_subnet_ids" {
  description = "private subnets id in default VPC"
  value = aws_subnet.private_subnet.*.id
}