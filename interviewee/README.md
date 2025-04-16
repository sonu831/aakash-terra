# IAM and Security Module

This module manages IAM users, roles, and policies for secure access to AWS resources.

## Components

### User Management
- User creation
- Access keys
- Password policies
- MFA configuration

### Policy Management
- DynamoDB policies
- EC2 policies
- ECR policies
- S3 policies
- SSM policies

### Access Control
- Group management
- Role assignments
- Permission boundaries
- Policy attachments

## Configuration

### Required Variables
- `environment`: Deployment environment
- `users`: List of IAM users
- `policies`: Custom policy definitions

### Optional Variables
- `enable_mfa`: Enable MFA (default: true)
- `password_policy`: Custom password policy
- `group_memberships`: User-group assignments

## Usage

```hcl
module "iam" {
  source = "./interviewee"
  
  environment = "prod"
  users = [
    {
      name = "user1"
      groups = ["developers"]
    }
  ]
  policies = {
    s3_read_only = {
      actions = ["s3:GetObject"]
      resources = ["arn:aws:s3:::bucket/*"]
    }
  }
}
```

## Security

### IAM Security
- Least privilege principle
- MFA enforcement
- Password policies
- Access key rotation

### Policy Security
- Resource-based policies
- Service-specific permissions
- Cross-account access
- Audit logging

## Best Practices

1. Use groups for permission management
2. Implement least privilege
3. Regular access reviews
4. Rotate credentials regularly

## Maintenance

- Regular access reviews
- Policy updates
- User management
- Security audits

## Dependencies

- AWS IAM
- AWS SSM
- AWS S3
- AWS DynamoDB

## Version History

- v1.0.0: Initial release
- v1.1.0: Added MFA support
- v1.2.0: Enhanced policy management
- v1.3.0: Added cross-account support 