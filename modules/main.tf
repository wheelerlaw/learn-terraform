provider "aws" {
  profile = "sandbox-eng-enablement"
  region = "us-east-2"
}

module "ec2-module" {
  source = "./ec2"
  ec2-name = "Name From Module"
}

output "module-output" {
  value = module.ec2-module.instance_id
}
