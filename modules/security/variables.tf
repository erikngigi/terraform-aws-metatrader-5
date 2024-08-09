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
