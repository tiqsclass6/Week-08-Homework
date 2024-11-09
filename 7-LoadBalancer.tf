resource "aws_lb" "ASG01-LB01" {
  name               = "ASG01-LB01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ASG01-TG01.id]
  subnets = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
    aws_subnet.public-us-east-1c.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "ASG01-LB01"
  }
}

resource "aws_lb_listener" "TG01-ASG01-Listener" {
  load_balancer_arn = aws_lb.ASG01-LB01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG01-ASG01.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.ASG01-LB01.dns_name
  description = "The DNS name of the Auto Scale Group 01 - Load Balancer."
}