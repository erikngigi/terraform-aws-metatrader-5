output "metatrader_vpc_id" {
  description = "The ID of the VPC that was created or used. This ID is required to reference the VPC in other resources and modules within the infrastructure."
  value       = aws_vpc.metatrader_vpc.id
}

output "metatrader_public_subnet" {
  description = "The ID of the subnet that was created or used. This ID is essential for launching resources within the specific subnet, such as EC2 instances or load balancers."
  value       = aws_subnet.metatrader_subnet.id
}
