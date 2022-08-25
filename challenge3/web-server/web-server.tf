variable "startup-script" {
  type = string
  description = "The script to run on startup of the EC2 instance"
}

variable "ports" {
  type = list(number)
  description = "The ports to open to the web server"
}

variable "web-server-name" {
  type = string
  description = "The name for the web server in the AWS console"
}

resource "aws_instance" "web-server" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web-server-sg.name]
  user_data = var.startup-script
  tags = {
    Name = var.web-server-name
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web-server.id
}

resource "aws_security_group" "web-server-sg" {
  name = "${var.web-server-name}-sg"

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "public-ip" {
  value = aws_eip.eip.public_ip
}
