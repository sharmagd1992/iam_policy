data "aws_iam_policy_document" "testforiam" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::testforiam1",
      "arn:aws:s3:::testforiam1/*"
    ]
  }
}

