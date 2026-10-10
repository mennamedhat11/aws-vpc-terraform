resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "IGW"
  }
}
