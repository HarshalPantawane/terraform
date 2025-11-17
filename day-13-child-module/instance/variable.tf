### ec2 instance

variable "ami_id" {}
variable "instance_type" {}
variable "subnet_1_id" {}
variable "instance_tags" {}



### security group

variable "sg_name" {}
variable "ingress_from_port" {}
variable "ingress_to_port" {}
variable "sg_ingress_protocol" {}
variable "sg_ingress_cidr" {}

variable "egress_from_port" {}
variable "egress_to_port" {}
variable "sg_egress_protocol" {}
variable "sg_egress_cidr" {}
variable "sg_tag" {}
variable "vpc_id" {}