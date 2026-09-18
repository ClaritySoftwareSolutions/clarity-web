resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = data.aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.this]
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = data.aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = data.aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.iam-policy-1.json
}
data "aws_iam_policy_document" "iam-policy-1" {
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"
    resources = [
      data.aws_s3_bucket.this.arn,
      "${data.aws_s3_bucket.this.arn}/*",
    ]
    actions = ["S3:GetObject"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  depends_on = [aws_s3_bucket_public_access_block.this]
}
