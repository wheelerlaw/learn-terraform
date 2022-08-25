provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_instance" "ec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
  ingress {
    from_port = 443
    protocol  = "TCP"
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    protocol  = "TCP"
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
}
