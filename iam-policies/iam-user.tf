resource "aws_iam_user" "lacardia-users" {
  count = length(var.iamuser)
  name  = element(var.iamuser, count.index)
}

resource "aws_iam_user_policy_attachment" "userpasschange" {
  count      = length(var.iamuser)
  user       = element(aws_iam_user.lacardia-users.*.name, count.index)
  policy_arn = aws_iam_policy.userpasschange.arn
}
resource "aws_iam_user_policy_attachment" "userenableMFADevice" {
  count      = length(var.iamuser)
  user       = element(aws_iam_user.lacardia-users.*.name, count.index)
  policy_arn = aws_iam_policy.userenableMFADevice.arn
}
resource "aws_iam_user_policy_attachment" "userAllowAllEC2Actions" {
  count      = length(var.iamuser)
  user       = element(aws_iam_user.lacardia-users.*.name, count.index)
  policy_arn = aws_iam_policy.userAllowAllEC2Actions.arn
}
resource "aws_iam_user_policy_attachment" "userReadOnlyS3Actions" {
  count      = length(var.iamuser)
  user       = element(aws_iam_user.lacardia-users.*.name, count.index)
  policy_arn = aws_iam_policy.userReadOnlyS3Actions.arn
}

resource "aws_iam_group_membership" "admin_group_membership" {
  count = length(aws_iam_user.lacardia-users)
  group = aws_iam_group.admin_group.name
  name  = aws_iam_group.admin_group.name
  users = [aws_iam_user.lacardia-users[count.index].name]
}

resource "aws_iam_group_policy_attachment" "admin_group_attachment" {
  policy_arn = aws_iam_policy.admin_policy.arn
  group      = aws_iam_group.admin_group.name
}

