module "vpc" {
  source = "./vpc"
  vpc_cidr =  var.vpc_cidr
  vpc_tags =   var.vpc_tags
  subnet_1_cidr =   var.subnet_1_cidr
  subnet_1_az =    var.subnet_1_az
  subnet_1_tags =   var.subnet_1_tags
  subnet_2_cidr =    var.subnet_2_cidr
  subnet_2_az =    var.subnet_2_az
  subnet_2_tags =    var.subnet_2_tags
  subnet_3_az =   var.subnet_3_az
  subnet_3_cidr =    var.subnet_3_cidr
  subnet_3_tags =  var.subnet_3_tags
  subnet_4_cidr =     var.subnet_4_cidr
  subnet_4_az =      var.subnet_4_az
  subnet_4_tags =  var.subnet_4_tags
  
  inetrnet_tags = var.inetrnet_tags

  nat_tags =   var.nat_tags

  public_rt_cidr =  var.public_rt_cidr
  public_rt_tags =   var.public_rt_tags


  private_rt_cidr =   var.private_rt_cidr
  private_rt_tags =    var.private_rt_tags

}


module "s3" {
  source = "./s3"
  bucket =  var.bucket

}

module "rds" {
  source = "./rds"
  subnet_3_id = module.vpc.subnet_3_ids   
  subnet_4_id = module.vpc.subnet_4_ids  
  instance_class = var.instance_class
  identifier = var.identifier
  username = var.username
  password = var.password
  db_name = var.db_name
}

module "instance" {
  source = "./instance"
  ami_id =  var.ami_id 
  instance_type =   var.instance_type
  subnet_1_id =  module.vpc.subnet_1_ids
  instance_tags =  var.instance_tags
  vpc_id =  module.vpc.vpc_id
  sg_name =  var.sg_name
  ingress_from_port =  var.ingress_from_port
  ingress_to_port =  var.ingress_to_port
  sg_ingress_cidr =  var.sg_ingress_cidr
  sg_ingress_protocol =  var.sg_ingress_protocol
  egress_from_port =  var.egress_from_port
  egress_to_port =  var.egress_to_port
  sg_egress_cidr =  var.sg_egress_cidr
  sg_egress_protocol = var.sg_egress_protocol
  sg_tag = var.sg_tag
}
