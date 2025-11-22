resource "aws_subnet" "public-eu-south-2a" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.1.0/24"
  availability_zone = "eu-south-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-south-2a"
  }
}

resource "aws_subnet" "public-eu-south-2b" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.2.0/24"
  availability_zone = "eu-south-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-south-2b"
  }
}

resource "aws_subnet" "public-eu-south-2c" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.3.0/24"
  availability_zone = "eu-south-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-south-2c"
  }
}

####Private####

resource "aws_subnet" "private-eu-south-2a" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.11.0/24"
  availability_zone = "eu-south-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-eu-south-2a"
  }
}

resource "aws_subnet" "private-eu-south-2b" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.12.0/24"
  availability_zone = "eu-south-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-eu-south-2b"
  }
}

resource "aws_subnet" "private-eu-south-2c" {
  vpc_id     = aws_vpc.valkyrie-head.id
  cidr_block = "10.30.13.0/24"
  availability_zone = "eu-south-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-eu-south-2c"
  }
}