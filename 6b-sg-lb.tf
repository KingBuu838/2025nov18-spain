
resource "aws_security_group" "lemon-valkyrie-lb" {
  name        = "lemon-valkyrie-lb"
  description = "Allow traffic for Load Balancer"
  vpc_id      = aws_vpc.valkyrie-head.id

  tags = {
    Name = "lemon-valkyrie-lb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "lemon-valkyrie-http" {
  security_group_id = aws_security_group.lemon-valkyrie-lb.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "Valkyrie-http"
  }
}

resource "aws_vpc_security_group_egress_rule" "lemon-valkyrie-outbound-2" {
  security_group_id = aws_security_group.lemon-valkyrie-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "Valkyrie-outbound"
  }
}