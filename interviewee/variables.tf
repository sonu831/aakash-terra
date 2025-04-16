variable "region" {
  default = "eu-west-1"
}

variable "interviewee_code" {
  type = string

  validation {
    condition     = length(var.interviewee_code) < 16 && can(regex("^[a-zA-Z0-9]+$", var.interviewee_code))
    error_message = "The interviewee_code value must be less than 16 characters long and only contain alphanumeric characters."
  }
}

variable "environment" {
  description = "Deployment environment (dev/staging/prod)"
  type        = string
}

variable "users" {
  description = "List of IAM users to create"
  type = list(object({
    name   = string
    groups = list(string)
  }))
  default = []
}

variable "policies" {
  description = "Map of custom IAM policies"
  type = map(object({
    actions   = list(string)
    resources = list(string)
  }))
  default = {}
}

variable "enable_mfa" {
  description = "Enable MFA for IAM users"
  type        = bool
  default     = true
}

variable "password_policy" {
  description = "Custom password policy configuration"
  type = object({
    minimum_length        = number
    require_numbers       = bool
    require_uppercase     = bool
    require_lowercase     = bool
    require_special_chars = bool
    allow_password_change = bool
    max_password_age     = number
  })
  default = {
    minimum_length        = 12
    require_numbers       = true
    require_uppercase     = true
    require_lowercase     = true
    require_special_chars = true
    allow_password_change = true
    max_password_age     = 90
  }
}

variable "group_memberships" {
  description = "Map of group memberships"
  type        = map(list(string))
  default     = {}
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "cross_account_roles" {
  description = "List of cross-account roles to create"
  type = list(object({
    name           = string
    trusted_account = string
    policy_arns    = list(string)
  }))
  default = []
}