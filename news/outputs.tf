output "website_url" {
  description = "URL of the website"
  value       = "https://${var.domain_name}"
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.id
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.id
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.news.name
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.news.dns_name
}

output "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.news[*].id
}

output "security_group_ids" {
  description = "List of security group IDs"
  value = {
    web     = aws_security_group.web.id
    backend = aws_security_group.backend.id
  }
}

output "monitoring_alarms" {
  description = "List of CloudWatch alarm ARNs"
  value = {
    cpu    = aws_cloudwatch_metric_alarm.cpu.arn
    memory = aws_cloudwatch_metric_alarm.memory.arn
    disk   = aws_cloudwatch_metric_alarm.disk.arn
  }
} 