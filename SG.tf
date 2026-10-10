resource "aws_security_group" "SG" {
  name        = "web-sg"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.vpc_dev.id

  tags = {
    Name = "web-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.from_port
  to_port           = var.to_port
  ip_protocol       = var.ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}