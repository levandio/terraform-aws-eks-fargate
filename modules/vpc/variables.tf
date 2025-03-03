variable "name" {
  type        = string
  description = "Name prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]  # Use new CIDRs
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}