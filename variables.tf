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

# security
variable "ssh_key" {
  description = "Name of the SSH key pair used to log into the MetaTrader VPS. Ensure that the key pair exists in the AWS region where the instance is launched."
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group to be created or used. This name is used to identify the security group in the AWS console and to associate it with resources."
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair used to access the instances. Ensure that the specified key pair exists in the AWS region where the instances are launched."
  type        = string
}

variable "ingress" {
  type = map(object({
    description   = string
    port          = number
    protocol      = string
    sg_cidr_block = list(string)
  }))
}

variable "egress" {
  type = map(object({
    description   = string
    port          = number
    protocol      = number
    sg_cidr_block = list(string)
  }))
}

# instances
variable "ami_id" {
  description = "ID of the Amazon Machine Image (AMI) used to launch the MetaTrader VPS instance, specifying the operating system and initial setup."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the MetaTrader VPS, determines the computational power and memory capacity."
  type        = string
}

variable "instance_name_tag" {
  description = "The name of the instance to be created."
  type        = string
}

variable "userdata_file" {
  description = "Path to the shell script. This script installs Wine on the MetaTrader VPS and performs any additional setup required during instance initialization."
  type        = string
}
