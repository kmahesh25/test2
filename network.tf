resource "aws_subnet" "private_subnet" {
  vpc_id                  = local.vpc_id
  count                   = length(var.private_subnets_cidr)
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(local.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name        = format("%s-private-subnet", element(local.availability_zones, count.index))
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "private_route_table" {
  vpc_id = local.vpc_id
  tags = {
    Name = "private_route_table"

  }
}


resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}