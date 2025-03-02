output "cluster_role_arn" {
  description = "IAM Role ARN for EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "fargate_pod_role_arn" {
  description = "IAM Role ARN for EKS Fargate pods"
  value       = aws_iam_role.eks_fargate_pod_role.arn
}
