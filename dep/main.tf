provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_instance" "db" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  depends_on = [aws_instance.db]
}
