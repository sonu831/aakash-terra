output "user_name" {
  value = module.iam_user.iam_user_name
}

output "user_password" {
  sensitive = true
  value = module.iam_user.iam_user_login_profile_password
}

output "access_key_id" {
  sensitive = true
  value = module.iam_user.iam_access_key_id
}

output "secret_access_key" {
  sensitive = true
  value = module.iam_user.iam_access_key_secret
}

output "console_url" {
  value = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}

output "iam_users" {
  description = "List of IAM users created"
  value = {
    for user in aws_iam_user.users : user.name => {
      arn         = user.arn
      access_keys = aws_iam_access_key.keys[user.name].id
    }
  }
}

output "iam_groups" {
  description = "List of IAM groups created"
  value = {
    for group in aws_iam_group.groups : group.name => {
      arn  = group.arn
      users = aws_iam_group_membership.memberships[group.name].users
    }
  }
}

output "iam_policies" {
  description = "List of IAM policies created"
  value = {
    for policy in aws_iam_policy.custom : policy.name => {
      arn  = policy.arn
      name = policy.name
    }
  }
}

output "cross_account_roles" {
  description = "List of cross-account roles created"
  value = {
    for role in aws_iam_role.cross_account : role.name => {
      arn  = role.arn
      name = role.name
    }
  }
}

output "password_policy" {
  description = "Password policy configuration"
  value       = aws_iam_account_password_policy.main
}
