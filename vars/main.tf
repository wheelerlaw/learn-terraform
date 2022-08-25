provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  count = var.number_of_servers
}

