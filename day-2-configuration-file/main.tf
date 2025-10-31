resource "aws_instance" "name" {
  ami = "ami-06d455b8b50b0de4d"
  instance_type = "t3.micro"
  tags = {
    Name = "bastion"
  }
}