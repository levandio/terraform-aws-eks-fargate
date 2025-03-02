variable "name" {
  type        = string
  description = "EKS Cluster name"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS cluster"
}

variable "fargate_pod_role_arn" {
  type        = string
  description = "IAM role ARN for EKS Fargate pod execution"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "enabled_log_types" {
  type        = list(string)
  description = "Enabled EKS Control Plane log types"
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
