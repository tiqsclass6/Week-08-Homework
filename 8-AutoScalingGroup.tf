resource "aws_autoscaling_group" "ASG01" {
  name              = "ASG01"
  target_group_arns = [aws_lb_target_group.TG01-ASG01.arn]
  desired_capacity  = 9
  max_size          = 15
  min_size          = 6
  force_delete      = true
  vpc_zone_identifier = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1b.id,
    aws_subnet.private-us-east-1c.id
  ]

  launch_template {
    id      = aws_launch_template.TG01-EC2-Template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ASG01"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "ASG01-Policy" {
  name                   = "ASG01-Policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.ASG01.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}
