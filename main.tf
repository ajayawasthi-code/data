
provider "aws" {
    region="us-east-2"
    }
resource "aws_vpc" "love" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-ajay"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "primary" {
    vpc_id = aws_vpc.love.id
    cidr_block = "10.0.0.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]  #  or "us-east-2a"

}

