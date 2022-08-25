provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_vpc" "wheeler-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "wheeler-vpc"
  }
}

resource "aws_vpc" "wheeler-vpc-2" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "wheeler-vpc-2"
  }
}
