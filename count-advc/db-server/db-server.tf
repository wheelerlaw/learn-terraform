variable "server-names" {
  type = list(string)
}

resource "aws_instance" "db-server" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  count = length(var.server-names)
  tags = {
    Name = var.server-names[count.index]
  }
}

output "db-server-private-ip" {
  value = [aws_instance.db-server.*.private_ip]
}
