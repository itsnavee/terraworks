# regions
variable "regions" {
  type = map(any)
  default = {
    "PDX" : "us-west-2",
    "CDG" : "eu-west-3",
    "CGK" : "ap-southeast-3",
    "IAD" : "us-east-1",
    "DUB" : "eu-west-1",
    "BOM" : "ap-south-1",
    "CMH" : "us-east-2",
    "FRA" : "eu-central-1",
    "GRU" : "sa-east-1",
    "ICN" : "ap-northeast-2",
    "LHR" : "eu-west-2",
    "NRT" : "ap-northeast-1",
    "KIX" : "ap-northeast-3",
    "SFO" : "us-west-1",
    "SIN" : "ap-southeast-1",
    "SYD" : "ap-southeast-2",
    "YUL" : "ca-central-1",
    "ARN" : "eu-north-1",
    "HKG" : "ap-east-1",
    "BAH" : "me-south-1",
    "MXP" : "eu-south-1",
    "CPT" : "af-south-1",
  }
}

# EC2 AMIs
variable "machine_images" {
  type = map(any)
  default = {
    "t2.micro" : "ami-09e2d756e7d78558d",
  }
}

variable "vpc_security_group" {
  type    = string
  default = "sg-05063efc1026d8189"
}

# VPC Networking
variable "vpc_network" {
  type    = string
  default = "10.0.0.0/16"
}

# VPC Subnets
variable "vpc_subnet_1" {
  type    = string
  default = "10.0.1.0/24"
}
variable "vpc_subnet_2" {
  type    = string
  default = "10.0.2.0/24"
}
variable "vpc_subnet_3" {
  type    = string
  default = "10.0.3.0/24"
}
variable "vpc_subnet_4" {
  type    = string
  default = "10.0.4.0/24"
}
variable "vpc_subnet_5" {
  type    = string
  default = "10.0.5.0/24"
}
variable "vpc_subnet_6" {
  type    = string
  default = "10.0.6.0/24"
}