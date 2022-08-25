provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_instance" "ec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
}
