resource "aws_instance" "myproject" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
}

