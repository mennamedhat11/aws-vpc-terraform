resource "aws_vpc" "vpc_dev" {
  cidr_block       = var.vpc_cidr
  enable_dns_support   = true   # DNS resolution
  enable_dns_hostnames = true   # DNS hostnames
  tags = {
    Name = "vpc-${var.env}"
  }
}
