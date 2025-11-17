## vpc

variable "vpc_tags" {}
variable "vpc_cidr" {}

#subnet

variable "subnet_1_cidr" {}
variable "subnet_1_tags" {}
variable "subnet_1_az" {}

variable "subnet_2_cidr" {}
variable "subnet_2_tags" {}
variable "subnet_2_az" {}

variable "subnet_3_cidr" {}
variable "subnet_3_tags" {}
variable "subnet_3_az" {}

variable "subnet_4_cidr" {}
variable "subnet_4_tags" {}
variable "subnet_4_az" {}

## internet and nat

variable "inetrnet_tags" {}
variable "nat_tags" {}

## route 

variable "public_rt_tags" {}
variable "public_rt_cidr" {}

variable "private_rt_tags" {}
variable "private_rt_cidr" {}
