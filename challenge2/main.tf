provider "aws" {
  profile = "sandbox-eng-enablement"
  region = "us-east-2"
}

resource "aws_instance" "db-server" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

output "db-server-private-ip" {
  value = aws_instance.db-server.private_ip
}

resource "aws_instance" "web-server" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web-server-http-https.name]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF
  tags = {
    Name = "Web Server"
  }
}

resource "aws_eip" "web-server-public-ip" {
  instance = aws_instance.web-server.id
}

variable "web-server-ports" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "web-server-http-https" {
  name = "Web server HTTP HTTPS"
  dynamic "ingress" {
    iterator = port
    for_each = var.web-server-ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.web-server-ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "web-server-public-ip" {
  value = aws_eip.web-server-public-ip.public_ip
}
