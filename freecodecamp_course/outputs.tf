# outputs
output "instance_id" {
  value       = aws_instance.my-first-server.id
  description = "AWS EC2 instance ID"
  sensitive   = false
}

output "vpc_id" {
  value       = aws_vpc.vpc-terraform-workshop.id
  description = "AWS EC2 VPC ID"
  sensitive   = false
}
