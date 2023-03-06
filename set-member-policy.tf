resource "aws_iam_group_membership" "EC2-Admin-Membership"{
  name= "EC2-Admin-Membership"
  users = [
    "user-1"
  ]

  group = "EC2-Admin"
}

resource "aws_iam_group_membership" "EC2-Support-Membership"{
  name= "EC2-Support-Membership"
  users = [
    "user-2"
  ]

  group = "EC2-Support"
}

resource "aws_iam_group_membership" "S3-Support-Membership"{
  name= "S3-Support-Membership"
  users = [
    "user-3"
  ]

  group = "S3-Support"
}

resource "aws_iam_group_policy_attachment" "ec2-admin-attach" {
  group      = "EC2-Admin"
  policy_arn = aws_iam_policy.ec2-admin-policy.arn
}

resource "aws_iam_group_policy_attachment" "ec2-support-attach" {
  group      = "EC2-Support"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "s3-support-attach" {
  group      = "S3-Support"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}