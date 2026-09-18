resource "aws_route53_zone" "claritySoftwareSolutions" {
  name = "claritysoftware.solutions"
}

resource "aws_route53_record" "claritySoftwareSolutions-a" {
  zone_id = aws_route53_zone.claritySoftwareSolutions.zone_id
  name    = "claritysoftware.solutions"
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website-config.website_endpoint
    zone_id                = aws_s3_bucket.bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
