module "vcp" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"
}

resource "aws_subnet" "main" {
  vpc_id     = module.vcp.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
   }
 }
