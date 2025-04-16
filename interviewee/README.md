# Interviewee Module

This module manages IAM policies, user configurations, and resource access controls for the interviewee system.

## Components and Changes

### IAM Policies
- **Resource Access Policies**
  - DynamoDB access policies
  - EC2 instance policies
  - ECR repository policies
  - S3 bucket policies
  - SSM parameter policies

- **Service Roles**
  - Lambda function roles
  - EC2 instance roles
  - ECS task roles
  - API Gateway roles

### User Management
- **User Configuration**
  - User creation and setup
  - Group management
  - Permission assignments
  - Access key management
  - MFA configuration

- **Access Control**
  - Role-based access
  - Permission boundaries
  - Policy attachments
  - Session management
  - Audit logging

## Configuration

### Required Variables
- `environment`: Deployment environment (dev/staging/prod)
- `user_name`: Name of the interviewee user
- `group_name`: Name of the interviewee group
- `policy_name`: Name of the policy
- `role_name`: Name of the IAM role

### Optional Variables
- `enable_mfa`: Enable MFA (default: true)
- `password_required`: Require password (default: true)
- `password_length`: Minimum password length (default: 12)
- `max_session_duration`: Maximum session duration in seconds (default: 3600)
- `enable_access_key`: Enable access key (default: false)

## Usage Example

```hcl
module "interviewee" {
  source = "./interviewee"
  
  environment = "prod"
  user_name = "interview-user"
  group_name = "interview-group"
  policy_name = "interview-policy"
  role_name = "interview-role"
  
  enable_mfa = true
  password_required = true
  password_length = 14
  max_session_duration = 7200
  enable_access_key = true
}
```

## Security Implementation

### IAM Security
- Least privilege access
- Permission boundaries
- Policy validation
- Access key rotation
- Session management

### User Security
- MFA enforcement
- Password policies
- Access key management
- Session duration limits
- Audit logging

### Resource Security
- Resource-level permissions
- Service control policies
- Permission boundaries
- Access logging
- Audit trails

## Best Practices

1. **Access Management**
   - Follow least privilege principle
   - Regular access reviews
   - Implement MFA
   - Rotate credentials
   - Monitor access patterns

2. **Policy Management**
   - Use managed policies
   - Implement permission boundaries
   - Regular policy reviews
   - Document policy changes
   - Test policy changes

3. **User Management**
   - Group-based permissions
   - Regular access reviews
   - Credential rotation
   - Session management
   - Audit logging

## Maintenance

### Regular Tasks
- Access review
- Policy review
- Credential rotation
- Audit log analysis
- Security updates

### Emergency Procedures
- Access revocation
- Policy updates
- Credential rotation
- Incident response
- Audit trail review

## Dependencies

- AWS IAM
- AWS SSM
- AWS CloudWatch
- AWS CloudTrail
- AWS KMS

## Version History

- v1.0.0: Initial release
  - Basic IAM setup
  - Simple user management
  - Basic policies

- v1.1.0: Enhanced Features
  - Advanced policies
  - Group management
  - MFA support

- v1.2.0: Security Improvements
  - Permission boundaries
  - Access logging
  - Audit trails

- v1.3.0: Latest Updates
  - Service roles
  - Resource policies
  - Security enhancements 