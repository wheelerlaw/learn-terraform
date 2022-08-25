provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

module "db" {
  source = "./db-server"
  server-names = ["mariadb", "mysql", "mssql"]
}

output "private-ips" {
  value = module.db.db-server-private-ip
}
