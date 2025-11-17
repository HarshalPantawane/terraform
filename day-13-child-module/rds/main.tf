resource "aws_db_subnet_group" "subnet_group" {
  name = "db_subnet_group"
  subnet_ids = [var.subnet_3_id, var.subnet_4_id  ]
  tags = {
    Name = "my_db_subnet_group"
  }
}

resource "aws_db_instance" "mysql" {
  instance_class = var.instance_class
  identifier =  var.identifier
  engine =  "mysql"
  engine_version = "8.0"
  allocated_storage =  20 
  username =  var.username
  password = var.password
  db_subnet_group_name = aws_db_subnet_group.subnet_group.id
  db_name =   var.db_name
  skip_final_snapshot =  true
}