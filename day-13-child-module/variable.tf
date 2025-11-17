variable "vpc_cidr" {
  description = "value"
  default = ""
  type = string
}

variable "vpc_tags" {
  description = "value"
  default = ""
  type = string
}



variable "subnet_1_az" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_1_cidr" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_1_tags" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_2_az" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_2_cidr" {
  default = ""
  description = "value"
  type = string
}

variable "subnet_2_tags" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_3_az" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_3_cidr" {
  default = ""
  description = "value"
  type = string
}

variable "subnet_3_tags" {
  description = "value"
  default = ""
  type = string
}

variable "subnet_4_az" {}
variable "subnet_4_cidr" {}
variable "subnet_4_tags" {}  
variable "inetrnet_tags" {}
variable "nat_tags" {}
variable "public_rt_cidr" {}
variable "public_rt_tags" {}
variable "private_rt_cidr" {}
variable "private_rt_tags" {}
variable "ami_id" {}
variable "instance_type" {}
variable "instance_tags" {}
# variable "vpc_id" {}
variable "sg_tag" {}
variable "sg_name" {}
variable "ingress_from_port" {}
variable "ingress_to_port" {}
variable "sg_ingress_cidr" {}
variable "sg_ingress_protocol" {}
variable "egress_from_port" {}
variable "egress_to_port" {}
variable "sg_egress_cidr" {}
variable "sg_egress_protocol" {}
variable "bucket" {}
variable "db_name" {}
variable "identifier" {}
variable "instance_class" {}
variable "username" {}
variable "password" {}
# variable "subnet_1_id" {}
# variable "subnet_2_id" {}
# variable "" {}