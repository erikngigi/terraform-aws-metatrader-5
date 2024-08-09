resource "aws_security_group" "metatrader_sg" {
  name        = var.security_group_name
  description = "Controls access to the Metatrader Instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.sg_cidr_block
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.sg_cidr_block
    }
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_key_pair" "metatrader_key_pair" {
  key_name   = var.ssh_key_name
  public_key = file(var.ssh_key)
}
