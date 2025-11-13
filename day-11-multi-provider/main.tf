resource "aws_instance" "name" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"

}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  provider = aws.west
}