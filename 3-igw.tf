resource "aws_internet_gateway" "valkyrie-igw" {
  vpc_id = aws_vpc.valkyrie-head.id

  tags = {
    Name = "valkyrie-igw"
  }
}