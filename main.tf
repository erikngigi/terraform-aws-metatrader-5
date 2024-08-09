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
  ssh_key             = var.ssh_key
  ssh_key_name        = var.ssh_key_name
  security_group_name = var.security_group_name
  vpc_cidr            = var.vpc_cidr
  vpc_id              = module.networks.metatrader_vpc_id
  ingress             = var.ingress
  egress              = var.egress
}

module "instance" {
  source            = "./modules/instances"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_name_tag = var.instance_name_tag
  userdata_file     = var.userdata_file
  security_group_id = module.security.metatrader_sg
  ssh_key           = module.security.metatrader_key_pair
  public_subnet_id  = module.networks.metatrader_public_subnet
}
