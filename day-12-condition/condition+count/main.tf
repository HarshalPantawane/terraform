provider "aws" {
  
}

resource "aws_instance" "name" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  count = var.env == "prod" ? 2:1
 
  tags = {
    Name =  "dev"
  }
}

variable "env" {
  type = string
  default = "prod"
}


