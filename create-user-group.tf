provider "aws" {
  region     = "us-east-1"
}

resource "aws_iam_user" "new_users" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_group" "new_groups" {
  count = length(var.group)
  name  = element(var.group, count.index)
}

resource "aws_iam_user_login_profile" "test_users" {
  count = length(var.username)
  user = aws_iam_user.new_users[count.index].name
  password_reset_required = false
}

output "password" {
  value =  aws_iam_user_login_profile.test_users.*.password
}
