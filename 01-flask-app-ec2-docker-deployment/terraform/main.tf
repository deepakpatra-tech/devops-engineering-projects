# VPC Block
resource "aws_vpc" "flask-vpc" {
  cidr_block = var.cidr_block_vpc
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "flask-app-deploy-vpc"
  }
}

# Subnet Block

resource "aws_subnet" "flask-public-subnet" {
  vpc_id = aws_vpc.flask-vpc.id
  cidr_block = var.cidr_block_subnet
  tags = {
    Name = "flask-app-deploy-psubnet"
  }
}

# internet gateway block

resource "aws_internet_gateway" "flask-igw" {
  vpc_id = aws_vpc.flask-vpc.id
  tags = {
    Name = " flask-app-igw"
  }
}

# Route table

resource "aws_route_table" "flask-app-RT-public" {
  vpc_id = aws_vpc.flask-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.flask-igw.id
  }
  tags = {
    Name = "flask-public-RT"
  }
}

resource "aws_route_table_association" "aws_route_table_association" {
  subnet_id = aws_subnet.flask-public-subnet.id
  route_table_id = aws_route_table.flask-app-RT-public.id
}