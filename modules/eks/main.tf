resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  # Enable control plane logs
  enabled_cluster_log_types = var.enabled_log_types

  tags = {
    Name = var.name
  }
}

resource "aws_eks_fargate_profile" "test_app" {
  fargate_profile_name   = "${var.name}-fargate-profile"
  cluster_name           = aws_eks_cluster.this.name
  pod_execution_role_arn = var.fargate_pod_role_arn
  subnet_ids             = var.private_subnet_ids

  selector {
    namespace = "test-app"
  }

  selector {
    namespace = "another-namespace"
    labels = {
      env = "dev"
    }
  }

  depends_on = [aws_eks_cluster.this]
}
