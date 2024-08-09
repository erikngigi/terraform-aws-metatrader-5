# security
variable "ssh_key" {
  description = "Name of the SSH key pair used to log into the MetaTrader VPS. Ensure that the key pair exists in the AWS region where the instance is launched."
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair used to access the instances. Ensure that the specified key pair exists in the AWS region where the instances are launched."
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group to be created or used. This name is used to identify the security group in the AWS console and to associate it with resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the custom VPC for the Metatrader 5 architecture"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC imported from the network module."
  type        = string
}

variable "ingress_ssh_port" {
  description = "The port number used for SSH access in the security group. Typically set to 22."
  type        = number
}

variable "ingress_rdp_port" {
  description = "The port number used for RDP access in the security group. Typically set to 3389."
  type        = number
}

variable "protocol" {
  description = "The network protocol for the ingress rule. Common values include 'tcp' for TCP traffic, 'udp' for UDP traffic, and 'icmp' for ICMP traffic."
  type        = string
}

variable "sg_cidr_block" {
  description = "The CIDR block(s) specifying the range of IP addresses allowed to access the specified port(s) on the instances."
  type        = list(string)
}
