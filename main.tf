terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source          = "./modules/vpc"
  name            = var.name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  azs             = var.azs
}

# IAM Module
module "iam" {
  source = "./modules/iam"
  name   = var.name
}

# EKS Module
module "eks" {
  source             = "./modules/eks"
  name               = var.name
  cluster_role_arn   = module.iam.cluster_role_arn
  fargate_pod_role_arn = module.iam.fargate_pod_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids
}

# Optionally output from root if you want
output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint from child module"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  description = "EKS cluster name from child module"
  value       = module.eks.cluster_id
}
