provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

variable "ingress-rules" {
  type = list(number)
  default = [80, 443]
}

variable "egress-rules" {
  type = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_instance" "ec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress-rules
    content {
      from_port = port.value
      to_port   = port.value
      protocol  = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress-rules
    content {
      from_port = port.value
      to_port   = port.value
      protocol  = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
