provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "registration" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "admin@claritysoftware.co.uk"
}

# claritysoftware.co.uk
resource "acme_certificate" "claritySoftwareCoUkCert" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = data.aws_route53_zone.claritySoftwareCoUk.name
  subject_alternative_names = ["www.${data.aws_route53_zone.claritySoftwareCoUk.name}"]

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.claritySoftwareCoUk.zone_id
      AWS_REGION = "eu-west-2"
      AWS_TTL = 360
    }
  }

  depends_on = [acme_registration.registration]
}

resource "aws_acm_certificate" "claritySoftwareCoUkCert" {
  certificate_body  = acme_certificate.claritySoftwareCoUkCert.certificate_pem
  private_key       = acme_certificate.claritySoftwareCoUkCert.private_key_pem
  certificate_chain = acme_certificate.claritySoftwareCoUkCert.issuer_pem
  tags = {
    name = data.aws_route53_zone.claritySoftwareCoUk.name
  }
  region = "us-east-1"
}

# claritysoftware.solutions
resource "acme_certificate" "claritySoftwareSolutionsCert" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = data.aws_route53_zone.claritySoftwareSolutions.name
  subject_alternative_names = ["www.${data.aws_route53_zone.claritySoftwareSolutions.name}"]

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.claritySoftwareSolutions.zone_id
      AWS_REGION = "eu-west-2"
      AWS_TTL = 360
    }
  }

  depends_on = [acme_registration.registration]
}

resource "aws_acm_certificate" "claritySoftwareSolutionsCert" {
  certificate_body  = acme_certificate.claritySoftwareSolutionsCert.certificate_pem
  private_key       = acme_certificate.claritySoftwareSolutionsCert.private_key_pem
  certificate_chain = acme_certificate.claritySoftwareSolutionsCert.issuer_pem
  tags = {
    name = data.aws_route53_zone.claritySoftwareSolutions.name
  }
  region = "us-east-1"
}

data "aws_acm_certificate" "claritySoftwareCoUkCert" {
  domain = data.aws_route53_zone.claritySoftwareCoUk.name
  region = "us-east-1"
}
data "aws_acm_certificate" "claritySoftwareSolutionsCert" {
  domain = data.aws_route53_zone.claritySoftwareSolutions.name
  region = "us-east-1"
}
