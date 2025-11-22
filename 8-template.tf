resource "aws_launch_template" "valkyrie-web" {
    description = "launch template for web tier servers"
    image_id = "ami-0852b7c8ad3192a1a" #eu-south-2
    instance_type = "t3.small"
    vpc_security_group_ids = [aws_security_group.valkyrie-head-public.id, aws_security_group.lemon-valkyrie-lb.id]
    

    tags ={
        name = "valkyrie-web"
    }

    user_data = filebase64("user_data.sh")
}