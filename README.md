# tf-infra-modules

> Production-ready, security-hardened modular **Terraform (IaC)** blueprints for AWS and GCP clouds.

[![Terraform](https://img.shields.io/badge/Terraform-1.7%2B-844FBA?style=flat-square&logo=terraform)](https://terraform.io)
[![AWS](https://img.shields.io/badge/Provider-AWS-FF9900?style=flat-square&logo=amazon-aws)](https://aws.amazon.com)
[![CI](https://img.shields.io/badge/CI-GitHub_Actions-2088FF?style=flat-square&logo=githubactions)](.github/workflows/terraform-lint.yml)
[![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

`#terraform` `#infrastructure-as-code` `#aws` `#eks` `#vpc` `#rds` `#devops` `#cloud-architecture`

---

## Repository Structure

```
├── modules/
│   ├── aws-vpc/             # Multi-AZ VPC, NAT Gateways, Public/Private subnets
│   ├── aws-eks/             # Production EKS Cluster with Managed Node Groups
│   └── aws-rds-postgres/    # Multi-AZ Encrypted PostgreSQL RDS instance
├── .github/
│   └── workflows/
│       └── terraform-lint.yml # Automated format & validation CI pipeline
└── README.md
```

## Module Usage Example

```hcl
module "vpc" {
  source              = "./modules/aws-vpc"
  environment         = "production"
  vpc_cidr            = "10.0.0.0/16"
  availability_zones  = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.10.0/24", "10.0.20.0/24"]
}

module "eks" {
  source         = "./modules/aws-eks"
  cluster_name   = "prod-app-cluster"
  subnet_ids     = module.vpc.private_subnet_ids
  instance_types = ["t3.large"]
  desired_size   = 3
}

module "database" {
  source          = "./modules/aws-rds-postgres"
  identifier      = "prod-core-db"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  master_password = var.db_password
}
```
