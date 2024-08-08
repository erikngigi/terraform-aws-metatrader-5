module "networks" {
  source                              = "./modules/network"
  vpc_cidr                            = var.vpc_cidr
  vpc_name_tag                        = var.vpc_name_tag
  availability_zone                   = var.availability_zone
  subnet_name_tag                     = var.subnet_name_tag
  internet_gateway_tag                = var.internet_gateway_tag
  public_route_table_tag              = var.public_route_table_tag
  public_destination_route_cidr_block = var.public_destination_route_cidr_block
}

module "security" {
  source              = "./modules/security"
  allow_ssh           = var.allow_ssh
  allow_rdp           = var.allow_rdp
  ssh_key             = var.ssh_key
  ssh_key_name        = var.ssh_key_name
  security_group_name = var.security_group_name
  vpc_cidr            = var.vpc_cidr
  vpc_id              = module.networks.metatrader_vpc_id
  ingress_ssh_port    = var.ingress_ssh_port
  ingress_rdp_port    = var.ingress_rdp_port
  protocol            = var.protocol
  sg_cidr_block       = var.sg_cidr_block
}
