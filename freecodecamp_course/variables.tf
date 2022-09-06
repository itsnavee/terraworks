variable "security_groups" {
  type = map
  default = {
    "saa-admin" : ["sg-05063efc1026d8189"],
  }
}

variable "ssh_keys" {
    type = list
    default = ["sandbox"]
}

variable "regions" {
  type = map
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

variable "machine_images" {
    type = map
    default = {
        "t2.micro": "ami-0de49f883a95ec117",
    }
}
