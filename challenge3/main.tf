provider "aws" {
  profile = "sandbox-eng-enablement"
  region = "us-east-2"
}

module "db-server" {
  source = "./db-server"
  db-server-name = "DB Server"
}

output "db-server-private-ip" {
  value = module.db-server.db-server-private-ip
}

module "web-server" {
  source = "./web-server"
  ports = [80, 443]
  web-server-name = "Web Server"
  startup-script = <<-EOF
    #!/bin/bash
    sudo yum update
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF
}

output "web-server-public-ip" {
  value = module.web-server.public-ip
}
