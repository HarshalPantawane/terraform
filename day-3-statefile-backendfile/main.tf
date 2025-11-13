# create vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="project-vpc"
  }
}

# create internet gateway
resource "aws_internet_gateway" "vpc-ig" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name= "project-ig"
  }
}

# create public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-subnet"
  }
}

# create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name= "private-subnet"
  }
}

# create public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "pub-rt"
  }
}

# internet association
resource "aws_route" "rt" {
   route_table_id = aws_route_table.public-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-ig.id
}


# subnet association
resource "aws_route_table_association" "rt-ass" {
    route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.public-subnet.id
}

# resource "aws_nat_gateway" "vpc-nat" {
  
# }

# #create private route 
# resource "aws_route_table" "private-rt" {
#   vpc_id = aws_vpc.my-vpc.id
#   tags = {
#     Name = "private-rt"
#   }
#   route = {
#     destination_cidr_block
#   }
# }

# create server
resource "aws_instance" "EC2" {
   ami = var.ami_id
   instance_type = var.type
   tags = {
     Name = "devdas"
   }

}


  
