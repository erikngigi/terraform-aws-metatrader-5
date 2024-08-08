resource "aws_instance" "metatrader" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  associate_public_ip_address = true
  security_groups             = [var.security_group_id]
  subnet_id                   = var.public_subnet_id
  user_data                   = file(var.userdata_file)

  tags = {
    Name = var.instance_name_tag
  }
}
