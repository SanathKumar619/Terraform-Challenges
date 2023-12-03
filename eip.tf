provider "aws" {
}

provider "digitalocean" {
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
  }
}

resource "aws_eip" "sanath-ip" {
   domain = "vpc" 
}
