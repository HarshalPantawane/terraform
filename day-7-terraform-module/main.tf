resource "aws_instance" "server" {
  tags = {
    Name = "dev"
  }
  ami = var.ami_id
  instance_type = var.instance_type
}