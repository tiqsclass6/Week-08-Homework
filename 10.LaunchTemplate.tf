resource "aws_launch_template" "TG01-EC2-Template" {
  name          = "TG01-EC2-Template"
  description   = "TG01-EC2-Template"
  image_id      = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name      = "basiclinux"

  tags = {
    Name = "TG01-EC2-Template"
  }

  vpc_security_group_ids = [aws_security_group.ASG01-TG01.id]

  user_data = filebase64("ec2scrpit.sh")
}
