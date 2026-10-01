resource "aws_cloudfront_origin_access_control" "cf-s3-oac" {
  name                              = "CloudFront S3 OAC"
  description                       = "CloudFront S3 OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# claritysoftware.co.uk
resource "aws_cloudfront_distribution" "claritySoftwareCoUk" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = data.aws_s3_bucket.this.bucket_regional_domain_name
    origin_id                = data.aws_s3_bucket.this.id
    origin_access_control_id = aws_cloudfront_origin_access_control.cf-s3-oac.id
  }

  aliases = ["claritysoftware.co.uk", "www.claritysoftware.co.uk"]

  restrictions {
    geo_restriction {
      locations = []
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = data.aws_s3_bucket.this.id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.claritySoftwareCoUkCert.arn
    ssl_support_method  = "sni-only"
  }
}

# claritysoftware.solutions
resource "aws_cloudfront_distribution" "claritySoftwareSolutions" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = data.aws_s3_bucket.this.bucket_regional_domain_name
    origin_id                = data.aws_s3_bucket.this.id
    origin_access_control_id = aws_cloudfront_origin_access_control.cf-s3-oac.id
  }

  aliases = ["claritysoftware.solutions", "www.claritysoftware.solutions"]

  restrictions {
    geo_restriction {
      locations = []
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = data.aws_s3_bucket.this.id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.claritySoftwareSolutionsCert.arn
    ssl_support_method  = "sni-only"
  }
}

data "aws_cloudfront_distribution" "claritySoftwareCoUk" {
  id = aws_cloudfront_distribution.claritySoftwareCoUk.id
}
data "aws_cloudfront_distribution" "claritySoftwareSolutions" {
  id = aws_cloudfront_distribution.claritySoftwareSolutions.id
}
