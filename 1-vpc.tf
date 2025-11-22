resource "aws_vpc" "valkyrie-head" {
  cidr_block       = "10.30.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "valkyrie-head"
  }
}