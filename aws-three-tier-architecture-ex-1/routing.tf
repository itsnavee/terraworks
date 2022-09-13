# main routing table
resource "aws_route_table" "main_routing_table" {
  vpc_id = aws_vpc.alpha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alpha_vpc_igw.id
  }
}

resource "aws_route_table_association" "route_table_1" {
  route_table_id = aws_route_table.main_routing_table.id
  subnet_id      = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "route_table_2" {
  route_table_id = aws_route_table.main_routing_table.id
  subnet_id      = aws_subnet.public_subnet_2.id
}
