resource "aws_lb_target_group" "TG01-ASG01" {
  name        = "TG01-ASG01"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.ASG01-vpc.id

  tags = {
    Name = "TG01-ASG01"
  }
}