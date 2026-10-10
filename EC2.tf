resource "aws_instance" "EC21" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  tags = {
    Name = "EC2"
  }
}


resource "aws_instance" "EC22" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  tags = {
    Name = "EC2"
  }
}

resource "aws_instance" "EC23" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  subnet_id              = aws_subnet.private_subnet_1.id
 vpc_security_group_ids = [aws_security_group.SG.id]
  tags = {
    Name = "EC2"
  }
}

resource "aws_instance" "EC24" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  subnet_id              = aws_subnet.private_subnet_2.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  tags = {
    Name = "EC2"
  }
}
