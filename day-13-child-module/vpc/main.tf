
### vpc creation ###

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tags
  }
}

### subnet creation ###

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.subnet_1_az
tags = {
  Name = var.subnet_1_tags
}
}

resource "aws_subnet" "subnet_2" {
  cidr_block = var.subnet_2_cidr
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.subnet_2_az
  tags = {
    Name = var.subnet_2_tags
  }
}

resource "aws_subnet" "subnet_3" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_3_cidr
  availability_zone = var.subnet_3_az
  tags = {
    Name = var.subnet_3_tags
  }
}

resource "aws_subnet" "subnet_4" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_4_cidr
  availability_zone = var.subnet_4_az
  tags = {
    Name = var.subnet_4_tags
  }
}


### internet gateway creation ###

resource "aws_internet_gateway" "internet_g" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.inetrnet_tags
  }
}

### elastic IP creation ###

resource "aws_eip" "nat_eip" {
  
}

### nat gateway creation ###

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.subnet_1.id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = var.nat_tags
  }

}

### route table creation public ###

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.public_rt_tags
  }

  route {
    cidr_block = var.public_rt_cidr
    gateway_id = aws_internet_gateway.internet_g.id
  }
}

resource "aws_route_table_association" "public_1" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.subnet_1.id
}

resource "aws_route_table_association" "public_2" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.subnet_2.id
}

### route table creation private ###

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.private_rt_tags
  }

  route {
    cidr_block = var.private_rt_cidr
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "private_1" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.subnet_3.id
}

resource "aws_route_table_association" "private_2" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.subnet_4.id
}

