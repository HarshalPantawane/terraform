 #count + condition with different name

resource "aws_instance" "server" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  count = var.env ? length(var.name):0
 
  tags = {
    Name =  var.name[count.index]
  }
}

variable "env" {
  type = bool
  default = "true"
 }

variable "name" {
  type = list(string)
  default = ["test"]
}