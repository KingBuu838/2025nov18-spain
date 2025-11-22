resource "aws_lb_target_group" "valkyrie-tg" {
  name     = "valkyrie-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.valkyrie-head.id

   health_check {
    enabled = true
   } 
   
  tags = {
    name ="lemon-valkyrie-01"
    service = "valkyyrie-mansion"
  }
}