# outputs
output "vpc_id" {
  value       = aws_vpc.alpha_vpc.id
  description = "AWS EC2 VPC ID"
  sensitive   = false
}

output "webserver_1" {
  value       = aws_instance.webserver_1.id
  description = "Webserver 1"
  sensitive   = false
}

output "webserver_2" {
  value       = aws_instance.webserver_2.id
  description = "Webserver 2"
  sensitive   = false
}

output "loadbalancer_dns_name" {
  description = "DNS fqdn of the application loadbalancer"
  value = aws_lb.alpha_alb.dns_name
}

output "database_instance" {
  description = "Alpha DB Instance Endpoint"
  value = aws_db_instance.alpha_mysqldb_default.endpoint
}

output "routing_table" {
  description = "Alpha VPC routing table"
  value = aws_route_table.main_routing_table.route
}