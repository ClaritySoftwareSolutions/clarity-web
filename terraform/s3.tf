resource "aws_s3_bucket" "bucket" {
  bucket = "clarity-website-prod-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.region}-an"
  bucket_namespace = "account-regional"
}

resource "aws_s3_bucket_website_configuration" "website-config" {
  bucket = aws_s3_bucket.bucket.bucket
  index_document {
    suffix = "index.html"
  }
}

data "aws_s3_bucket" "this" {
  bucket = aws_s3_bucket.bucket.bucket
}
