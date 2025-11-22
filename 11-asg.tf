resource "aws_autoscaling_group" "valkyrie-asg" {
    name = "valkyrie-asg"
    vpc_zone_identifier = [aws_subnet.private-eu-south-2a.id,
                           aws_subnet.private-eu-south-2b.id,
                           aws_subnet.private-eu-south-2c.id]
    max_size            = 3 # Min 1 EC2s per AZ
    min_size            = 1 # desired 2 EC2s per AZ
    desired_capacity = 3 # Max 3 EC2s per AZ
    health_check_type = "ELB"
    target_group_arns = [aws_lb_target_group.valkyrie-tg.arn]
    force_delete = true
    
 launch_template {
        id = aws_launch_template.valkyrie-web.id
        version = "$Latest"
    }
    
 tag {
    key = "name"
    value ="web-instance"
    propagate_at_launch = true
}

}

resource "aws_autoscaling_policy" "valkyrie-policy" {
  name                   = "valkyrie-policy"
  autoscaling_group_name = aws_autoscaling_group.valkyrie-asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}

