module "ec2" {
  source = "../day-7-terraform-module"
  ami_id = var.ami_id
  instance_type = var.instance_type
}