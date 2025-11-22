resource "aws_instance" "valkyrie-time" {
    ami = "ami-0852b7c8ad3192a1a"
    instance_type = "t3.small"
    vpc_security_group_ids = [aws_security_group.valkyrie-head-public.id, aws_security_group.lemon-valkyrie-lb.id]
    associate_public_ip_address = true
    subnet_id = aws_subnet.public-eu-south-2a.id

    user_data = file("user_data.sh")

       tags = {
      Name = "lemon-win-deep"
 }
}