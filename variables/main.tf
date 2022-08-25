provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}
variable "vpcname" {
  type = string
  default = "wheeler-vpc-2"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "my-list" {
  type = list(string)
  default = ["value 1", "value 2"]
}
variable "my-map" {
  type = map(string)
  default = {
    test = "asd"
    test2 = "asd"
  }
}

variable "custom-vpc-name" {
  type = string
  description = "vpc name"
}

resource "aws_vpc" "wheeler-vpc-2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.custom-vpc-name
  }
}

output "vpc-id" {
  value = aws_vpc.wheeler-vpc-2.id
}

variable "my-tuple" {
  type = tuple([string, number, string])
  default = ["hello", 1, "world"]
}

variable "my-object" {
  type = object({
    name = string,
    port = list(number)
  })
  default = {
    name = "Wheeler",
    port = [1, 2, 3]
  }
}
