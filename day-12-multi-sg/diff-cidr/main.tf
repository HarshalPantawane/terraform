provider "aws" {
  
}

resource "aws_security_group" "name" {
  name = "diff_cidr"
  description = "allow all restricted traffic"

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      description = "allow acces port ${ingress.key}"
      from_port = ingress.key
      to_port = ingress.key
      protocol = "tcp"
      cidr_blocks = [ ingress.value ]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "diff-cidr"
  }

}

variable "allow_ports" {
  type = map(string)
  default = {
    22 = "203.0.113.0/24"
    80 = "0.0.0.0/0"
    443 = "0.0.0.0/0"
    8080 = "10.0.0.0/16"
    9000 = "192.168.1.0/24"
  }

}