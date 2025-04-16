# Base Infrastructure Module

This module provides the foundational AWS infrastructure components including VPC, ECR, and IAM configurations.

## Components

### VPC Configuration
- Multi-AZ deployment
- Public and private subnets
- NAT Gateway
- Internet Gateway
- Route tables
- Security groups

### ECR Setup
- Repository creation
- Lifecycle policies
- Access controls
- Image scanning

### IAM Configuration
- Service roles
- Instance profiles
- Policy attachments
- Permission boundaries

## Configuration

### Required Variables
- `environment`: Deployment environment (dev/staging/prod)
- `vpc_cidr`: VPC CIDR block
- `region`: AWS region

### Optional Variables
- `enable_nat_gateway`: Enable NAT Gateway (default: true)
- `single_nat_gateway`: Use single NAT Gateway (default: false)
- `ecr_scan_on_push`: Enable ECR image scanning (default: true)

## Usage

```hcl
module "base" {
  source = "./base"
  
  environment = "prod"
  vpc_cidr    = "10.0.0.0/16"
  region      = "us-west-2"
}
```

## Security

### VPC Security
- Network ACLs
- Security groups
- Flow logs
- VPC endpoints

### ECR Security
- Repository policies
- Image scanning
- Access controls
- Encryption

### IAM Security
- Least privilege
- Role-based access
- Policy boundaries
- Audit logging

## Best Practices

1. Use separate VPCs for different environments
2. Implement proper subnet sizing
3. Follow security group rules
4. Regular security reviews

## Maintenance

- Regular security updates
- VPC flow log analysis
- IAM policy reviews
- ECR cleanup policies

## Dependencies

- AWS VPC
- AWS ECR
- AWS IAM
- AWS CloudWatch

## Version History

- v1.0.0: Initial release
- v1.1.0: Added ECR support
- v1.2.0: Enhanced security features
- v1.3.0: Added VPC endpoints 