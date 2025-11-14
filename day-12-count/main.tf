provider "aws" {
  
}

resource "aws_instance" "myproject" {
  ami = var.ami_id
  instance_type = var.instance_type
  count = length(var.env)              # if you run count list, you can add no.of server but can't delete from middle of list
# count = 2
  tags = {
    Name = var.env[count.index]
  }
}

variable "ami_id" {
  description = "value"
  default = "ami-0cae6d6fe6048ca2c"
  type = string
}

variable "instance_type" {
  description = "value"
  default = "t3.micro"
  type = string
}   

variable "env" {
  description = "value"
  default = ["test","prod"]
  type = list(string)
}