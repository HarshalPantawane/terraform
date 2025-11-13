resource "aws_instance" "my_project" {
  ami = local.ami_id
  instance_type = local.instance_type
  tags = {
    Name = local.instance_name
  }
}

locals {
  ami_id = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  
}

variable "ami_id" {
  default = "ami-0cae6d6fe6048ca2c"
  description = "value"
  type =  string   
}

variable "instance_name" {
  description = "value"
  default = "dev"
  type = string
}

variable "instance_type" {
  description = "value"
  default = "t3.micro"
  type = string
}
