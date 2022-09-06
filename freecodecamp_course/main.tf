terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.26.0"
    }
  }

  required_version = ">= 1.2.7"
}

provider "aws" {
  region = local.region
}

locals {
  region = var.regions["DUB"]
}

resource "aws_vpc" "vpc-terraform-workshop" {
  cidr_block = "172.50.0.0/16"
  tags = {
    "Name" = "Terrafrom Workshop"
  }
}

resource "aws_security_group" "vpc-terraform-workshop" {
  vpc_id = aws_vpc.vpc-terraform-workshop.id

  ingress = [{
    security_groups  = []
    description      = "vpc-terraform-workshop"
    self             = false
    prefix_list_ids  = []
    ipv6_cidr_blocks = []
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "tcp"
    from_port        = 22
    to_port          = 22
    },
    {
      security_groups  = []
      description      = "vpc-terraform-workshop"
      self             = false
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      cidr_blocks      = [aws_vpc.vpc-terraform-workshop.cidr_block]
      protocol         = "all"
      from_port        = 0
      to_port          = 65535
  }]

}

resource "aws_instance" "my-first-server" {
  ami                    = var.machine_images["t2.micro"]
  instance_type          = "t2.micro"
  availability_zone      = "${local.region}a"
  vpc_security_group_ids = var.security_groups["saa-admin"]
  key_name               = var.ssh_keys[0]

  tags = {
    Name = "MyFirstServer"
    Env  = "TerraFleet"
  }
}