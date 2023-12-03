terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "instance_config" {
  type = map(any)
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-0230bd60aa48260c6" }
    instance2 = { instance_type = "t2.micro", ami = "ami-0fc5d935ebf8bc3bc" }
    instance3 = { instance_type = "t2.medium", ami = "ami-0fc5d935ebf8bc3bc" }
  }
}

resource "aws_instance" "sanath-ec2" {
  for_each      = var.instance_config
  ami           = each.value["ami"]
  instance_type = each.value["instance_type"]
  tags = {
    Name = each.key
  }
}
