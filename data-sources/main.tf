provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_instance" "db" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
}

resource "aws_instance" "web" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name= "DB Server"
  }
  depends_on = [aws_instance.db]
}

data "aws_instances" "db-search" {
  filter {
    name   = "tag:Name"
    values = ["DB Server"]
  }
}

output "db-servers" {
  value = data.aws_instances.db-search.private_ips
}
