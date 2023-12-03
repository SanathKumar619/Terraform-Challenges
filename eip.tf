provider "aws" {
}

provider "digitalocean" {
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "aws_eip" "sanath-ip" {
  vpc = true
}

output "IP" {
  value = aws_eip.sanath-ip.public_ip
}
