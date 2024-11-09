resource "aws_internet_gateway" "ASG01-vpc-igw" {
  vpc_id = aws_vpc.ASG01-vpc.id
  tags = {
    Name    = "ASG01-vpc-igw"
    Service = "IGW"
  }
}