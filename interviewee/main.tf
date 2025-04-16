resource "aws_iam_user" "users" {
  for_each = { for user in var.users : user.name => user }

  name = each.value.name

  tags = merge(
    var.tags,
    {
      Name        = each.value.name
      Environment = var.environment
    }
  )
}

resource "aws_iam_group" "groups" {
  for_each = toset(flatten([for user in var.users : user.groups]))

  name = each.value

  tags = merge(
    var.tags,
    {
      Name        = each.value
      Environment = var.environment
    }
  )
}

resource "aws_iam_group_membership" "memberships" {
  for_each = { for group in aws_iam_group.groups : group.name => group }

  name  = each.value.name
  users = [for user in var.users : user.name if contains(user.groups, each.value.name)]
  group = each.value.name
}

resource "aws_iam_policy" "custom" {
  for_each = var.policies

  name        = each.key
  description = "Custom policy for ${each.key}"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = each.value.actions
        Resource = each.value.resources
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name        = each.key
      Environment = var.environment
    }
  )
}

resource "aws_iam_account_password_policy" "main" {
  minimum_password_length        = var.password_policy.minimum_length
  require_numbers                = var.password_policy.require_numbers
  require_uppercase_characters   = var.password_policy.require_uppercase
  require_lowercase_characters   = var.password_policy.require_lowercase
  require_symbols                = var.password_policy.require_special_chars
  allow_users_to_change_password = var.password_policy.allow_password_change
  max_password_age              = var.password_policy.max_password_age
}

resource "aws_iam_role" "cross_account" {
  for_each = { for role in var.cross_account_roles : role.name => role }

  name = each.value.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = each.value.trusted_account
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name        = each.value.name
      Environment = var.environment
    }
  )
}

resource "aws_iam_role_policy_attachment" "cross_account" {
  for_each = { for role in var.cross_account_roles : role.name => role }

  role       = aws_iam_role.cross_account[each.value.name].name
  policy_arn = each.value.policy_arns[0]
} 