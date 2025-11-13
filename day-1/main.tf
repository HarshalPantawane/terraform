# resource "aws_vpc" "examplete" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     name = "machho-vpc"
#   }
# }
resource "aws_vpc" "name" {
  tags = {
    Name = "project-vpc"
 }
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public subnet"
  }
}