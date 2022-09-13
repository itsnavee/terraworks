## Security Groups

# Web layer security group
resource "aws_security_group" "alpha_web_sg" {
  name   = "Alpha VPC Web Layer Security Group"
  vpc_id = aws_vpc.alpha_vpc.id

  # HTTP from anywhere
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "http_from_anywhere"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "https_from_anywhere"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "ssh_from_anywhere"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  # Egress rules
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "internet_access_to_anywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }

  tags = {
    "Name" = "Alpha VPC Web Layer Security Group"
  }
}


# Database layer security group
resource "aws_security_group" "alpha_database_sg" {
  name   = "Alpha VPC Database Layer Security Group"
  vpc_id = aws_vpc.alpha_vpc.id

  ingress {
    description     = "Allow traffic from application layer to database"
    security_groups = [aws_security_group.alpha_web_sg.id]
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 32768
    to_port     = 65535
  }

  tags = {
    "Name" = "Alpha VPC Database Layer Security Group"
  }
}
