variable "name" {
  type        = string
  description = "Name prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
