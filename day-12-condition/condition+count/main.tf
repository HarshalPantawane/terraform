provider "aws" {
  
}

variable "aws_region" {
    description = "The region in which to create the infrastructure"
    type = string
    nullable = true
    default = "us-east-1"
    validation {
      condition = var.aws_region == "us-east-1" || var.aws_region == "eu-west-1"
      error_message = "The variable 'aws_region' must be one of the following regions: us-east-1, eu-west-1"
    }
}



resource "aws_s3_bucket" "name" {
    bucket = "project-${var.aws_region}"
  
}

# resource "aws_instance" "name" {
#   ami = "ami-0cae6d6fe6048ca2c"
#   instance_type = "t3.micro"
#   count = var.env == "prod" ? 2:1
 
#   tags = {
#     Name =  "dev"
#   }
# }

# variable "env" {
#   type = string
#   default = "prod"
# }


