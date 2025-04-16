# Backend Support Module

This module configures the Terraform backend for state management using AWS S3 and DynamoDB for state locking.

## Purpose

- Centralized state management
- State locking to prevent conflicts
- Environment isolation
- Secure state storage

## Configuration

### Required Variables
- `bucket_name`: S3 bucket name for state storage
- `dynamodb_table`: DynamoDB table name for state locking
- `region`: AWS region for resources

### Optional Variables
- `encrypt`: Enable S3 bucket encryption (default: true)
- `key`: State file path in S3 (default: terraform.tfstate)

## Usage

```hcl
module "backend" {
  source = "./backend-support"
  
  bucket_name     = "terraform-state-bucket"
  dynamodb_table  = "terraform-lock-table"
  region          = "us-west-2"
}
```

## Security

- S3 bucket encryption enabled by default
- IAM policies for state access
- Versioning enabled for state files
- Access logging configured

## Best Practices

1. Use separate state files for different environments
2. Implement state backup procedures
3. Regular state file validation
4. Monitor state file size

## Maintenance

- Regular state file cleanup
- Access review
- Encryption key rotation
- Backup verification

## Troubleshooting

Common issues:
1. State locking conflicts
2. Permission issues
3. State file corruption
4. Version conflicts

## Dependencies

- AWS S3
- AWS DynamoDB
- AWS IAM

## Version History

- v1.0.0: Initial release
- v1.1.0: Added encryption support
- v1.2.0: Implemented state locking 