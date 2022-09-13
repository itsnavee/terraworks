# EC2 instance-1 for web tier in public subnet

resource "aws_instance" "webserver_1" {
  ami                         = var.machine_images["t2.micro"]
  instance_type               = "t2.micro"
  key_name                    = "alpha_vpc_key"
  vpc_security_group_ids      = [aws_security_group.alpha_web_sg.id]
  subnet_id                   = aws_subnet.public_subnet_1.id
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")

  tags = {
    "Name" : "Public Web Server 1"
  }
}

resource "aws_instance" "webserver_2" {
  ami                         = var.machine_images["t2.micro"]
  instance_type               = "t2.micro"
  key_name                    = "alpha_vpc_key"
  vpc_security_group_ids      = [aws_security_group.alpha_web_sg.id]
  subnet_id                   = aws_subnet.public_subnet_2.id
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")

  tags = {
    "Name" : "Public Web Server 2"
  }
}

resource "aws_db_instance" "alpha_mysqldb_default" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_name                = "mydb"
  username               = "alphadbuser"
  password               = "alphadbpassword"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.alpha_db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.alpha_database_sg.id]
}
