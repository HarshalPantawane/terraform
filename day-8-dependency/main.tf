resource "aws_instance" "name" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"

  depends_on = [ aws_s3_bucket.name ]
}

resource "aws_s3_bucket" "name" {
  bucket = "jndugcbwcvwnfcwb"
  tags = {
    Name = "demobucket"
    Envirnment = "dev"  
  }
  
}