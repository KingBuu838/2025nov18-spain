resource "aws_nat_gateway" "valkyrie-nat" {
  allocation_id = aws_eip.valkyrie-head-nat.id
  subnet_id     = aws_subnet.public-eu-south-2a.id

  tags = {
    Name = "valkyrie-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.valkyrie-igw]
}

#this needs to be created for the allocation id
resource "aws_eip" "valkyrie-head-nat" {

    }