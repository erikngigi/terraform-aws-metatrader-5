resource "aws_security_group" "metatrader_sg" {
  name        = var.security_group_name
  description = "Controls access to the Metatrader Instance"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    description = "Allow SSH traffic to Metatrader Instance"
    from_port   = var.ingress_ssh_port
    to_port     = var.ingress_ssh_port
    protocol    = var.protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    description = "Allow RDP traffic to Metatrader Instance"
    from_port   = var.ingress_rdp_port
    to_port     = var.ingress_rdp_port
    protocol    = var.protocol
    cidr_blocks = var.sg_cidr_block
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_key_pair" "metatrader_key_pair" {
  key_name   = var.ssh_key_name
  public_key = file(var.ssh_key)
}
