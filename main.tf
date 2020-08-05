resource "aws_iam_role" "test" {
  name = var.role_name
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}


resource "aws_iam_policy" "testforiampolicy" {
  name   = "test"
  policy = data.aws_iam_policy_document.testforiam.json
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.test.name]
  policy_arn = aws_iam_policy.testforiampolicy.arn
} 
  
