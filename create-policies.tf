resource "aws_iam_policy" "ec2-admin-policy" {
  name = "ec2-admin-policy"  
  policy = "${file("ec2-admin.json")}"
}