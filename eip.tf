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

<<<<<<< HEAD
resource "aws_eip" "sanath-ip" {
=======
resource "aws_eip" "kplabs_app_ip" {
>>>>>>> 9b841af276290d6d224466ef3efbf8d4f71c51fd
   domain = "vpc" 
}
