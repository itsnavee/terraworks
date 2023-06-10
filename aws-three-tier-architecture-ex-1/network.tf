# Public Network - Internet Gateway
resource "aws_internet_gateway" "alpha_vpc_igw" {
  vpc_id = aws_vpc.alpha_vpc.id

  tags = {
    "Name" = "Internet Gateway for VPC Alpha"
  }
}

# VPC Private Network
# Web Layer
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az1
  map_public_ip_on_launch = true
  cidr_block              = var.vpc_subnet_1

  tags = {
    "Name" = "Web Tier Subnets 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az2
  map_public_ip_on_launch = true
  cidr_block              = var.vpc_subnet_2

  tags = {
    "Name" = "Web Tier Subnet 2"
  }
}

# Application Layer

resource "aws_subnet" "app_subnet_1" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az1
  map_public_ip_on_launch = false
  cidr_block              = var.vpc_subnet_3

  tags = {
    "Name" = "Application Subnet 1"
  }
}

resource "aws_subnet" "app_subnet_2" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az2
  map_public_ip_on_launch = false
  cidr_block              = var.vpc_subnet_4

  tags = {
    "Name" = "Applictaion Subnet 2"
  }
}

# Database Layer
resource "aws_subnet" "db_subnet_1" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az1
  map_public_ip_on_launch = false
  cidr_block              = var.vpc_subnet_5

  tags = {
    "Name" = "Database Subnet 1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  availability_zone       = local.az2
  map_public_ip_on_launch = false
  cidr_block              = var.vpc_subnet_6

  tags = {
    "Name" = "Database Subnet 2"
  }
}

# database subnet group
resource "aws_db_subnet_group" "alpha_db_subnet_group" {
  name       = "alpha_db_subnet_group"
  subnet_ids = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]

  tags = {
    "Name" = "Alpha VPC DB Subnet Group"
  }
}
