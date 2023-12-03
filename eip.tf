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

resource "aws_eip" "kplabs_app_ip" {
   domain = "vpc" 
}
