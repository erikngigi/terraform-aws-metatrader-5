# network
variable "vpc_cidr" {
  description = "CIDR block of the custom VPC for the Metatrader 5 architecture"
  type        = string
}

variable "vpc_name_tag" {
  description = "Name tag of the custom VPC used for cost allocation"
  type        = string
}

variable "subnet_name_tag" {
  description = "Name tag of the public subnet used for cost allocation"
  type        = string
}

variable "availability_zone" {
  description = "Choosen availability zone to attach to the subnet"
  type        = string
}

variable "internet_gateway_tag" {
  description = "Name tag for the internet gateway used in cost allocation"
  type        = string
}

variable "public_route_table_tag" {
  description = "Name tag of the public route table used in cost allocation"
  type        = string
}

variable "public_destination_route_cidr_block" {
  description = "This defines the IP address range for which the specified route will apply, directing traffic to the appropriate target"
  type        = string
}
