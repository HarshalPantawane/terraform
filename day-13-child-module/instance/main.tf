## instance

resource "aws_instance" "my_server" {
  ami = var.ami_id
  instance_type =  var.instance_type
  subnet_id = var.subnet_1_id
  vpc_security_group_ids = [aws_security_group.security_groups.id]
  associate_public_ip_address = true
  depends_on = [ aws_security_group.security_groups ]
  tags = {
    Name = var.instance_tags
  }
}

## security group

resource "aws_security_group" "security_groups" {
   vpc_id = var.vpc_id
   name = var.sg_name
   description = "allow all inbound traffic "

  #  ingress = [
  #   for port in var.ingress_from_port : {
  #     description = "allow all traffic"
  #     from_port = port
  #     to_port = port
  #     protocol = var.sg_ingress_protocol
  #     cidr_blocks = var.sg_ingress_cidr
  #     ipv6_cidr_blocks = []
  #     prefix_list_ids = []
  #     security_groups = []
  #     self = false
  #   }
  #  ]
  ingress  {
    description = "allow all traffic"
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.sg_ingress_protocol
    cidr_blocks = var.sg_ingress_cidr
  }

  egress {
    from_port = var.egress_from_port 
    to_port =  var.egress_to_port          
    protocol =  var.sg_egress_protocol          
    cidr_blocks = var.sg_egress_cidr
  }
  tags = {
    Name = var.sg_tag
  }

}