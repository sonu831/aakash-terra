# Base Infrastructure Module

This module provides the foundational AWS infrastructure components including VPC, ECR, and IAM configurations. It serves as the core infrastructure layer for the entire application stack.

## Components and Changes

### VPC Configuration
- **Network Architecture**
  - Multi-AZ deployment across 3 availability zones
  - Public and private subnet architecture
  - NAT Gateway setup for private subnet internet access
  - Internet Gateway configuration
  - Custom route tables for traffic management

- **Security Implementation**
  - Network ACLs for subnet-level security
  - Security groups for instance-level protection
  - VPC flow logs for traffic monitoring
  - VPC endpoints for AWS services

### ECR Setup
- **Repository Configuration**
  - Repository creation for container images
  - Lifecycle policies for image management
  - Access controls and permissions
  - Image scanning configuration

- **Security Features**
  - Repository policies
  - Image scanning
  - Access controls
  - Encryption at rest

### IAM Configuration
- **Service Roles**
  - EC2 instance roles
  - Lambda function roles
  - ECS task roles
  - RDS service roles

- **Security Policies**
  - Least privilege access
  - Permission boundaries
  - Policy attachments
  - Audit logging

## Configuration

### Required Variables
- `environment`: Deployment environment (dev/staging/prod)
- `vpc_cidr`: VPC CIDR block
- `region`: AWS region
- `availability_zones`: List of availability zones to use

### Optional Variables
- `enable_nat_gateway`: Enable NAT Gateway (default: true)
- `single_nat_gateway`: Use single NAT Gateway (default: false)
- `ecr_scan_on_push`: Enable ECR image scanning (default: true)
- `create_flow_logs`: Enable VPC flow logs (default: true)

## Usage Example

```hcl
module "base" {
  source = "./base"
  
  environment = "prod"
  vpc_cidr    = "10.0.0.0/16"
  region      = "us-west-2"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  
  enable_nat_gateway = true
  single_nat_gateway = false
  ecr_scan_on_push   = true
  create_flow_logs   = true
}
```

## Security Implementation

### VPC Security
- Network ACLs for subnet-level protection
- Security groups for instance-level security
- Flow logs for traffic monitoring
- VPC endpoints for secure AWS service access

### ECR Security
- Repository policies for access control
- Image scanning for vulnerability detection
- Access controls for user permissions
- Encryption for data at rest

### IAM Security
- Least privilege access
- Role-based access control
- Policy boundaries
- Audit logging

## Best Practices

1. **Network Design**
   - Use separate VPCs for different environments
   - Implement proper subnet sizing
   - Follow security group rules
   - Regular security reviews

2. **Container Management**
   - Implement image lifecycle policies
   - Regular vulnerability scanning
   - Access control reviews
   - Backup strategies

3. **Access Control**
   - Follow least privilege principle
   - Regular policy reviews
   - Implement permission boundaries
   - Monitor access patterns

## Maintenance

### Regular Tasks
- Security updates
- VPC flow log analysis
- IAM policy reviews
- ECR cleanup policies

### Monitoring
- Network traffic monitoring
- Security group changes
- IAM access patterns
- ECR repository usage

## Dependencies

- AWS VPC
- AWS ECR
- AWS IAM
- AWS CloudWatch
- AWS KMS

## Version History

- v1.0.0: Initial release
  - Basic VPC setup
  - Simple ECR configuration
  - Basic IAM roles

- v1.1.0: Enhanced Features
  - Multi-AZ deployment
  - Advanced ECR policies
  - Enhanced IAM configurations

- v1.2.0: Security Improvements
  - VPC flow logs
  - Enhanced security groups
  - Advanced IAM policies

- v1.3.0: Latest Updates
  - VPC endpoints
  - Image scanning
  - Audit logging 