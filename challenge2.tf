terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "splunk" {
  default = "8088"
}

variable "cidr" {
  default = "172.31.0.0/16"
}

variable "ports" {
  type    = list(any)
  default = [443, 8080, 8443]
}

resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.ports[0]
    to_port     = var.ports[0]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.ports[1]
    to_port     = var.ports[1]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.ports[2]
    to_port     = var.ports[2]
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    User = "Sanath"
  }
}



resource "aws_eip" "example" {
  domain = "vpc"
}
