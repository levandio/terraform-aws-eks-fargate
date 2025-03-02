terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-private-subnet-${count.index}"
  }
}

# Example NAT Gateway, route tables, etc. (optional)
# resource "aws_internet_gateway" "igw" { ... }
# resource "aws_nat_gateway" "nat" { ... }

