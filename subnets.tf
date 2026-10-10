resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = var.public_subnet_1_cidr 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_subnet_1"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = var.public_subnet_2_cidr 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_subnet_2"
  }
}


resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = var.private_subnet_1_cidr 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_subnet_1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = var.private_subnet_2_cidr 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet_2"
  }
}
