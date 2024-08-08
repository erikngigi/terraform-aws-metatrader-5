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
