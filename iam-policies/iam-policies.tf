resource "aws_iam_policy" "admin_policy" {
  name        = "admin_policy"
  description = "Full administrator access to EC2, S3, and IAM"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "iam:*"
        ]
        Resource = "*"
      }
    ]
  })
}
