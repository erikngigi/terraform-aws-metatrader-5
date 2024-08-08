resource "aws_vpc" "metatrader_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name_tag
  }
}

resource "aws_subnet" "metatrader_subnet" {
  vpc_id                  = aws_vpc.metatrader_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 0)
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name_tag
  }
}

resource "aws_internet_gateway" "metatrader_igw" {
  vpc_id = aws_vpc.metatrader_vpc.id

  tags = {
    Name = var.internet_gateway_tag
  }
}

resource "aws_route_table" "metatrader_rt" {
  vpc_id = aws_vpc.metatrader_vpc.id

  route {
    cidr_block = var.public_destination_route_cidr_block
    gateway_id = aws_internet_gateway.metatrader_igw.id
  }

  tags = {
    Name = var.public_route_table_tag
  }
}

resource "aws_route_table_association" "metatrader_rta" {
  subnet_id      = aws_subnet.metatrader_subnet.id
  route_table_id = aws_route_table.metatrader_rt.id
}
