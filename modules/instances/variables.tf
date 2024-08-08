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

variable "security_group_id" {
  description = "The ID of the security group imported from the security module. This ID is used to reference the security group for applying security rules to resources."
  type        = string
}

variable "ssh_key" {
  description = "The name of the SSH key pair used for accessing the instances imported from the security module."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet imported from the network module."
  type        = string
}
