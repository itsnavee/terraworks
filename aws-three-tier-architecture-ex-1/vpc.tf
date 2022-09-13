# multi-az VPC

resource "aws_vpc" "alpha_vpc" {
  cidr_block = var.vpc_network
  instance_tenancy = "default"
  tags = {
    "Name" = "Alpha VPC"
  }
}