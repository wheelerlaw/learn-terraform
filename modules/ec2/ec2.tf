variable "ec2-name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2-name
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
