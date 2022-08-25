provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/20"
}
