output "metatrader_sg" {
  description = "The ID of the security group associated with the MetaTrader VPS. This security group controls the inbound and outbound traffic rules for the instances."
  value = aws_security_group.metatrader_sg.id
}

output "metatrader_key_pair" {
  description = "The SSH key pair used for accessing the MetaTrader VPS."
  value = aws_key_pair.metatrader_key_pair.id
}
