# create server
resource "aws_instance" "name" {
  instance_type = var.type
  ami = var.ami_id
  tags = {
    Name = "bastion"
  }
}

# create vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "project-vpc"
  }
}


resource "aws_internet_gateway" "vpc-ig" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "ig"
  }
}
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "private subnet"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-ig.id
}

resource "aws_route_table_association" "rt_asso" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_s3_bucket" "bucket" {
  bucket = "juodhcuohaue"
}
  