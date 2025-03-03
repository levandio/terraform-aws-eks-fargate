# terraform-aws-eks-fargate
📁 terraform-eks-fargate/

├── 📁 modules/
│   ├── 📁 eks/                   # EKS Cluster & Fargate Profiles
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── rbac.tf              # RBAC configurations
│   │   └── nginx.tf            # Sample app manifests
│   ├── 📁 vpc/                  # VPC, Subnets, NAT, etc.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── 📁 iam/                  # IAM Roles & Policies
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── 📁 scripts/                  # Helper scripts
│   ├── setup-kubectl.sh
│   └── deploy-sample-app.sh
├── 📄 main.tf                  # Root module
├── 📄 variables.tf             # Root variables
├── 📄 outputs.tf               # Root outputs
├── 📄 README.md               # Documentation
└── 📄 ARCHITECTURE.md         # Architecture decisions
