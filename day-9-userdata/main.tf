provider "aws" {
  
}

resource "aws_instance" "myproject" {
  ami =  var.ami_id
  instance_type = var.instance_type
  user_data = file("test.sh")     #calling test file from current directory by using file function
  tags = {
    Name = "dev"
  }
}