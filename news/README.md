# Application Infrastructure Module

This module manages the application-specific infrastructure including EC2 instances, S3 buckets, and provisioning scripts.

## Components

### EC2 Configuration
- Instance creation
- Auto Scaling
- Load Balancing
- Security groups

### S3 Configuration
- Static website hosting
- Bucket policies
- Lifecycle rules
- Access controls

### Provisioning Scripts
- Docker setup
- Frontend deployment
- Newsfeed service
- Quotes service

## Configuration

### Required Variables
- `environment`: Deployment environment
- `instance_type`: EC2 instance type
- `domain_name`: Website domain name

### Optional Variables
- `min_size`: Minimum ASG size (default: 1)
- `max_size`: Maximum ASG size (default: 3)
- `desired_capacity`: Desired ASG capacity (default: 2)

## Usage

```hcl
module "news" {
  source = "./news"
  
  environment   = "prod"
  instance_type = "t3.medium"
  domain_name   = "example.com"
  
  min_size = 2
  max_size = 4
}
```

## Security

### EC2 Security
- Security groups
- IAM roles
- SSH access
- System updates

### S3 Security
- Bucket policies
- Encryption
- Access logging
- Versioning

### Application Security
- HTTPS enforcement
- WAF rules
- DDoS protection
- Security headers

## Best Practices

1. Use Auto Scaling for availability
2. Implement proper monitoring
3. Regular backups
4. Security updates

## Maintenance

- Regular updates
- Performance monitoring
- Security patches
- Backup verification

## Dependencies

- AWS EC2
- AWS S3
- AWS ELB
- AWS Auto Scaling

## Version History

- v1.0.0: Initial release
- v1.1.0: Added Auto Scaling
- v1.2.0: Enhanced security
- v1.3.0: Added monitoring

## Provisioning Scripts

### Docker Setup
```bash
./provision-docker.sh
```
- Installs Docker
- Configures Docker daemon
- Sets up container networking

### Frontend Deployment
```bash
./provision-front_end.sh
```
- Installs Node.js
- Sets up Nginx
- Configures SSL

### Newsfeed Service
```bash
./provision-newsfeed.sh
```
- Installs dependencies
- Configures service
- Sets up monitoring

### Quotes Service
```bash
./provision-quotes.sh
```
- Installs dependencies
- Configures service
- Sets up monitoring 