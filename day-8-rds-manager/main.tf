resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project-vpc"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "subnet-2"
  }
}

resource "aws_instance" "project_server" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  tags = {
   Name = "dev"
  }
}

resource "aws_db_subnet_group" "db_sub" {
  subnet_ids = [ aws_subnet.subnet_1.id, aws_subnet.subnet_2.id ]
  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "name" {
  instance_class = "db.t3.micro"
  engine = "mysql"
  engine_version = "8.0"
  db_name = "masterdb"
  identifier = "master-db"
  manage_master_user_password = true
   username = "admin"
#   password = "admin123" 
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.db_sub.id
  # availability_zone = "us-east-1"
  parameter_group_name = "default.mysql8.0"
  tags = {
    Name = "rds-db"
  }
  skip_final_snapshot = true
  depends_on = [ aws_db_subnet_group.db_sub ]
}