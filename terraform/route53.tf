# claritysoftware.co.uk
resource "aws_route53_zone" "claritySoftwareCoUk" {
  name = "claritysoftware.co.uk"
}

resource "aws_route53_record" "claritySoftwareCoUk-a" {
  zone_id = aws_route53_zone.claritySoftwareCoUk.zone_id
  name    = "claritysoftware.co.uk"
  type    = "A"
  alias {
    name                   = data.aws_cloudfront_distribution.claritySoftwareCoUk.domain_name
    zone_id                = data.aws_cloudfront_distribution.claritySoftwareCoUk.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-claritySoftwareCoUk-a" {
  zone_id = aws_route53_zone.claritySoftwareCoUk.zone_id
  name    = "www.claritysoftware.co.uk"
  type    = "A"
  alias {
    name                   = data.aws_cloudfront_distribution.claritySoftwareCoUk.domain_name
    zone_id                = data.aws_cloudfront_distribution.claritySoftwareCoUk.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "claritySoftwareCoUk-mx" {
  zone_id = aws_route53_zone.claritySoftwareCoUk.zone_id
  name    = "claritysoftware.co.uk"
  type    = "MX"
  records = ["1 aspmx.l.google.com", "10 alt1.aspmx.l.google.com", "20 alt2.aspmx.l.google.com", "30 alt3.aspmx.l.google.com"]
  ttl     = 3600
}

# claritysoftware.solutions
resource "aws_route53_zone" "claritySoftwareSolutions" {
  name = "claritysoftware.solutions"
}

resource "aws_route53_record" "claritySoftwareSolutions-a" {
  zone_id = aws_route53_zone.claritySoftwareSolutions.zone_id
  name    = "claritysoftware.solutions"
  type    = "A"
  alias {
    name                   = data.aws_cloudfront_distribution.claritySoftwareSolutions.domain_name
    zone_id                = data.aws_cloudfront_distribution.claritySoftwareSolutions.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-claritySoftwareSolutions-a" {
  zone_id = aws_route53_zone.claritySoftwareSolutions.zone_id
  name    = "www.claritysoftware.solutions"
  type    = "A"
  alias {
    name                   = data.aws_cloudfront_distribution.claritySoftwareSolutions.domain_name
    zone_id                = data.aws_cloudfront_distribution.claritySoftwareSolutions.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "claritySoftwareSolutions-mx" {
  zone_id = aws_route53_zone.claritySoftwareSolutions.zone_id
  name    = "claritysoftware.solutions"
  type    = "MX"
  records = ["1 aspmx.l.google.com", "10 alt1.aspmx.l.google.com", "20 alt2.aspmx.l.google.com", "30 alt3.aspmx.l.google.com"]
  ttl     = 3600
}

data "aws_route53_zone" "claritySoftwareCoUk" {
  name = aws_route53_zone.claritySoftwareCoUk.name
}
data "aws_route53_zone" "claritySoftwareSolutions" {
  name = aws_route53_zone.claritySoftwareSolutions.name
}
