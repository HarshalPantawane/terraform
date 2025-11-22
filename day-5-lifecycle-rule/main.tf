# # create vpc
# resource "aws_vpc" "my-vpc" {
#   tags = {
#     Name = "Maheen-vpc"
#   }
#   cidr_block = "10.0.0.0/16"
# }

# # create internate gateway
# resource "aws_internet_gateway" "my-ig" {
#   tags = {
#     Name= "project-ig"
#   }
#   vpc_id = aws_vpc.my-vpc.id 
# }

# # create subnate public
# resource "aws_subnet" "pub-sub" {
#   vpc_id = aws_vpc.my-vpc.id
#   cidr_block = "10.0.0.0/24"
#   tags = "public-subnet"
  
# }

# # create private sub
# resource "aws_subnet" "pri-sub" {
#   vpc_id = aws_subnet.pub-sub.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "private-subnet"
#   }
# }

# # create route table
# resource "aws_route_table" "pub-rt" {
#   vpc_id = aws_vpc.my-vpc.id
#   tags = {
#     Name = "public-rt"
#   }

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my-ig.id
    
#   }
# }

# # create subnet association
# resource "aws_route_table_association" "sub-ass" {
#   route_table_id = aws_route_table.rt.id
#   subnet_id = aws_subnet.pub-sub.id

# }

# # create eip
# resource "aws_eip" "eip" {
#   domain = "vpc"
# }

# # create nat gateway
# resource "aws_nat_gateway" "nt"{
#   subnet_id = aws_subnet.pub-sub.id
#   allocation_id = aws_eip.eip.id
#   tags = {
#     Name = "project-nat"
#   }
# }

# # create private route
# resource "aws_route_table" "pri-rt" {
#   vpc_id = aws_vpc.my-vpc.id
#   tags = {
#     Name ="private-rt"
#   }

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.name.id
#   }
# }

# # create subnet association
# resource "aws_route_table_association" "sub-asso" {
#   route_table_id = aws_route_table.pri-rt
#   subnet_id = aws_subnet.pri-sub.id
# }

# # create security group
# resource "aws_security_group" "pro-sec" {
#   vpc_id = aws_vpc.my-vpc.id
#   name = "project-sg"
#   description = "allow ssh and http"


# # inbound rules
# ingress {
#     description = "allow ssh"
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = "0.0.0.0/0" 

# }
# ingress {
#      description = "allow http"
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = "0.0.0.0/0"
# }


# # outbound rule
# egress {
#     description = "allow all trafic"
#     from_port = 0
#     to_port = 0
#     protocol = "-1"     # -1 means all protocols
#     cidr_blocks = "0.0.0.0/0"
# }
# }

# create instance 

resource "aws_instance" "ser" {
  ami = var.ami_id
  instance_type = var.type
  tags = {
    Name = "dev"
  }
  # security_groups = aws_security_group.pro-sec.id

}



