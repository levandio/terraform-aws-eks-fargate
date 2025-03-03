## Architecture Decisions

### VPC Design
- **Public/Private Subnets**: Public subnets for NAT Gateway, private subnets for EKS worker nodes.
- **VPC Endpoints**: Reduce NAT costs by using endpoints for S3 and ECR.

### Security
- **KMS Encryption**: Secrets in EKS are encrypted using AWS KMS.
- **RBAC**: Least-privilege roles for the `test-app` namespace.
- **Network Isolation**: Control plane endpoints are private; ALB handles public traffic.

### Fargate
- **Serverless Compute**: Fargate profiles eliminate node management overhead.
- **Cost Optimization**: Pay per pod instead of reserving EC2 instances.

### Monitoring
- **CloudWatch Logs**: Control plane logs are enabled.
- **CloudWatch Metrics**: Metrics collected via the CloudWatch agent.