variable "environment" {
  description = "Deployment environment (dev/staging/prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "domain_name" {
  description = "Website domain name"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS"
  type        = string
  default     = ""
}

variable "enable_https" {
  description = "Enable HTTPS for the website"
  type        = bool
  default     = true
}

variable "enable_waf" {
  description = "Enable WAF protection"
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 30
}

variable "monitoring_interval" {
  description = "CloudWatch monitoring interval in seconds"
  type        = number
  default     = 60
}

variable "alarm_thresholds" {
  description = "Thresholds for CloudWatch alarms"
  type = object({
    cpu_utilization    = number
    memory_utilization = number
    disk_utilization   = number
  })
  default = {
    cpu_utilization    = 80
    memory_utilization = 80
    disk_utilization   = 80
  }
}

variable "docker_image_tag" {
  default = "latest"
}
variable "prefix" {
  type = string
}

