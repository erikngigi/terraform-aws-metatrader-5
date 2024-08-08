# network
variable "vpc_cidr" {
  description = "CIDR block of the custom VPC for the Metatrader 5 architecture"
  type        = string
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

variable "userdata_file" {
  description = "Path to the shell script. This script installs Wine on the MetaTrader VPS and performs any additional setup required during instance initialization."
  type        = string
}

# security
variable "allow_ssh" {
  description = "Boolean flag to enable or disable SSH access (port 22) to the MetaTrader VPS. Set to true to allow SSH connections for remote management."
  type        = bool
}

variable "allow_rdp" {
  description = "Boolean flag to enable or disable RDP access (port 3389) to the MetaTrader VPS. Set to true to allow RDP for managing the Windows-based MetaTrader application."
  type        = bool
}

variable "ssh_key" {
  description = "Name of the SSH key pair used to log into the MetaTrader VPS. Ensure that the key pair exists in the AWS region where the instance is launched."
  type        = string
}
