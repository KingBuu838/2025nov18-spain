####Public####

resource "aws_route_table" "public-valkyrie-head" {
  vpc_id = aws_vpc.valkyrie-head.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.valkyrie-igw.id
  }

  tags = {
    Name = "public-valkyrie-head"
  }
}

####Private####

resource "aws_route_table" "private-valkyrie-head" {
  vpc_id = aws_vpc.valkyrie-head.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.valkyrie-nat.id
  }

  tags = {
    Name = "private-valkyrie-head"
  }
}

####Public####

resource "aws_route_table_association" "public-eu-south-2a" {
  subnet_id      = aws_subnet.public-eu-south-2a.id
  route_table_id = aws_route_table.public-valkyrie-head.id
}

resource "aws_route_table_association" "public-eu-south-2b" {
  subnet_id      = aws_subnet.public-eu-south-2b.id
  route_table_id = aws_route_table.public-valkyrie-head.id
}

resource "aws_route_table_association" "public-eu-south-2c" {
  subnet_id      = aws_subnet.public-eu-south-2c.id
  route_table_id = aws_route_table.public-valkyrie-head.id
}

####Private####

resource "aws_route_table_association" "private-eu-south-2a" {
  subnet_id      = aws_subnet.private-eu-south-2a.id
  route_table_id = aws_route_table.private-valkyrie-head.id
}

resource "aws_route_table_association" "private-eu-south-2b" {
  subnet_id      = aws_subnet.private-eu-south-2b.id
  route_table_id = aws_route_table.private-valkyrie-head.id
}

resource "aws_route_table_association" "private-eu-south-2c" {
  subnet_id      = aws_subnet.private-eu-south-2c.id
  route_table_id = aws_route_table.private-valkyrie-head.id
}