#Updated Configuration Using IAM Policies
#Instead of setting the acl directly, you can define an IAM policy to control access to the bucket.

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket"
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Principal = "*"
        Action   = [
          "s3:GetObject",
        ]
        Resource = [
          "${aws_s3_bucket.example.arn}/*"
        ]
      },
    ]
  })
}
