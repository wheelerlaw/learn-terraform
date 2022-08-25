variable "db-server-name" {
  type = string
}

resource "aws_instance" "db-server" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name = var.db-server-name
  }
}

output "db-server-private-ip" {
  value = aws_instance.db-server.private_ip
}
